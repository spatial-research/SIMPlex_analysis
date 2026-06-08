# config.R — paths and shared settings for all analysis scripts.
# Sourced via `source(here::here("config.R"))` after activating the simplex env (see README).

# ---- 1. Root paths ---------------------------------------------------------
DATA_ROOT <- here::here("data")
FIGS_ROOT <- here::here("figs")

SPATIAL_ROOT <- file.path(DATA_ROOT, "spatial")
SN_ROOT      <- file.path(DATA_ROOT, "single_nuclei")
OTHER_ROOT   <- file.path(DATA_ROOT, "other")

SPATIAL_RDS  <- file.path(SPATIAL_ROOT, "r_objects")
SN_RDS       <- file.path(SN_ROOT, "r_objects")
SPACERANGER  <- file.path(SPATIAL_ROOT, "spaceranger")
XENIUM       <- file.path(SPATIAL_ROOT, "xenium")
CELLBENDER   <- file.path(SN_ROOT, "cellbender")
CELLRANGER   <- file.path(SN_ROOT, "cellranger")
EXT_REFS     <- file.path(OTHER_ROOT, "external_references")
CTA_DIR      <- file.path(OTHER_ROOT, "CTA")
HISTO_DIR    <- file.path(OTHER_ROOT, "histpathology_visium")
RESOURCES    <- here::here("resources")

# ---- 2. HDF5 library -------------------------------------------------------
HDF5_LIB <- "/home/m.abreumachado/apps/hdf5/lib/libhdf5_hl.so.200"  # set NULL if not needed
if (!is.null(HDF5_LIB) && file.exists(HDF5_LIB)) {
  dyn.load(HDF5_LIB)
}

# ---- 3. Shared colour palettes --------------------------------------------
COLS_CELLTYPE  <- c("#EAE29CFF", "#6CC382FF", "#E99F69FF", "#CF597EFF",
                    "#EAC17AFF", "#29AD8EFF", "#B2D387FF", "#E4796DFF",
                    "#089392FF")
COLS_SUBTYPE    <- c("#6EA9B0", "#B1A6D1", "#E18A96")
COLS_MALIGNANCY <- c("#84D7E1", "#6ABE8C", "#FF95A8")
COLS_ASSAYS     <- c("#6A5ACD", "#FFA500", "#20B2AA")

# ---- 4. Helper functions ---------------------------------------------------
format_k <- function(x) {
  ifelse(abs(x) >= 1000, paste0(round(x / 1000), "k"), as.character(x))
}
