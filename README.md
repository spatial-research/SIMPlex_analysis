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
├── config.R                       # DATA_ROOT, HDF5 path, shared palettes — edit once per machine
├── .gitignore                     # ignores data/ (heavy) and all generated outputs
├── environment/
│   ├── environment.yml            # main R env (Seurat v5, semla, harmony, RcppML, singlet, …)
│   ├── installed_packages.csv     # complete R package manifest with versions
│   └── renv.lock                  # renv lockfile (exact dependency graph)
├── scripts/                       # all 7 analysis Rmd files
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
│   ├── patient_metadata.csv
│   └── breast_cancer/
│       ├── CTA/                   # patient3–9 computational tissue annotation (Li et al. 2025)
│       ├── visium_histpathology/  # patient1, patient3–9 pathologist spot annotations
│       └── xenium/                # gene-group definitions for patient4 Xenium panel
├── data/                          # Heavy data lives here at runtime; only PLACEHOLDER.md per subdir is git-tracked
│   ├── processed_data/PLACEHOLDER.md      # points to KTH Data Repository for the deposited R objects (~37 GB)
│   ├── raw_data/<cohort>/PLACEHOLDER.md   # FASTQs + H&E images (deposited upon publication)
│   ├── spaceranger/<cohort>/PLACEHOLDER.md
│   ├── cellranger/<cohort>/PLACEHOLDER.md
│   ├── cellbender/<cohort>/PLACEHOLDER.md
│   ├── xenium/<cohort>/PLACEHOLDER.md
│   └── external_references/PLACEHOLDER.md # download URLs for public atlases (Wu BC, Linnarsson, Allen, Cords, snPATHO, …)
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

| sample | patient_ID | assays | subtype |
|--------|------------|--------|---------|
| patient1_55um | patient1 | Visium 55 µm | LuminalA |
| patient2_55um | patient2 | Visium 55 µm | LuminalB(ER) |
| patient4_55um, patient4_HD | patient4 | Visium 55 µm + HD + snRNA + Xenium | **TNBC** |
| patient5_55um, patient5_HD | patient5 | Visium 55 µm + HD + snRNA + Xenium | **TNBC** |
| patient6_55um | patient6 | Visium 55 µm | TNBC |
| patient7_55um | patient7 | Visium 55 µm | LuminalB(ER) |
| patient8_55um | patient8 | Visium 55 µm | LuminalA |
| patient9_55um | patient9 | Visium 55 µm | LuminalB(ER) |
| patient10_55um | patient10 | Visium 55 µm (fresh-frozen, 18 µm) | — |
| pt10_HD | pt10 | Visium HD + snRNA | Prostate cancer |
| pt20_HD | pt20 | Visium HD + snRNA | Prostate cancer |
| mouse_brain A, B | — | Visium 12 µm FF + snRNA | Mouse brain |

Patients 4 and 5 are the deeply multimodal TNBC cases (Visium 55 µm + Visium HD + snRNA + consecutive Xenium). Internal sample IDs map to public patient IDs via `resources/patient_metadata.csv`.

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

Open `config.R` and update two things if needed:

```r
DATA_ROOT <- here::here("data")                                                # default: data/ inside this repo (gitignored)
HDF5_LIB  <- "/home/m.abreumachado/apps/hdf5/lib/libhdf5_hl.so.200"            # path to libhdf5_hl.so.200 on your system
```

### 4. Populate `data/`

`data/` is the heavy-data root. Folder structure is committed via PLACEHOLDER.md files in every subdirectory; the actual contents are gitignored. After cloning a fresh checkout, the directory is empty of data — populate each subdirectory by following its PLACEHOLDER.md:

```bash
find data -name PLACEHOLDER.md
```

The most important one is **`data/processed_data/PLACEHOLDER.md`**, which points to the [KTH Data Repository deposit (DOI `10.71775/kth.jg1wh-kza40`)](https://datarepository.kth.se/records/jg1wh-kza40). Download the archive there and unpack on top of `data/processed_data/` (~37 GB) — that single step gets you to a state where all `analysis_*.rmd` and `mouse_brain/*.Rmd` scripts can run end-to-end without re-running upstream QC.

Layout:

```
data/
├── raw_data/                   # FASTQs + H&E images (deposited upon publication)
├── spaceranger/                # SpaceRanger outputs (Visium 55 µm, HD, mouse brain)
├── cellranger/                 # CellRanger snRNA-seq outputs (awaiting collaborators)
├── cellbender/                 # CellBender-denoised h5 matrices (input to qc_doubletRemoval.rmd)
├── xenium/                     # Full Xenium Analyzer outputs (also under processed_data/breast_cancer/xenium/)
├── external_references/        # Public atlases (Wu BC, Linnarsson, Allen, Cords CAF, snPATHO, 10k mouse forebrain, PCa atlas)
├── processed_data/             # KTH-deposited R objects + processed CSVs (~37 GB)
└── figs/                       # Generated by every script under figs/<provenance>/<analysis>/
```

See `docs/data_availability.md` for the full inventory of what each PLACEHOLDER points to and how to obtain each missing piece.

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
