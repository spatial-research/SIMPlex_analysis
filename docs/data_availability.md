# Data availability and external references

Mirrors the manuscript's "Code and Data availability" section (page 16). Run alongside the PLACEHOLDER.md files in `data/<subdir>/` to verify your local copy is complete.

## Deposited processed data

**KTH Data Repository** — DOI: `10.71775/kth.jg1wh-kza40`
https://datarepository.kth.se/records/jg1wh-kza40

Contains: R object files (.rds), H&E images, all small CSVs (also git-tracked under `resources/` in this repo), full Xenium Analyzer outputs for patient 4 and patient 5, mouse brain SpaceRanger outputs (A, B), prostate HD R objects.

This deposit has already been copied into `data/processed_data/` (37 GB). If you need to re-populate from a fresh download, unpack the KTH archive over `data/processed_data/` (see README §4).

## Raw sequencing data

| Cohort | Modality | Status |
|--------|----------|--------|
| Breast cancer (patients 1–10) | Visium 55 µm FASTQs | Not yet deposited |
| Breast cancer (patients 4, 5) | Visium HD FASTQs | Not yet deposited |
| Breast cancer (patients 4, 5) | Chromium snRNA-seq FASTQs | Not yet deposited |
| Breast cancer (patients 4, 5) | Xenium raw outputs | Provided as processed Xenium Analyzer output in KTH deposit |
| Prostate cancer (pt10, pt20) | Visium HD + snRNA-seq FASTQs | Not yet deposited |
| Mouse brain (A, B) | Visium + snRNA-seq FASTQs | Not yet deposited |

Raw sequence data will be uploaded to a public repository upon publication.

## Public reference datasets used

### Breast cancer single-cell atlas — Wu et al. 2021
> Wu SZ *et al.* A single-cell and spatially resolved atlas of human breast cancers. *Nat. Genet.* 53, 1334–1347 (2021).
- Download: https://singlecell.broadinstitute.org/single_cell/study/SCP1039
- Place at: `data/external_references/BC_atlas/miniatlas.rds`
- Used by: `analysis_majorLevel.rmd` (deconvolution `garvan_major_map`), `analysis_cellStateLevel.rmd` (subset references)

### CAF reference — Cords et al. 2023
> Cords L *et al.* Cancer-associated fibroblast classification in single-cell and spatial proteomics data. *Nat. Commun.* 14, 4294 (2023).
- Download: see https://doi.org/10.1038/s41467-023-39762-1 supplementary data
- Place at: `data/external_references/CAF_Cords2023/BREAST_fibro_tumour.rds`
- Used by: `analysis_cellStateLevel.rmd` (CAF subpopulation comparison)

### snPATHO-seq FFPE breast reference — Wang et al. 2024
> Wang T *et al.* snPATHO-seq, a versatile FFPE single-nucleus RNA sequencing method to unlock pathology archives. *Commun. Biol.* 7, 1340 (2024).
- Place at: `data/external_references/snPATHO/4066_snPatho.rds`
- Used by: `analysis_majorLevel.rmd` (FFPE QC comparator in Extended Data Fig. 2)

### Mouse brain atlas — Zeisel et al. 2018
> Zeisel A *et al.* Molecular Architecture of the Mouse Nervous System. *Cell* 174, 999–1014 (2018).
- Download: http://mousebrain.org/adolescent/ (SRA accession SRP135960)
- Place at: `data/external_references/mouse_brain_atlas/l5_all.loom`
- Used by: `mouse_brain/sn_analysis.Rmd` (label transfer subclass + taxonomy4)

### Allen Mouse Cortex — Tasic et al. 2016
> Tasic B *et al.* Adult mouse cortical cell taxonomy revealed by single cell transcriptomics. *Nat. Neurosci.* 19, 335–346 (2016).
- Download: https://portal.brain-map.org/atlases-and-data/rnaseq/mouse-whole-cortex-and-hippocampus-10x
- Place at: `data/external_references/mouse_brain_atlas/allen_cortex.rds`
- Used by: `mouse_brain/sn_analysis.Rmd` (Allen-derived layer/subclass labels)

### 10x Genomics public mouse forebrain FFPE (10k cells)
- Download: https://www.10xgenomics.com/datasets/10k-mouse-forebrain-ffpe-tissue-dissociated-using-gentlemacs-dissociator-singleplex-sample-1-standard
- Place at: `data/external_references/mouse_forebrain_10x/10k_mouse_forebrain_scFFPE_singleplex_count_sample_filtered_feature_bc_matrix.h5`
- Used by: `mouse_brain/qc_metrics.Rmd` (QC benchmarking)

### 10x Genomics public BC FFPE (320k cells, GEM-X FLEX)
- Download: https://www.10xgenomics.com/datasets/320k_scFFPE_16-plex_GEM-X_FLEX
- Place at: `data/external_references/10x_BC_FFPE/320k_scFFPE_16-plex_GEM-X_FLEX_BreastCancer1_BC7-8_count_sample_filtered_feature_bc_matrix.h5`
- Used by: `analysis_majorLevel.rmd` (FFPE QC comparator)

### PCa scRNA-seq atlas (Erickson lab, Oct 2023)
- Place at: `data/external_references/PCa_atlas/PCa_atlas_annotated_Oct23_update.rds`
- Used by: `prostate_cancer/integrative_prostate.rmd` (epithelial subset annotation)
- Source: contact A. Erickson / L. Savolainen (University of Helsinki)

## Software versions (from manuscript)

- CellRanger v7.1.0 (10x Genomics) — Chromium Fixed RNA Profiling. References: GRCh38 2020-A (ensembl 98) + Chromium Human / Mouse Transcriptome Probe Sets v1.0.1
- SpaceRanger (Visium CytAssist + Visium HD pipelines)
- CellBender v0.3+ — ambient RNA removal (Fleming et al. 2023)
- R 4.4 — see `environment/installed_packages.csv` for the full manifest
- Seurat v5.x (main), Seurat v4 + DoubletFinder v2.0.3 (QC only)
- semla v1.x — spatial transcriptomics functions (NormalizeData, FindVariableFeatures, RunNNLS, RadialDistance, MapFeatures, MapMultipleFeatures)
- harmony v1.2.3, RcppML / singlet (NMF), heatmap3 v1.1.9, igraph v2.1.4, celltalker v0.0.7.9000, CCPlotR v1.0.0, UCell v2.6.2, ggpubr v0.6.2, ggplot2 v3.5.2
- QuPath v5.0.1 (CTA generation, Li et al. 2025)
- Scanpy v1.9 — Xenium cell-type annotation (Python; not part of this R repository)
