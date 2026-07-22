# Script → Figure map

Mapping of analysis notebook outputs to manuscript figures. Run notebooks in the order listed in the [README](../README.md#5-run-the-pipeline).

All script paths are relative to `scripts/jupyter/`.

Revision figure PDFs: `remove_before_submission/manuscript_review/figs/`.

## Figure 1 — SIMPlex method validation across tissues

| Panel | Content | Script | Notes |
|-------|---------|--------|-------|
| 1a | Workflow schematic | — | hand-drawn |
| 1b | Dataset/platform overview table | — | hand-drawn |
| 1c | Representative DAPI+ nuclei image (mouse brain) | — | microscopy |
| 1d | Violin plots, nFeature / nCount per nucleus (MB vs MFB) | `mouse_brain/sn_analysis.ipynb` | `VlnPlot()` |
| 1e | Gene-gene scatter, log10 UMI + detection rate (MB) | `mouse_brain/sn_analysis.ipynb` | `ggpubr::stat_cor()` |
| 1f | UMAP of mouse brain snRNA + deconvolution on matched section | `mouse_brain/sn_analysis.ipynb` + `mouse_brain/spatial_analysis.ipynb` | semla `RunNNLS()` |
| 1g | Integrated UMAP of 71,418 BC nuclei across 8 patients | `breast_cancer/analysis_majorLevel.ipynb` | Harmony, `theta = 0` |

## Figure 2 — BC tumor microenvironment and high-resolution states

| Panel | Content | Script |
|-------|---------|--------|
| 2a | Bulk population composition (histopathology vs single-cell vs deconvolution) | `breast_cancer/analysis_majorLevel.ipynb` |
| 2b | Spatial deconvolution proportions, major cell types | `breast_cancer/analysis_majorLevel.ipynb` |
| 2c | Cell-type proportions within histopathology compartments | `breast_cancer/analysis_majorLevel.ipynb` |
| 2d | Spatial CTA assignments (cell counts per compartment) + whole-tissue compartment composition strip (CTA vs SIMPlex vs BC atlas → `autoAnnotation/compartment_composition_CTA_vs_snRNA.pdf`) | `breast_cancer/analysis_majorLevel.ipynb` (consumes `data/other/CTA/`) |
| 2e | Deconvolution vs UCell signature scoring | `breast_cancer/analysis_majorLevel.ipynb` |
| 2f | T cell + endothelial correlation comparisons | `breast_cancer/analysis_majorLevel.ipynb` |
| 2g | Visium HD 16 µm bin deconvolution vs consecutive Xenium | `breast_cancer/analysis_majorLevel.ipynb` |
| 2h | Major cell types across 48 → 2 µm bins | `breast_cancer/analysis_majorLevel.ipynb` |
| 2i | Epithelial subclustering | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 2j | Fibroblast (CAF) subclustering | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 2k | Immune subclustering | `breast_cancer/analysis_cellStateLevel.ipynb` |

## Figure 3 — Patient 4 niche analysis and cell-cell communication

| Panel | Content | Script |
|-------|---------|--------|
| 3a | Spatial mapping of patient-specific cell states | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3b | Spearman correlation heatmap (patient 4) | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3c | Network/niche graph (Louvain on SCC > 0.15) | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3d | Niche visualization + histopathology overlay | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3e | Radial cell-state composition across DCIS/invasive border | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3f | mCAF spatial heterogeneity | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3g | iCAF spatial heterogeneity + volcano | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3h | Spatially informed ligand-receptor circos | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 3i | Xenium validation of iCAF C3/CXCL12 axis | `breast_cancer/analysis_cellStateLevel.ipynb` |

## Extended Data Figures

| EDF | Content | Script |
|-----|---------|--------|
| 1a | SIMPlex workflow schematic | — |
| 1b | Mouse brain Visium + snRNA QC scatter | `mouse_brain/qc_metrics.ipynb` |
| 1c | Mouse brain label transfer comparisons | `mouse_brain/spatial_analysis.ipynb` |
| 1d–e | Layer-specific cortical / hippocampal annotation | `mouse_brain/spatial_analysis.ipynb` |
| 2 | BC snRNA-seq QC (FFPE + FF; cross-cohort) | `qc_doubletRemoval.ipynb` · `technical/metrics_comparison.ipynb` |
| 3 | Nuclei integrity across section thicknesses (FACS + confocal) | — (experimental; not in repo) |
| 4 | Prostate Visium HD SIMPlex profiling | `qc_doubletRemoval.ipynb` + `prostate_cancer/integrative_prostate.ipynb` |
| 5 | Cross-patient BC integration; marker dot plot; major-lineage spatial maps | `breast_cancer/analysis_majorLevel.ipynb` |
| 6 | Histopathology / CTA vs deconvolution benchmarking | `breast_cancer/analysis_majorLevel.ipynb` |
| 7 | UCell marker modules vs deconvolution; Patient 5 Xenium + HD maps | `breast_cancer/analysis_majorLevel.ipynb` |
| 8a–b | Patient / subtype distribution across fine-grained states | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 8c | Subpopulation cluster stability (Jaccard subsampling) | `breast_cancer/extra_exploration.ipynb` → `figs/review/cluster_stability/` |
| 8d–f | Atlas correlation heatmaps (Wu 2021; Cords 2023) | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 9a–b | Cross-cohort fine-grained spatial colocalization (SIMPlex vs BC atlas) | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 9c | Spearman co-localization threshold sensitivity (ARI vs *r* = 0.15) | `breast_cancer/extra_exploration.ipynb` → `figs/review/correlation_threshold_sensitivity/` |
| 9d–f | Patient 4 histopathology; mCAF maps; SIMPlex vs atlas comparison | `breast_cancer/analysis_cellStateLevel.ipynb` |
| 10a–f | Patient 4 DEG volcanoes; ligand–receptor analysis; Xenium validation | `breast_cancer/analysis_cellStateLevel.ipynb` |

## Additional analyses

| Script | Outputs | Purpose |
|--------|---------|---------|
| `breast_cancer/annotation_majorLevel.ipynb` | `figs/breast_cancer/annotation/` | Per-sample nuclei annotation (optional; not in numbered EDFs) |
| `technical/metrics_comparison.ipynb` | `figs/technical/metrics_comparison/` | Cross-cohort snRNA QC (supports EDF 2) |
| `breast_cancer/extra_exploration.ipynb` | `figs/review/` (other subfolders) | Reviewer-response robustness: LR sanity check, CAF/mast/neutrophil validation, snRNA vs scRNA deconvolution |
| `breast_cancer/spaGE.ipynb` | `figs/spaGE/` | Visium HD SpaGE imputation across SIMPlex and BC atlas references |

## Intermediate file flow

Notebooks share intermediate `.rds` files under `data/single_nuclei/r_objects/` and `data/spatial/r_objects/`:

```
qc_doubletRemoval.ipynb
  → single_nuclei/r_objects/breast_cancer/per_sample/<patient>/<sample>_noDoublets.rds

annotation_majorLevel.ipynb
  → single_nuclei/r_objects/breast_cancer/per_sample/<sample>/<sample>_seuratAnnotation.rds

analysis_majorLevel.ipynb
  → single_nuclei/r_objects/breast_cancer/cross_patient/SIMPlex_breast_allSamples.rds
  → spatial/r_objects/breast_cancer/55um/<sample>/<sample>_3decon.rds
  → spatial/r_objects/breast_cancer/cross_patient/VISIUM_breast_allSamples.rds

analysis_cellStateLevel.ipynb
  → single_nuclei/r_objects/breast_cancer/cross_patient/integrated_all_subpopulations.rds
  → spatial/r_objects/breast_cancer/cross_patient/merged_visium_deconSubpopulations_simplex.rds
  → single_nuclei/r_objects/breast_cancer/cross_patient/caf_subpop_analysis.rds
  → resources/pat4_celltalker_interactions.csv

technical/metrics_comparison.ipynb
  → figs/technical/metrics_comparison/qc_cohort_comparison.pdf
  → figs/technical/metrics_comparison/qc_cohort_summary.csv
  → resources/sample_metadata_metrics.csv (specimen-level metrics table)

extra_exploration.ipynb
  → figs/review/cluster_stability/ (EDF 8c)
  → figs/review/correlation_threshold_sensitivity/ (EDF 9c)
```

Cross-patient files are part of the Zenodo deposit and can be used without re-running upstream steps. `extra_exploration.ipynb` and `spaGE.ipynb` start from deposited objects.

## Manuscript crosswalk

For panel-by-panel mapping to publication figures (including Illustrator layout caveats), see [`manuscript_figure_map.md`](manuscript_figure_map.md).
