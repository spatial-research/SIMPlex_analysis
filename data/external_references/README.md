# External public reference datasets

The analysis pipeline uses several public reference atlases for label transfer and benchmarking. Download links and expected locations:

## Breast cancer single-cell atlas (Wu et al. 2021, Nat. Genet.)

> https://singlecell.broadinstitute.org/single_cell/study/SCP1039

Place the Seurat-converted object at:

```
external_references/BC_atlas/miniatlas.rds
```

Used as the primary BC reference for label transfer and deconvolution benchmarking (`garvan_major_map` assay in analysis_majorLevel.rmd).

## Cords et al. 2023 (Nat. Commun.) — CAF reference

> https://doi.org/10.1038/s41467-023-39762-1

Place at:

```
external_references/CAF_Cords2023/BREAST_fibro_tumour.rds
```

Used for CAF subpopulation comparison in `analysis_cellStateLevel.rmd`.

## snPATHO-seq breast reference (Wang et al. 2024, Commun. Biol.)

```
external_references/snPATHO/4066_snPatho.rds
```

Used for FFPE-specific snRNA-seq QC benchmarking (Extended Data Fig. 2).

## Linnarsson mouse brain atlas (Zeisel et al. 2018, Cell)

> http://mousebrain.org/adolescent/ (SRP135960)

Place at:

```
external_references/mouse_brain_atlas/l5_all.loom
```

Used for mouse brain snRNA-seq label transfer in `sn_analysis.Rmd`.

## Allen Mouse Cortex (Tasic et al. 2016, Nat. Neurosci.)

> https://portal.brain-map.org/atlases-and-data/rnaseq/mouse-whole-cortex-and-hippocampus-10x

Place at:

```
external_references/mouse_brain_atlas/allen_cortex.rds
```

Used jointly with Linnarsson for layer/subclass annotation.

## 10x Genomics public mouse forebrain FFPE

> https://www.10xgenomics.com/datasets/10k-mouse-forebrain-ffpe-tissue-dissociated-using-gentlemacs-dissociator-singleplex-sample-1-standard

Place the filtered feature-barcode matrix at:

```
external_references/mouse_forebrain_10x/10k_mouse_forebrain_scFFPE_singleplex_count_sample_filtered_feature_bc_matrix.h5
```

Used as a comparator dataset in `mouse_brain/qc_metrics.Rmd`.

## PCa atlas (Erickson lab, internal release Oct 2023)

```
external_references/PCa_atlas/PCa_atlas_annotated_Oct23_update.rds
```

Used for epithelial subset annotation in `integrative_prostate.rmd`. Contact A. Erickson / L. Savolainen (University of Helsinki) for access.

## Status

| Reference | File | Status |
|-----------|------|--------|
| BC Atlas (Wu et al. 2021) | `BC_atlas/miniatlas.rds` | ✅ Present |
| CAF reference (Cords et al. 2023) | `CAF_Cords2023/BREAST_fibro_tumour.rds` | ✅ Present |
| snPATHO-seq (Wang et al. 2024) | `snPATHO/4066_snPatho.rds` | ✅ Present |
| Linnarsson mouse brain atlas | `mouse_brain_atlas/l5_all.loom` | ✅ Present |
| Allen Mouse Cortex (Tasic et al. 2016) | `mouse_brain_atlas/allen_cortex.rds` | ✅ Present |
| 10x mouse forebrain FFPE (10k cells) | `mouse_forebrain_10x/10k_mouse_forebrain_scFFPE_singleplex_count_sample_filtered_feature_bc_matrix.h5` | ✅ Present |
| 10x BC FFPE (320k cells, GEM-X FLEX) | `10x_BC_FFPE/320k_scFFPE_16-plex_GEM-X_FLEX_BreastCancer1_BC7-8_count_sample_filtered_feature_bc_matrix.h5` | ✅ Present |
| PCa atlas (Erickson lab, Oct 2023) | `PCa_atlas/PCa_atlas_annotated_Oct23_update.rds` | ✅ Present |

All files are populated locally. Download URLs above are retained for public reproducibility.
