# Script → Figure map

Detailed mapping of each analysis script's outputs to manuscript figures. Run scripts in the order listed in the [README](../README.md#5-run-the-pipeline); each row below points to the script section/chunk that produces a given panel.

## Figure 1 — SIMPlex method validation across tissues

| Panel | Content | Script | Notes |
|-------|---------|--------|-------|
| 1a | Workflow schematic | — | hand-drawn |
| 1b | Dataset/platform overview table | — | hand-drawn |
| 1c | Representative DAPI+ nuclei image (mouse brain) | — | microscopy |
| 1d | Violin plots, nFeature / nCount per nucleus (MB vs MFB) | `mouse_brain/sn_analysis.Rmd` | uses Seurat `VlnPlot()` |
| 1e | Gene-gene scatter, log10 UMI + detection rate (MB) | `mouse_brain/sn_analysis.Rmd` | `ggpubr::stat_cor()` |
| 1f | UMAP of mouse brain snRNA + deconvolution on matched section | `mouse_brain/sn_analysis.Rmd` (UMAP) + `mouse_brain/spatial_analysis.Rmd` (deconvolution) | semla `RunNNLS()` |
| 1g | Integrated UMAP of 71,418 BC nuclei across 8 patients | `breast_cancer/analysis_majorLevel.rmd` (early integration chunk) | Harmony, `theta = 0` |

## Figure 2 — BC tumor microenvironment and high-resolution states

| Panel | Content | Script |
|-------|---------|--------|
| 2a | Bulk population composition (histopathology vs single-cell vs deconvolution) | `breast_cancer/analysis_majorLevel.rmd` |
| 2b | Spatial deconvolution proportions, major cell types | `breast_cancer/analysis_majorLevel.rmd` |
| 2c | Cell-type proportions within histopathology compartments | `breast_cancer/analysis_majorLevel.rmd` |
| 2d | Spatial CTA assignments (cell counts per compartment) | `breast_cancer/analysis_majorLevel.rmd` (consumes `resources/breast_cancer/CTA/`) |
| 2e | Deconvolution vs UCell signature scoring (per-celltype heatmap) | `breast_cancer/analysis_majorLevel.rmd` |
| 2f | T cell + endothelial correlation coefficient comparisons (Wilcoxon, BH-corrected) | `breast_cancer/analysis_majorLevel.rmd` |
| 2g | Visium HD 16 µm bin deconvolution vs consecutive Xenium | `breast_cancer/analysis_majorLevel.rmd` |
| 2h | Major cell types across 48 → 2 µm bins | `breast_cancer/analysis_majorLevel.rmd` |
| 2i | Epithelial subclustering (patient-specific vs shared) | `breast_cancer/analysis_cellStateLevel.rmd` |
| 2j | Fibroblast (CAF) subclustering | `breast_cancer/analysis_cellStateLevel.rmd` |
| 2k | Immune subclustering | `breast_cancer/analysis_cellStateLevel.rmd` |

## Figure 3 — Patient 4 niche analysis and cell-cell communication

| Panel | Content | Script |
|-------|---------|--------|
| 3a | Spatial mapping of patient-specific cell states | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3b | Spearman correlation heatmap of cell state co-localization (patient 4) | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3c | Network/niche graph (Louvain on SCC > 0.15, igraph) | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3d | Niche visualization + histopathology overlay | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3e | Radial cell-state composition across DCIS/invasive border | `breast_cancer/analysis_cellStateLevel.rmd` (semla `RadialDistance()`) |
| 3f | mCAF spatial heterogeneity | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3g | iCAF spatial heterogeneity + volcano | `breast_cancer/analysis_cellStateLevel.rmd` |
| 3h | Spatially informed ligand-receptor circos | `breast_cancer/analysis_cellStateLevel.rmd` (celltalker + CCPlotR) |
| 3i | Xenium validation of iCAF C3/CXCL12 axis | `breast_cancer/analysis_cellStateLevel.rmd` |

## Extended Data Figures

| EDF | Content | Script |
|-----|---------|--------|
| 1a | SIMPlex workflow schematic | — |
| 1b | Mouse brain Visium + snRNA QC scatter | `mouse_brain/qc_metrics.Rmd` |
| 1c | Mouse brain label transfer comparisons | `mouse_brain/spatial_analysis.Rmd` |
| 1d–e | Layer-specific cortical / hippocampal annotation | `mouse_brain/spatial_analysis.Rmd` |
| 2 | BC snRNA-seq QC (FFPE + FF) | `qc_doubletRemoval.rmd` + per-sample summaries from `breast_cancer/annotation_majorLevel.rmd` |
| 3 | Prostate QC + integrative analysis | `qc_doubletRemoval.rmd` (prostate samples) + `prostate_cancer/integrative_prostate.rmd` |
| 4a | Per-sample BC nuclei annotation | `breast_cancer/annotation_majorLevel.rmd` |
| 4b–c | Same-patient consecutive section integration QC | `breast_cancer/analysis_majorLevel.rmd` |
| 4d | Spatial decon mismatch examples (atlas vs SIMPlex) | `breast_cancer/analysis_majorLevel.rmd` |
| 5 | Extended deconvolution benchmarking | `breast_cancer/analysis_majorLevel.rmd` |
| 6 | High-resolution HD deconvolution benchmarks | `breast_cancer/analysis_majorLevel.rmd` |
| 7a–c | Cross-patient subclustering UMAPs (epi, CAF, immune) | `breast_cancer/analysis_cellStateLevel.rmd` |
| 7d–f | Reference comparison heatmaps for subclusters | `breast_cancer/analysis_cellStateLevel.rmd` |
| 8a–e | Patient 4 niche details + atlas comparison | `breast_cancer/analysis_cellStateLevel.rmd` |
| 9a–f | DEG signatures + Xenium spatial confirmations | `breast_cancer/analysis_cellStateLevel.rmd` |

## Intermediate file flow

The scripts share intermediate `.rds` files. Within `data/r_objects/breast_cancer/`:

```
qc_doubletRemoval.rmd      → single_nuclei/per_sample/<patient>/<sample>_noDoublets.rds
annotation_majorLevel.rmd  → single_nuclei/per_sample/<sample>/<sample>_seuratAnnotation.rds
analysis_majorLevel.rmd    → single_nuclei/cross_patient/SIMPlex_breast_allSamples.rds
                           → visium/55um/<sample>/<sample>_3decon.rds
                           → visium/cross_patient/VISIUM_breast_allSamples.rds
analysis_cellStateLevel.rmd → single_nuclei/cross_patient/integrated_all_subpopulations.rds
                            → visium/cross_patient/merged_visium_deconSubpopulations_simplex.rds
                            → single_nuclei/cross_patient/caf_subpop_analysis.rds
```

The cross-patient files marked above are also part of the KTH deposit and can be obtained without re-running the upstream steps.
