# Manuscript ↔ repository figure map

Cross-reference between the publication figures and script outputs under `figs/`. Based on manuscript PDFs in the local working folder (`Figure 2.pdf`, `Extended Data Fig 1.pdf`) and the analysis scripts.

**Important:** Final manuscript panels were assembled and styled in Adobe Illustrator. Expect **thematic** correspondence (same analysis, similar layout), not pixel-identical matches to raw script PDFs/JPGs. Colours, panel order, cropping, and multi-panel composites often differ from `ggsave()` output.

For reproduction, use the script paths below as starting points; compare qualitatively to the published figure.

---

## Figure 2 — Breast cancer TME (main text)

Manuscript panels observed in `Figure 2.pdf`:

| Panel | Manuscript content | Script | Closest script output (`figs/breast_cancer/…`) | Notes |
|-------|-------------------|--------|-----------------------------------------------|-------|
| **a** | Stacked bars: histopathology vs BC atlas vs SIMPlex snRNA vs deconvolution (major lineages) | `analysis_majorLevel.ipynb` | `analysis_majorLevel/final_plots/data_prop_comparison.pdf` | Core comparison plot; may be cropped/recoloured in Illustrator |
| **b** | Per-patient Spearman correlation: deconvolution vs marker modules | `analysis_majorLevel.ipynb` | `analysis_majorLevel/correlation_marker_modules/` or `celltype_correlation/` | Manuscript uses dot/scatter layout; script saves multiple correlation PDFs per reference |
| **c** | CTA compartment cell counts (Stroma / Tumour / Immune) | `analysis_majorLevel.ipynb` | `analysis_majorLevel/autoAnnotation/` + `map_autoAnnotation/` | Uses `data/other/CTA/` |
| **d** | Heatmap: cell-type proportions within histopathology compartments × deconvolution reference | `analysis_majorLevel.ipynb` | `analysis_majorLevel/map_pathAnnotation/heatmap_histopath_decon.pdf` | Facets: SIMPlex, BC atlas, Technical Control |
| **g** | Visium HD (16 µm) vs consecutive Xenium | `analysis_majorLevel.ipynb` | `analysis_majorLevel/HD_decon_comparison/` | Side-by-side spatial maps; bin/resolution may differ in layout |
| **h** | Major cell types across HD bin sizes (48 → 2 µm) | `analysis_majorLevel.ipynb` | `analysis_majorLevel/HD_decon_comparison/` | Multi-resolution comparison |
| **i** | Epithelial subcluster UMAP (shared vs patient-specific) | `analysis_cellStateLevel.ipynb` | `analysis_cellStateLevel/subtype_annotation/Epithelial/renamed_umap_post_integration_clusters.pdf` | Panel shows patient columns + legend |
| **j** | CAF subcluster UMAP | `analysis_cellStateLevel.ipynb` | `analysis_cellStateLevel/subtype_annotation/CAFs/renamed_umap_post_integration_clusters.pdf` | |
| **k** | Immune subcluster UMAP | `analysis_cellStateLevel.ipynb` | `analysis_cellStateLevel/subtype_annotation/Immune/renamed_umap_post_integration_clusters.pdf` | |

**Not labelled in main Figure 2 PDF** (likely Extended Data or combined during layout):

| Doc panel | Content | Script output |
|-----------|---------|---------------|
| 2b (repo doc) | Spatial deconvolution proportion maps | `analysis_majorLevel/map/simplex_major_map.jpg` (+ garvan, patspec, control) |
| 2e | Deconvolution vs UCell signature heatmaps | `analysis_majorLevel/correlation_marker_modules/UCell_*` |
| 2f | T cell / endothelial correlation Wilcoxon tests | `analysis_majorLevel/correlation_celltypes/` |

---

## Figure 3 — Patient 4 niches (main text)

No `Figure 3.pdf` in the local manuscript folder; mapping follows script subtitles and figure legend structure:

| Panel | Expected content | Script | Closest script output |
|-------|-----------------|--------|----------------------|
| **3a** | Spatial maps of subpopulations (patient 4) | `analysis_cellStateLevel.ipynb` | `final_subpopulations/map_decon/` |
| **3b** | Spearman co-localization heatmap (patient 4) | `analysis_cellStateLevel.ipynb` | `final_subpopulations/correlation/correlation_finalSubpopulations.pdf` |
| **3c** | Niche network graph | `analysis_cellStateLevel.ipynb` | `final_subpopulations/niche_analysis/graph/network_*.pdf` |
| **3d** | Niche + histopathology overlay | `analysis_cellStateLevel.ipynb` | `final_subpopulations/niche_analysis/map_individual/` |
| **3e** | Radial composition DCIS/invasive border | `analysis_cellStateLevel.ipynb` | `pat4_invasive_dcis_composition/` |
| **3f–g** | mCAF / iCAF spatial heterogeneity + volcanoes | `analysis_cellStateLevel.ipynb` | `deg_interesting_celltypes/`, `map_decon/` |
| **3h** | Ligand–receptor circos | `analysis_cellStateLevel.ipynb` | `ligand_receptor/pat4_celltalker_circos_cor0.15_2interactions.pdf` |
| **3i** | Xenium validation (iCAF axis) | `analysis_cellStateLevel.ipynb` | `fdc/`, `fdc_frc_analysis/` + Xenium data |

---

## Extended Data Figure 1 — SIMPlex workflow & mouse brain

From `Extended Data Fig 1.pdf`:

| Panel | Manuscript content | Script | Repo output |
|-------|-------------------|--------|-------------|
| **1a** | Workflow schematic | — | Hand-drawn (not in repo) |
| **1b** | Visium QC: nFeature, nCount, gene–gene correlation, detection rate | `mouse_brain/qc_metrics.ipynb` | Knitted HTML only (`figs/mouse_brain/` empty) |
| **1c** | Flow cytometry / FACS gating | — | Experimental image (not generated by R scripts) |
| **1d** | Countess nuclei count | — | Experimental image |
| **1e** | Major cell-type UMAP + marker dot plot + Visium deconvolution | `mouse_brain/sn_analysis.ipynb` + `spatial_analysis.ipynb` | HTML knit output |
| **1f** | Fine-grained annotations + spatial maps | same | HTML knit output |
| **1g** | Allen cortex layer labels + laminar deconvolution | same | HTML knit output |

**Repo doc vs manuscript:** We list Fig. 1c–f as main-text mouse brain panels; the local EDF1 PDF combines QC (b–d) and annotation/deconvolution (e–g) in one extended figure. Main **Figure 1** PDF was not available for cross-check.

---

## Extended Data figures — breast & prostate

| EDF | Content | Script | `figs/` folder |
|-----|---------|--------|----------------|
| **2** | BC snRNA QC (FFPE + FF) | `qc_doubletRemoval.ipynb` | `breast_cancer/qc_doubletRemoval/` |
| **3** | Prostate QC + integration | `qc_doubletRemoval.ipynb` + `integrative_prostate.ipynb` | `prostate_cancer/` |
| **4a** | Per-sample BC nuclei annotation (example: patient 9) | `annotation_majorLevel.ipynb` | Optional in deposit — regenerate to `annotation/patient9_55um/` if needed |
| **4b–6** | Integration QC, deconvolution benchmarks, HD | `analysis_majorLevel.ipynb` | `breast_cancer/analysis_majorLevel/` |
| **7–9** | Subclustering, patient-4 niches, DEG/Xenium | `analysis_cellStateLevel.ipynb` | `breast_cancer/analysis_cellStateLevel/` |

---

## Current `figs/` status

| Folder | Role | Status |
|--------|------|--------|
| `breast_cancer/analysis_majorLevel/` | Fig. 1g, Fig. 2, EDF 4–6 | Complete — in KTH bundle or regenerate from notebook |
| `breast_cancer/analysis_cellStateLevel/` | Fig. 2i–k, Fig. 3, EDF 7–9 | Complete — in KTH bundle or regenerate from notebook |
| `breast_cancer/qc_doubletRemoval/` | EDF 2 | Complete |
| `breast_cancer/annotation/` | EDF 4a | Optional — regenerate from notebook |
| `prostate_cancer/` | EDF 3 | Complete |
| `mouse_brain/` | Fig. 1 / EDF 1 | From notebook run (mostly knitted HTML) |
| `technical/` | Cross-cohort QC, technical experiments | From `metrics_comparison.ipynb` + `qc_doubletRemoval.ipynb` |
| `review/` | Reviewer-response robustness checks | From `extra_exploration.ipynb` |
| `spaGE/` | Visium HD imputation benchmark | From `spaGE.ipynb` |

See also [`script_to_figure_map.md`](script_to_figure_map.md) for script-level panel descriptions.
