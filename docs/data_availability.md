# Data availability and external references

Mirrors the manuscript "Code and Data availability" section. Use alongside [`data/README.md`](../data/README.md) to verify your local copy.

## Deposited processed data

**KTH Data Repository** — DOI: [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

Contains: R objects (`.rds`), CTA and histopathology CSVs, Xenium outputs (patients 4, 5), SpaceRanger outputs, CellRanger / CellBender matrices, prostate and mouse brain processed data, and external reference files under `data/other/`.

After download, unpack into the repo:

- `data/single_nuclei/` — CellRanger, CellBender, snRNA RDS
- `data/spatial/` — SpaceRanger, Xenium, Visium Seurat objects
- `data/other/` — external references, CTA, histopathology

Processed layers are present and barcode-verified. The analysis scripts do **not** require raw FASTQs.

## Raw sequencing data (separate deposit)

Raw FASTQs and source microscopy are **not** bundled in the main KTH processed archive. They will be placed in a **separate** public repository upon publication, using the same directory layout as `data/raw_data/` in this project (documented in [`data/README.md`](../data/README.md)). The KTH record will link to that repository.

| Cohort | Modality | Notes |
|--------|----------|--------|
| Breast cancer (patients 1–10) | Visium 55 µm FASTQs | `raw_data/spatial/breast_cancer/55um/` |
| Breast cancer (patients 4, 5) | Visium HD FASTQs | **Pending** (`raw_data/spatial/breast_cancer/HD/` still empty locally) |
| Breast cancer (patients 1–10) | Chromium snRNA-seq FASTQs (55 µm) | Pool-level files under `raw_data/single_nuclei/breast_cancer/*.fastq.gz` |
| Breast cancer (patients 4, 5 HD section snRNA) | Chromium snRNA-seq FASTQs | `visHD_BC_rep1_*` and `visHD_BC_rep2_*` in `raw_data/single_nuclei/breast_cancer/` (multiplex library; flat, same layout as other pools) |
| Breast cancer (patients 4, 5) | Xenium | Processed Analyzer output in main KTH deposit (`data/spatial/xenium/`) |
| Prostate cancer (pt10, pt20) | Visium HD + snRNA-seq FASTQs | `raw_data/spatial/` and `raw_data/single_nuclei/prostate_cancer/` |
| Mouse brain (A, B) | Visium + snRNA-seq FASTQs | `raw_data/spatial/mouse_brain/`, `raw_data/single_nuclei/mouse_brain/` |

No changes to local `data/raw_data/` are required before submission; sequence files stay in place for curation until the separate upload.

## Public reference datasets used

### Breast cancer single-cell atlas — Wu et al. 2021
> Wu SZ *et al.* *Nat. Genet.* 53, 1334–1347 (2021).
- Download: https://singlecell.broadinstitute.org/single_cell/study/SCP1039
- Location: `data/other/external_references/BC_atlas/miniatlas.rds`
- Used by: `analysis_majorLevel.rmd`, `analysis_cellStateLevel.rmd`

### CAF reference — Cords et al. 2023
> Cords L *et al.* *Nat. Commun.* 14, 4294 (2023).
- Download: https://doi.org/10.1038/s41467-023-39762-1
- Location: `data/other/external_references/CAF_Cords2023/BREAST_fibro_tumour.rds`
- Used by: `analysis_cellStateLevel.rmd`

### snPATHO-seq FFPE breast reference — Wang et al. 2024
- Location: `data/other/external_references/snPATHO/4066_snPatho.rds`
- Used by: `analysis_majorLevel.rmd` (Extended Data Fig. 2)

### Mouse brain atlas — Zeisel et al. 2018
- Download: http://mousebrain.org/adolescent/ (SRP135960)
- Location: `data/other/external_references/mouse_brain_atlas/l5_all.loom`
- Used by: `mouse_brain/sn_analysis.Rmd`

### Allen Mouse Cortex — Tasic et al. 2016
- Download: https://portal.brain-map.org/atlases-and-data/rnaseq/mouse-whole-cortex-and-hippocampus-10x
- Location: `data/other/external_references/mouse_brain_atlas/allen_cortex.rds`
- Used by: `mouse_brain/sn_analysis.Rmd`

### 10x Genomics public mouse forebrain FFPE (10k cells)
- Download: https://www.10xgenomics.com/datasets/10k-mouse-forebrain-ffpe-tissue-dissociated-using-gentlemacs-dissociator-singleplex-sample-1-standard
- Location: `data/other/external_references/mouse_forebrain_10x/10k_mouse_forebrain_scFFPE_singleplex_count_sample_filtered_feature_bc_matrix.h5`
- Used by: `mouse_brain/qc_metrics.Rmd`

### 10x Genomics public BC FFPE (320k cells, GEM-X FLEX)
- Download: https://www.10xgenomics.com/datasets/320k_scFFPE_16-plex_GEM-X_FLEX
- Location: `data/other/external_references/10x_BC_FFPE/320k_scFFPE_16-plex_GEM-X_FLEX_BreastCancer1_BC7-8_count_sample_filtered_feature_bc_matrix.h5`
- Used by: `analysis_majorLevel.rmd`

### PCa scRNA-seq atlas (Erickson lab, Oct 2023)
- Location: `data/other/external_references/PCa_atlas/PCa_atlas_annotated_Oct23_update.rds`
- Used by: `prostate_cancer/integrative_prostate.rmd`

## Software versions (from manuscript)

- CellRanger v7.1.0 — GRCh38 2020-A + Human/Mouse Transcriptome Probe Sets v1.0.1
- SpaceRanger (Visium CytAssist + Visium HD)
- CellBender v0.3+
- R 4.4 — see `environment/installed_packages.csv`
- Seurat v5.x (main), Seurat v4 + DoubletFinder v2.0.3 (QC only)
- semla, harmony, RcppML, singlet, igraph, celltalker, CCPlotR, UCell, ggpubr, ggplot2
- QuPath v5.0.1 (CTA generation)
- Scanpy v1.9 — Xenium annotation (Python; outside this R repo)
