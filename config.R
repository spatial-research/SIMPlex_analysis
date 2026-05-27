# config.R — single source of truth for paths, environment, and shared settings.
# Sourced at the top of every analysis script via `source(here::here("config.R"))`.
#
# This file lets you run the pipeline end-to-end with a single configuration:
# point `DATA_ROOT` at the directory that holds raw inputs, processed objects,
# external references, and figure outputs. Everything else (sample names,
# palettes, library locations) is derived from here.

# ---- 1. DATA_ROOT ----------------------------------------------------------
# Heavy data (FASTQs, SpaceRanger/CellRanger outputs, R objects, figures) is
# expected at DATA_ROOT. The default below points at `data/` inside this
# repository (gitignored). Override if your data lives elsewhere.
#
# Note: small git-tracked metadata (sample_metadata.csv, CTA, visium_histpathology,
# Xenium gene_groups) lives in `resources/` (loaded directly via here::here()).
DATA_ROOT <- here::here("data")
FIGS_ROOT <- here::here("figs")

# ---- 2. HDF5 library -------------------------------------------------------
# Some Seurat/semla operations require a specific HDF5 build. Set HDF5_LIB to
# the libhdf5_hl shared object path on your machine. Leave NULL to skip.
HDF5_LIB <- "/home/m.abreumachado/apps/hdf5/lib/libhdf5_hl.so.200"
if (!is.null(HDF5_LIB) && file.exists(HDF5_LIB)) {
  dyn.load(HDF5_LIB)
}

# ---- 3. Shared colour palettes --------------------------------------------
# Used across breast/prostate analysis scripts. Single source of truth so
# figure colours stay consistent across the manuscript.
COLS_CELLTYPE  <- c("#EAE29CFF", "#6CC382FF", "#E99F69FF", "#CF597EFF",
                    "#EAC17AFF", "#29AD8EFF", "#B2D387FF", "#E4796DFF",
                    "#089392FF")
COLS_SUBTYPE    <- c("#6EA9B0", "#B1A6D1", "#E18A96")
COLS_MALIGNANCY <- c("#84D7E1", "#6ABE8C", "#FF95A8")
COLS_ASSAYS     <- c("#6A5ACD", "#FFA500", "#20B2AA")

# ---- 4. Helper functions ---------------------------------------------------
# Format numbers >= 1000 with a `k` suffix (used in QC plots — referenced by
# analysis_majorLevel.rmd and analysis_cellStateLevel.rmd).
format_k <- function(x) {
  ifelse(abs(x) >= 1000, paste0(round(x / 1000), "k"), as.character(x))
}
