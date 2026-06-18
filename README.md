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
4. **Run** notebooks cell-by-cell in Jupyter (kernel **R (simplex renv)**) or VS Code with the R extension.

> **Note:** The git checkout tracks directory structure and README files only. Heavy data and figure files are gitignored. The KTH deposit is the canonical source for a complete copy.

---

## Repository layout

```
SIMPlex_analysis/
├── README.md
├── config.R                       # paths, HDF5 library, shared palettes
├── environment/                   # environment.yml, renv.lock, setup.sh, renv/library/
├── scripts/
│   └── jupyter/                   # canonical analysis (11 notebooks)
├── resources/                     # small git-tracked metadata
│   ├── sample_metadata.csv
│   ├── cellbender_summary.csv
│   └── pat4_celltalker_interactions.csv
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
| `scripts/jupyter/qc_doubletRemoval.ipynb` | Extended Data Fig. 2 (BC QC) · Extended Data Fig. 3 (prostate QC) |
| `scripts/jupyter/mouse_brain/qc_metrics.ipynb` | Extended Data Fig. 1b |
| `scripts/jupyter/mouse_brain/sn_analysis.ipynb` | Fig. 1c–f |
| `scripts/jupyter/mouse_brain/spatial_analysis.ipynb` | Fig. 1f · Extended Data Fig. 1c–e |
| `scripts/jupyter/breast_cancer/annotation_majorLevel.ipynb` | Extended Data Fig. 4a |
| `scripts/jupyter/breast_cancer/analysis_majorLevel.ipynb` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `scripts/jupyter/breast_cancer/analysis_cellStateLevel.ipynb` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `scripts/jupyter/prostate_cancer/integrative_prostate.ipynb` | Extended Data Fig. 3 |

**Supplementary / reviewer analyses** (not primary manuscript figures):

| Script | Outputs |
|--------|---------|
| `scripts/jupyter/technical/metrics_comparison.ipynb` | Cross-cohort snRNA QC comparison → `figs/technical/metrics_comparison/` |
| `scripts/jupyter/breast_cancer/extra_exploration.ipynb` | Reviewer-response robustness checks → `figs/review/` |
| `scripts/jupyter/breast_cancer/spaGE.ipynb` | Visium HD SpaGE imputation benchmark → `figs/spaGE/` |

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

Creates the `simplex` conda env (from [`environment/environment.yml`](environment/environment.yml)), installs **SpaGE** at a pinned git commit, restores R packages from [`environment/renv.lock`](environment/renv.lock) into `environment/renv/library/`, writes `.Rprofile`, and registers the Jupyter kernel **R (simplex renv)**. First run can take 30–60+ minutes.

| File | Role |
|------|------|
| `environment/environment.yml` | Conda: R 4.3.3, Python 3.12, numpy/pandas/scipy/scikit-learn, system libraries |
| `environment/renv.lock` | Pinned CRAN / Bioconductor / GitHub R packages (Seurat v5, DoubletFinder >= 2.0.6, …) |
| `environment/spage.lock.json` | Pinned SpaGE git commit ([tabdelaal/SpaGE](https://github.com/tabdelaal/SpaGE)) for spatial gene imputation |
| `environment/setup.sh` | Single entry point for install + restore |

See [`environment/README.md`](environment/README.md) for the full environment layout.

**Other envs:** CellBender v0.3 only — [`environment/cellbender.yml`](environment/cellbender.yml). All R analysis notebooks (including doublet removal) use the `simplex` env with Seurat v5 and DoubletFinder >= 2.0.6 from [`environment/renv.lock`](environment/renv.lock). `spaGE.ipynb` uses the `simplex` conda Python (SpaGE installed via `install_spage.sh`).

### 3. Configure paths

Edit [`config.R`](config.R) if needed — especially `HDF5_LIB` for your system:

```r
DATA_ROOT <- here::here("data")
FIGS_ROOT <- here::here("figs")
HDF5_LIB  <- "/path/to/libhdf5_hl.so.200"   # or NULL to skip
```

### 4. Populate `data/` and `figs/`

After cloning, download the **processed** archive from the [KTH Data Repository](https://datarepository.kth.se/records/jg1wh-kza40) and unpack `data/single_nuclei/`, `data/spatial/`, `data/other/`, and `figs/` into the repo root. That is enough to run the analysis notebooks. Raw FASTQs are deposited **separately** (see [`docs/data_availability.md`](docs/data_availability.md)); a local `data/raw_data/` tree may exist for curation but is not part of the main bundle. Details: [`data/README.md`](data/README.md), [`figs/README.md`](figs/README.md).

**Deposit status:** All processed and raw data layers are complete and barcode-verified. Processed data (`single_nuclei/`, `spatial/`, `other/`, `figs/`) is in the main KTH archive; raw FASTQs and source microscopy (`raw_data/`) are in a separate linked deposit. See [`data/README.md`](data/README.md).

### 5. Run the pipeline

Open the repo in **Jupyter** or **VS Code** with kernel **R (simplex renv)**. With `conda activate simplex`, `.Rprofile` loads the renv library automatically. `spaGE.ipynb` uses the `simplex` conda Python kernel.

Run cell-by-cell. Recommended order:

| # | Script | Environment |
|---|--------|-------------|
| 1 | `scripts/jupyter/qc_doubletRemoval.ipynb` | `simplex` (R) |
| 2 | `scripts/jupyter/technical/metrics_comparison.ipynb` | `simplex` (R) |
| 3 | `scripts/jupyter/breast_cancer/annotation_majorLevel.ipynb` | `simplex` (R) |
| 4 | `scripts/jupyter/breast_cancer/analysis_majorLevel.ipynb` | `simplex` (R) |
| 5 | `scripts/jupyter/breast_cancer/analysis_cellStateLevel.ipynb` | `simplex` (R) |
| 6 | `scripts/jupyter/prostate_cancer/integrative_prostate.ipynb` | `simplex` (R) |
| 7 | `scripts/jupyter/mouse_brain/qc_metrics.ipynb` | `simplex` (R) |
| 8 | `scripts/jupyter/mouse_brain/sn_analysis.ipynb` | `simplex` (R) |
| 9 | `scripts/jupyter/mouse_brain/spatial_analysis.ipynb` | `simplex` (R) |
| 10 | `scripts/jupyter/breast_cancer/extra_exploration.ipynb` | `simplex` (R) |
| 11 | `scripts/jupyter/breast_cancer/spaGE.ipynb` | `simplex` (Python) |

Steps 1–9 reproduce the manuscript figures. Steps 10–11 are supplementary analyses that can be run from deposited cross-patient objects without re-running upstream integration.

Every R notebook starts with `source(here::here("config.R"))`.

---

## Data and code availability

- **Processed data** (matrices, SpaceRanger/Xenium outputs, R objects, annotations) — KTH DOI: [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)
- **Raw sequencing data** — separate public repository (linked from the KTH record; layout mirrors `data/raw_data/`; deposit complete)
- **Public references** — see [`docs/data_availability.md`](docs/data_availability.md)

For questions about reproducing specific figures, see `docs/script_to_figure_map.md`, [`docs/manuscript_figure_map.md`](docs/manuscript_figure_map.md), and section headers in each notebook.
