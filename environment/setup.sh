#!/usr/bin/env bash
# One-step setup: conda env + renv restore + Jupyter kernel.
# Usage: bash environment/setup.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if ! command -v conda >/dev/null 2>&1; then
  echo "conda not found in PATH" >&2
  exit 1
fi

# shellcheck source=/dev/null
source "$(conda info --base)/etc/profile.d/conda.sh"

if ! conda env list | awk '{print $1}' | grep -qx simplex; then
  echo "Creating conda env 'simplex' ..."
  conda env create -f environment/environment.yml
fi

conda activate simplex
echo "Using R: $(which R) ($(R --version | head -1))"

unset RENV_PATHS_PREFIX RENV_PATHS_LIBRARY RENV_PATHS_LIBRARY_ROOT
env -u RENV_PATHS_PREFIX -u RENV_PATHS_LIBRARY -u RENV_PATHS_LIBRARY_ROOT \
  Rscript --vanilla - "$REPO_ROOT" "$@" <<'RSCRIPT'
args <- commandArgs(trailingOnly = TRUE)
repo_root <- normalizePath(args[[1L]], winslash = "/", mustWork = TRUE)
kernel_only <- "--kernel-only" %in% args

setwd(repo_root)
lockfile <- file.path(repo_root, "environment", "renv.lock")
renv_dir <- file.path(repo_root, "environment", "renv")
if (!file.exists(lockfile)) stop("Missing ", lockfile, call. = FALSE)

Sys.unsetenv(c("RENV_PATHS_PREFIX", "RENV_PATHS_LIBRARY", "RENV_PATHS_LIBRARY_ROOT"))
Sys.setenv(
  RENV_PROJECT = repo_root,
  RENV_PATHS_PREFIX = "",
  RENV_PATHS_PREFIX_AUTO = "FALSE",
  RENV_PATHS_RENV = renv_dir,
  RENV_PATHS_LOCKFILE = lockfile
)

activate_renv <- function() {
  activate <- file.path(renv_dir, "activate.R")
  if (file.exists(activate)) source(activate)
  lib <- file.path(
    renv_dir, "library",
    sprintf("R-%s", getRversion()[1, 1:2]),
    R.version$platform
  )
  if (dir.exists(lib)) .libPaths(c(lib, .libPaths()))
  .libPaths(.libPaths()[!grepl("/renv-library/", .libPaths(), fixed = TRUE)])
  conda_r_lib <- file.path(Sys.getenv("CONDA_PREFIX"), "lib/R/library")
  if (nzchar(Sys.getenv("CONDA_PREFIX")) && dir.exists(conda_r_lib)) {
    .libPaths(c(.libPaths(), conda_r_lib))
  }
  lib
}

if (!requireNamespace("renv", quietly = TRUE)) {
  stop("Package 'renv' not found — activate the simplex conda env.", call. = FALSE)
}

options(repos = c(CRAN = "https://mirror.accum.se/mirror/CRAN"))
renv::settings$bioconductor.version("3.18")

if (!file.exists(file.path(renv_dir, "activate.R"))) {
  message("Initializing renv ...")
  renv::init(bare = TRUE, restart = FALSE)
}

lib_path <- activate_renv()
stale <- file.path(lib_path, "srv")
if (dir.exists(stale)) unlink(stale, recursive = TRUE)

writeLines(
  c(
    "root <- normalizePath(\".\", winslash = \"/\")",
    "renv_dir <- file.path(root, \"environment\", \"renv\")",
    "Sys.unsetenv(c(\"RENV_PATHS_PREFIX\", \"RENV_PATHS_LIBRARY\", \"RENV_PATHS_LIBRARY_ROOT\"))",
    "Sys.setenv(",
    "  RENV_PROJECT = root,",
    "  RENV_PATHS_PREFIX = \"\",",
    "  RENV_PATHS_PREFIX_AUTO = \"FALSE\",",
    "  RENV_PATHS_RENV = renv_dir,",
    "  RENV_PATHS_LOCKFILE = file.path(root, \"environment\", \"renv.lock\")",
    ")",
    "activate <- file.path(renv_dir, \"activate.R\")",
    "if (file.exists(activate)) source(activate)",
    "lib <- file.path(renv_dir, \"library\", sprintf(\"R-%s\", getRversion()[1, 1:2]), R.version$platform)",
    "if (dir.exists(lib)) .libPaths(c(lib, .libPaths()))",
    ".libPaths(.libPaths()[!grepl(\"/renv-library/\", .libPaths(), fixed = TRUE)])",
    "conda_r_lib <- file.path(Sys.getenv(\"CONDA_PREFIX\"), \"lib/R/library\")",
    "if (nzchar(Sys.getenv(\"CONDA_PREFIX\")) && dir.exists(conda_r_lib)) .libPaths(c(.libPaths(), conda_r_lib))"
  ),
  file.path(repo_root, ".Rprofile")
)
writeLines(
  c("RENV_PATHS_PREFIX=", "RENV_PATHS_PREFIX_AUTO=FALSE"),
  file.path(repo_root, ".Renviron")
)

restore <- function(pkgs = NULL, rebuild = FALSE) {
  if (is.null(pkgs)) renv::restore(prompt = FALSE, rebuild = rebuild)
  else renv::restore(packages = pkgs, prompt = FALSE, rebuild = rebuild)
}

if (!kernel_only) {
  all_pkgs <- names(renv::lockfile_read(lockfile)$Packages)
  arrow_stack <- c("arrow", "fgsea", "singlet")

  if (length(list.files(lib_path)) < 50L) {
    message("Restoring R packages (first run may take 30–60+ min) ...")
    restore(setdiff(all_pkgs, arrow_stack), rebuild = TRUE)
  }

  Sys.setenv(PKG_CXXFLAGS = "-std=gnu++14")
  for (pkg in arrow_stack) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message("Installing ", pkg, " ...")
      tryCatch(restore(pkg, rebuild = TRUE), error = function(e) {
        message(pkg, ": ", conditionMessage(e))
      })
    }
  }

  for (p in c("here", "Seurat", "semla")) {
    if (!requireNamespace(p, quietly = TRUE)) stop("Missing package: ", p, call. = FALSE)
  }
  source("config.R")
  message("Analysis packages OK (", length(list.files(lib_path)), " in renv library).")
}

if (!requireNamespace("IRkernel", quietly = TRUE)) {
  stop("IRkernel not found in conda env.", call. = FALSE)
}

kernel_name <- "simplex-renv"
IRkernel::installspec(name = kernel_name, displayname = "R (simplex renv)", user = TRUE)

kernel_json <- file.path(Sys.getenv("HOME"), ".local/share/jupyter/kernels", kernel_name, "kernel.json")
spec <- jsonlite::fromJSON(kernel_json)
kern_env <- spec$env
if (is.null(kern_env)) kern_env <- list()
spec$env <- c(
  as.list(kern_env),
  list(
    RENV_PROJECT = repo_root,
    RENV_PATHS_PREFIX = "",
    RENV_PATHS_PREFIX_AUTO = "FALSE",
    RENV_PATHS_RENV = renv_dir,
    RENV_PATHS_LOCKFILE = lockfile
  )
)
jsonlite::write_json(spec, kernel_json, auto_unbox = TRUE, pretty = TRUE)
message("Jupyter kernel: R (simplex renv)")
RSCRIPT

echo ""
echo "Done.  conda activate simplex"
echo "       Open this repo in R / Jupyter (kernel: R (simplex renv))"
