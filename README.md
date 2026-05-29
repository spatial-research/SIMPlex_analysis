# SIMPlex Analysis

> **Highly resolved tumor architecture via matched spatial and nucleus transcriptomics from a single tissue section**
> Machado MT\*, He M\*, Alonso Galicia L\*, *et al.*
> Corresponding author: Joakim Lundeberg (KTH Royal Institute of Technology / SciLifeLab)

SIMPlex (**S**ingle-section **I**ntegrated **M**ulti-layer **P**rofiling) generates paired Visium spatial transcriptomics and Chromium snRNA-seq data from the **same 5 µm FFPE section**. This repository contains the analysis code, small reference files, and the configuration needed to regenerate analysis in the paper from the deposited data (KTH Data Repository DOI `10.71775/kth.jg1wh-kza40`).

---

## Repository layout

```
SIMPlex_analysis/
├── README.md
├── config.R                       # DATA_ROOT, FIGS_ROOT, HDF5 path, shared palettes — edit once per machine
├── .gitignore                     # gitignores data files and figure files by extension; directory structure tracked
├── environment/
│   ├── environment.yml            # main R env (Seurat v5, semla, harmony, RcppML, singlet, …)
│   ├── installed_packages.csv     # complete R package manifest with versions
│   └── renv.lock                  # renv lockfile (exact dependency graph)
├── scripts/                       # all 8 analysis Rmd files
│   ├── qc_doubletRemoval.rmd
│   ├── breast_cancer/
│   │   ├── annotation_majorLevel.rmd
│   │   ├── analysis_majorLevel.rmd
│   │   └── analysis_cellStateLevel.rmd
│   ├── prostate_cancer/
│   │   └── integrative_prostate.rmd
│   └── mouse_brain/
│       ├── qc_metrics.Rmd
│       ├── sn_analysis.Rmd
│       └── spatial_analysis.Rmd
├── resources/                     # git-tracked small CSVs (~20 MB total) — metadata, annotations
│   ├── sample_metadata.csv
│   └── breast_cancer/
│       ├── CTA/                   # patient3–9 computational tissue annotation (Li et al. 2025)
│       ├── visium_histpathology/  # patient1, patient3–9 pathologist spot annotations
│       └── xenium/                # gene-group definitions for patient4 Xenium panel
├── data/                          # Heavy data root — directory structure git-tracked, files gitignored
│   ├── README.md                  # points to KTH Data Repository DOI
│   ├── r_objects/                 # KTH-deposited R objects (~37 GB) — see r_objects/README.md
│   ├── external_references/       # Public atlases (Wu BC, Linnarsson, Allen, Cords, snPATHO, …)
│   ├── spaceranger/               # SpaceRanger outputs (Visium 55 µm, HD, mouse brain)
│   ├── cellranger/                # CellRanger snRNA-seq outputs
│   ├── cellbender/                # CellBender-denoised h5 matrices
│   ├── raw_data/                  # FASTQs + H&E images (deposited upon publication)
│   └── xenium/                    # Full Xenium Analyzer outputs
├── figs/                          # Generated figures — directory tracked, figure files gitignored by extension
└── docs/
    ├── script_to_figure_map.md    # detailed script ↔ figure mapping with manuscript callouts
    └── data_availability.md       # public DOI, raw-data status, external-reference download instructions
```

---

## Script → Figure mapping

| Script | Manuscript figures |
|--------|--------------------|
| `qc_doubletRemoval.rmd` | Extended Data Fig. 2 (BC QC) · Extended Data Fig. 3 (prostate QC) |
| `mouse_brain/qc_metrics.Rmd` | Extended Data Fig. 1b |
| `mouse_brain/sn_analysis.Rmd` | Fig. 1c–f (mouse brain snRNA-seq, label transfer) |
| `mouse_brain/spatial_analysis.Rmd` | Fig. 1f · Extended Data Fig. 1c–e |
| `breast_cancer/annotation_majorLevel.rmd` | Extended Data Fig. 4a (per-sample annotation) |
| `breast_cancer/analysis_majorLevel.rmd` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `breast_cancer/analysis_cellStateLevel.rmd` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `prostate_cancer/integrative_prostate.rmd` | Extended Data Fig. 3 |

See `docs/script_to_figure_map.md` for a per-figure narrative.

---

## Cohort

| sample | patient_ID | assays | subtype | notes |
|--------|------------|--------|---------|-------|
| patient1_55um | patient1 | Visium 55 µm | LuminalA | |
| patient2_55um | patient2 | Visium 55 µm | LuminalB(ER) | |
| patient4_55um | patient4 | Visium 55 µm | **TNBC** | |
| patient4_HD | patient4 | Visium HD + snRNA | **TNBC** | consecutive section |
| patient5_55um | patient5 | Visium 55 µm | **TNBC** | |
| patient5_HD | patient5 | Visium HD + snRNA + Xenium | **TNBC** | consecutive section |
| patient6_55um | patient6 | Visium 55 µm | TNBC | |
| patient7_55um | patient7 | Visium 55 µm | LuminalB(ER) | |
| patient8_55um | patient8 | Visium 55 µm | LuminalA | |
| patient9_55um | patient9 | Visium 55 µm | LuminalB(ER) | |
| patient10_55um | patient10 | Visium 55 µm | unknown | fresh-frozen 18 µm; not in integrative analysis |
| pt10_HD | pt10 | Visium HD + snRNA | Prostate cancer | |
| pt20_HD | pt20 | Visium HD + snRNA | Prostate cancer | |
| A | A | Visium + snRNA | Mouse brain | |
| B | B | Visium + snRNA | Mouse brain | |

Patients 4 and 5 are the deeply multimodal TNBC cases (Visium 55 µm + Visium HD + snRNA + consecutive Xenium). Full sample metadata is in `resources/sample_metadata.csv`. Patient 3 appears in CTA and histopathology annotations (`resources/breast_cancer/`) but is not included in the integrative snRNA analysis.

---

## Deconvolution reference strategies (Fig. 2, Extended Data Fig. 4–6)

The paper benchmarks four deconvolution references stored side-by-side as named assays on each Visium Seurat object:

| Strategy | Assay name | Reference nuclei used |
|----------|------------|------------------------|
| **SIMPlex** (section-matched) | `patspec_major_map` | The patient's own snRNA-seq from the *same* section |
| **Pooled SIMPlex** | `simplex_major_map`  | All SIMPlex nuclei pooled across patients |
| **Technical Control** | `control_major_map`  | Pooled nuclei from all *other* patients (excludes matched case) |
| **BC Atlas** | `garvan_major_map`   | Wu et al. 2021 public breast cancer scRNA-seq atlas |

Computational Tissue Annotation (**CTA**, Li et al. 2025, *npj Precis. Oncol.*) provides an orthogonal image-based ground truth via QuPath cell segmentation on H&E (data tracked under `resources/breast_cancer/CTA/`).

---

## Setup

### 1. Clone and initialise

```bash
git clone https://github.com/spatial-research/SIMPlex_analysis.git
cd SIMPlex_analysis
# `here::here()` automatically anchors on the cloned git root.
```

### 2. Install the R/conda environment

```bash
# Main analysis env (all scripts except qc_doubletRemoval.rmd)
conda env create -f environment/environment.yml

# Seurat v4 env (only qc_doubletRemoval.rmd — DoubletFinder dependency)
conda env create -f environment/environment-seurat4.yml   # see comment below if not yet present
```

If `environment-seurat4.yml` is not in your copy, the QC script will run under any env where `Seurat v4` and `DoubletFinder` are available. The other scripts all run under `simplex` (Seurat v5).

### 3. Configure paths

Open `config.R` and update if needed:

```r
DATA_ROOT <- here::here("data")    # heavy data root (R objects, references, pipeline outputs)
FIGS_ROOT <- here::here("figs")    # figure output root
HDF5_LIB  <- "/home/m.abreumachado/apps/hdf5/lib/libhdf5_hl.so.200"  # path to libhdf5_hl.so.200 on your system
```

### 4. Populate `data/`

`data/` is the heavy-data root. The directory structure is git-tracked; actual data files are gitignored by extension. After cloning a fresh checkout, populate from the KTH deposit (see `data/README.md`).

The most important step is downloading **`data/r_objects/`** from the [KTH Data Repository (DOI `10.71775/kth.jg1wh-kza40`)](https://datarepository.kth.se/records/jg1wh-kza40) (~37 GB) — that single step lets all `analysis_*.rmd` and `mouse_brain/*.Rmd` scripts run end-to-end.

Generated figures are written to **`figs/`** at the repository root (directory tracked in git; figure files ignored by extension — see `figs/README.md`).

See `docs/data_availability.md` for the full inventory and external-reference download instructions.

### 5. Run the pipeline

Each script is designed to be run chunk-by-chunk in RStudio. Recommended order:

| # | Script | Environment |
|---|--------|-------------|
| 1 | `scripts/qc_doubletRemoval.rmd` | `simplex-seurat4` |
| 2 | `scripts/breast_cancer/annotation_majorLevel.rmd` | `simplex` |
| 3 | `scripts/breast_cancer/analysis_majorLevel.rmd` | `simplex` |
| 4 | `scripts/breast_cancer/analysis_cellStateLevel.rmd` | `simplex` |
| 5 | `scripts/prostate_cancer/integrative_prostate.rmd` | `simplex` |
| 6 | `scripts/mouse_brain/qc_metrics.Rmd` | `simplex` |
| 7 | `scripts/mouse_brain/sn_analysis.Rmd` | `simplex` (initial chunks in `simplex-seurat4` for DoubletFinder) |
| 8 | `scripts/mouse_brain/spatial_analysis.Rmd` | `simplex` |

Every script begins with `source(here::here("config.R"))`, so `DATA_ROOT`, the HDF5 library, and the shared colour palettes are loaded automatically.

---

## Data and code availability

Processed data (R objects, H&E images, deconvolution maps, Xenium outputs) — KTH Data Repository DOI: `10.71775/kth.jg1wh-kza40`.
Raw sequencing data (FASTQs, raw imaging) — will be deposited in a public archive upon publication.
Public reference datasets — see `docs/data_availability.md` for download URLs (Wu et al. 2021 BC atlas, Linnarsson mouse brain atlas, Allen mouse cortex, 10x public mouse forebrain FFPE, Cords et al. 2023 CAF reference, snPATHO-seq FFPE reference).

For questions about reproducing specific figures, see `docs/script_to_figure_map.md` and the chunk-level subtitles inside each Rmd.
