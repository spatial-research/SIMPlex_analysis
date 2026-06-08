# SIMPlex Analysis

> **Highly resolved tumor architecture via matched spatial and nucleus transcriptomics from a single tissue section**
> Machado MT\*, He M\*, Alonso Galicia L\*, *et al.*
> Corresponding author: Joakim Lundeberg (KTH Royal Institute of Technology / SciLifeLab)

SIMPlex (**S**ingle-section **I**ntegrated **M**ulti-layer **P**rofiling) generates paired Visium spatial transcriptomics and Chromium snRNA-seq from the **same 5 µm FFPE section**. This repository holds the analysis code and small metadata files needed to reproduce the paper figures from the deposited data ([KTH DOI `10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)).

---

## Quick start

1. **Clone** this repository.
2. **Install** the analysis environment: `bash environment/setup.sh` (see [Setup](#setup)).
3. **Download** the KTH archive and unpack `data/` and `figs/` on top of the repo root (see [`data/README.md`](data/README.md) and [`figs/README.md`](figs/README.md)).
4. **Run** scripts chunk-by-chunk in RStudio or Jupyter.

> **Note:** The git checkout tracks directory structure and README files only. Heavy data and figure files are gitignored. The KTH deposit is the canonical source for a complete copy.

---

## Repository layout

```
SIMPlex_analysis/
├── README.md
├── config.R                       # paths, HDF5 library, shared palettes
├── environment/                   # environment.yml, renv.lock, setup.sh, renv/library/
├── scripts/
│   ├── rmd/                       # canonical analysis (8 R Markdown files)
│   └── jupyter/                   # Jupyter exports (kernel: R (simplex renv))
├── resources/                     # small git-tracked metadata
│   ├── sample_metadata.csv
│   └── human_lr_pair.txt
├── data/                          # heavy data — structure tracked, files gitignored
│   ├── raw_data/                  # FASTQs + microscopy (separate sequence deposit; optional locally)
│   ├── single_nuclei/             # CellRanger, CellBender, snRNA RDS  ← main deposit
│   ├── spatial/                   # SpaceRanger, Xenium, Visium/HD Seurat objects
│   └── other/                     # external references, CTA, histopathology
├── figs/                          # script outputs — structure tracked, files gitignored
└── docs/
    ├── script_to_figure_map.md
    └── data_availability.md
```

---

## Script → Figure mapping

| Script | Manuscript figures |
|--------|--------------------|
| `scripts/rmd/qc_doubletRemoval.rmd` | Extended Data Fig. 2 (BC QC) · Extended Data Fig. 3 (prostate QC) |
| `scripts/rmd/mouse_brain/qc_metrics.Rmd` | Extended Data Fig. 1b |
| `scripts/rmd/mouse_brain/sn_analysis.Rmd` | Fig. 1c–f |
| `scripts/rmd/mouse_brain/spatial_analysis.Rmd` | Fig. 1f · Extended Data Fig. 1c–e |
| `scripts/rmd/breast_cancer/annotation_majorLevel.rmd` | Extended Data Fig. 4a (outputs not in current `figs/` deposit) |
| `scripts/rmd/breast_cancer/analysis_majorLevel.rmd` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `scripts/rmd/breast_cancer/analysis_cellStateLevel.rmd` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `scripts/rmd/prostate_cancer/integrative_prostate.rmd` | Extended Data Fig. 3 |

See [`docs/script_to_figure_map.md`](docs/script_to_figure_map.md) for a per-panel narrative.

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
| patient10_55um | patient10 | Visium 55 µm + snRNA | unknown | fresh-frozen specimen (std Visium); not in the FFPE integrative analysis |
| pt10_HD | pt10 | Visium HD + snRNA | Prostate cancer | |
| pt20_HD | pt20 | Visium HD + snRNA | Prostate cancer | |
| A | A | Visium + snRNA | Mouse brain | |
| B | B | Visium + snRNA | Mouse brain | |

Patients 4 and 5 are the deeply multimodal TNBC cases. Full metadata: [`resources/sample_metadata.csv`](resources/sample_metadata.csv). Patient 3 has CTA and histopathology annotations in `data/other/` but is not in the integrative snRNA analysis.

---

## Deconvolution reference strategies (Fig. 2, Extended Data Fig. 4–6)

Four deconvolution references are stored as named assays on each Visium Seurat object:

| Strategy | Assay name | Reference nuclei used |
|----------|------------|------------------------|
| **SIMPlex** (section-matched) | `patspec_major_map` | Patient's own snRNA-seq from the *same* section |
| **Pooled SIMPlex** | `simplex_major_map` | All SIMPlex nuclei pooled across patients |
| **Technical Control** | `control_major_map` | Pooled nuclei from all *other* patients |
| **BC Atlas** | `garvan_major_map` | Wu et al. 2021 public breast cancer atlas |

Computational Tissue Annotation (**CTA**, Li et al. 2025) provides image-based ground truth via QuPath on H&E (`data/other/CTA/`).

---

## Setup

### 1. Clone

```bash
git clone https://github.com/spatial-research/SIMPlex_analysis.git
cd SIMPlex_analysis
```

### 2. Install environment

```bash
bash environment/setup.sh
conda activate simplex
```

Creates the `simplex` conda env (from [`environment/environment.yml`](environment/environment.yml)), restores R packages from [`environment/renv.lock`](environment/renv.lock) into `environment/renv/library/`, writes `.Rprofile`, and registers the Jupyter kernel **R (simplex renv)**. First run can take 30–60+ minutes.

| File | Role |
|------|------|
| `environment/environment.yml` | Conda: R 4.3.3, system libraries, Jupyter |
| `environment/renv.lock` | Pinned CRAN / Bioconductor / GitHub R packages (Seurat v5, DoubletFinder >= 2.0.6, …) |
| `environment/setup.sh` | Single entry point for install + restore |

**Other envs:** CellBender v0.3 only — [`environment/cellbender.yml`](environment/cellbender.yml). All R analysis scripts (including doublet removal) use the `simplex` env with Seurat v5 and DoubletFinder >= 2.0.6 from [`environment/renv.lock`](environment/renv.lock).

### 3. Configure paths

Edit [`config.R`](config.R) if needed — especially `HDF5_LIB` for your system:

```r
DATA_ROOT <- here::here("data")
FIGS_ROOT <- here::here("figs")
HDF5_LIB  <- "/path/to/libhdf5_hl.so.200"   # or NULL to skip
```

### 4. Populate `data/` and `figs/`

After cloning, download the **processed** archive from the [KTH Data Repository](https://datarepository.kth.se/records/jg1wh-kza40) and unpack `data/single_nuclei/`, `data/spatial/`, `data/other/`, and `figs/` into the repo root. That is enough to run the analysis scripts. Raw FASTQs are deposited **separately** (see [`docs/data_availability.md`](docs/data_availability.md)); a local `data/raw_data/` tree may exist for curation but is not part of the main bundle. Details: [`data/README.md`](data/README.md), [`figs/README.md`](figs/README.md).

**Submission readiness:** Processed layers are present and barcode-verified. Raw sequence data is a separate deposit; HD section snRNA FASTQs are `visHD_BC_rep1_*` / `visHD_BC_rep2_*` alongside the other pools in `data/raw_data/single_nuclei/breast_cancer/`. Still pending: HD **spatial** FASTQs and patient10 source TIFFs. See [`data/README.md`](data/README.md).

### 5. Run the pipeline

Open the repo in **RStudio** (or Jupyter — kernel **R (simplex renv)** under `scripts/jupyter/`). With `conda activate simplex`, `.Rprofile` loads the renv library automatically.

Run chunk-by-chunk. Recommended order:

| # | Script | Environment |
|---|--------|-------------|
| 1 | `scripts/rmd/qc_doubletRemoval.rmd` | `simplex` |
| 2 | `scripts/rmd/breast_cancer/annotation_majorLevel.rmd` | `simplex` |
| 3 | `scripts/rmd/breast_cancer/analysis_majorLevel.rmd` | `simplex` |
| 4 | `scripts/rmd/breast_cancer/analysis_cellStateLevel.rmd` | `simplex` |
| 5 | `scripts/rmd/prostate_cancer/integrative_prostate.rmd` | `simplex` |
| 6 | `scripts/rmd/mouse_brain/qc_metrics.Rmd` | `simplex` |
| 7 | `scripts/rmd/mouse_brain/sn_analysis.Rmd` | `simplex` |
| 8 | `scripts/rmd/mouse_brain/spatial_analysis.Rmd` | `simplex` |

Every script starts with `source(here::here("config.R"))`. Jupyter notebooks mirror the Rmd files; use the same data layout and kernel.

---

## Data and code availability

- **Processed data** (matrices, SpaceRanger/Xenium outputs, R objects, annotations) — KTH DOI: [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)
- **Raw sequencing data** — separate public repository upon publication (linked from the KTH record; layout mirrors `data/raw_data/`)
- **Public references** — see [`docs/data_availability.md`](docs/data_availability.md)

For questions about reproducing specific figures, see `docs/script_to_figure_map.md`, [`docs/manuscript_figure_map.md`](docs/manuscript_figure_map.md), and chunk subtitles in each Rmd.
