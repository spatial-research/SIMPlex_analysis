# Manuscript ↔ repository figure map

Cross-reference between the publication figures and script outputs under `figs/`. Based on revision manuscript PDFs in `remove_before_submission/manuscript_review/figs/` and the analysis scripts.

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
| **d** | Whole-tissue compartment composition: **CTA (ground truth) vs SIMPlex vs BC atlas** (stacked bars, % of cells) — SIMPlex matches CTA, atlas does not | `analysis_majorLevel.ipynb` | `analysis_majorLevel/autoAnnotation/compartment_composition_CTA_vs_snRNA.pdf` | Cell/nucleus counts only (comparable); SIMPlex/BC from `int.all$population` / `bc_atlas$celltype_major` (same as 2a); all data, no cohort matching |
| **d′** | Heatmap: cell-type proportions within histopathology compartments × deconvolution reference | `analysis_majorLevel.ipynb` | `analysis_majorLevel/map_pathAnnotation/heatmap_histopath_decon.pdf` | Facets: SIMPlex, BC atlas, Technical Control |
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

From `Figure 3.pdf` and script subtitles:

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

**Repo doc vs manuscript:** We list Fig. 1c–f as main-text mouse brain panels; the local EDF1 PDF combines QC (b–d) and annotation/deconvolution (e–g) in one extended figure.

---

## Extended Data figures — breast & prostate (revision numbering)

| EDF | Content | Script | `figs/` folder |
|-----|---------|--------|----------------|
| **2** | BC snRNA QC (FFPE + FF; cross-cohort comparison) | `qc_doubletRemoval.ipynb` · `technical/metrics_comparison.ipynb` | `breast_cancer/qc_doubletRemoval/` · `technical/metrics_comparison/` |
| **3** | Nuclei integrity across FFPE section thicknesses (FACS + confocal) | — | Experimental data (not in repo) |
| **4** | Prostate Visium HD SIMPlex profiling | `qc_doubletRemoval.ipynb` + `integrative_prostate.ipynb` | `prostate_cancer/` |
| **5** | Cross-patient BC integration, marker dot plot, major-lineage spatial maps | `analysis_majorLevel.ipynb` | `breast_cancer/analysis_majorLevel/` |
| **6** | Histopathology / CTA vs deconvolution benchmarking | `analysis_majorLevel.ipynb` | `breast_cancer/analysis_majorLevel/` |
| **7** | UCell marker modules vs deconvolution; Patient 5 Xenium + HD maps | `analysis_majorLevel.ipynb` | `breast_cancer/analysis_majorLevel/` |
| **8** | Fine-grained state annotation; **8c** cluster stability (Jaccard subsampling) | `analysis_cellStateLevel.ipynb` · `extra_exploration.ipynb` | `analysis_cellStateLevel/` · `review/cluster_stability/` |
| **9** | Cross-cohort fine-grained spatial colocalization; **9c** Spearman threshold sensitivity (ARI) | `analysis_cellStateLevel.ipynb` · `extra_exploration.ipynb` | `analysis_cellStateLevel/` · `review/correlation_threshold_sensitivity/` |
| **10** | Patient 4 DEG volcanoes, ligand–receptor analysis, Xenium validation | `analysis_cellStateLevel.ipynb` | `breast_cancer/analysis_cellStateLevel/` |

**Numbering change (revision):** A new Extended Data Fig. 3 (nuclei integrity) shifted former EDF 3–9 to EDF 4–10. Extended Data Fig. 8 panel **c** now shows subpopulation cluster stability (`figs/review/cluster_stability/subpopulation_jaccard_stability.pdf`; BC atlas stability in the same analysis). Extended Data Fig. 9 panel **c** adds co-localization threshold sensitivity (`figs/review/correlation_threshold_sensitivity/correlation_threshold_sensitivity.pdf`); downstream panels shift one letter.

Per-sample nuclei annotation (`annotation_majorLevel.ipynb` → `figs/breast_cancer/annotation/`) remains available but is not assigned to a numbered extended data figure in the revision.

---

## Current `figs/` status

| Folder | Role | Status |
|--------|------|--------|
| `breast_cancer/analysis_majorLevel/` | Fig. 1g, Fig. 2a–h, EDF 5–7 | Complete — in KTH bundle or regenerate from notebook |
| `breast_cancer/analysis_cellStateLevel/` | Fig. 2i–k, Fig. 3, EDF 8–10 | Complete — in KTH bundle or regenerate from notebook |
| `breast_cancer/qc_doubletRemoval/` | EDF 2 | Complete |
| `breast_cancer/annotation/` | Optional per-sample QC | Optional — regenerate from notebook |
| `prostate_cancer/` | EDF 4 | Complete |
| `mouse_brain/` | Fig. 1 / EDF 1 | From notebook run (mostly knitted HTML) |
| `technical/` | Cross-cohort QC, technical experiments | From `metrics_comparison.ipynb` + `qc_doubletRemoval.ipynb` |
| `review/cluster_stability/` | EDF 8c | From `extra_exploration.ipynb` |
| `review/correlation_threshold_sensitivity/` | EDF 9c | From `extra_exploration.ipynb` |
| `review/` (other) | Reviewer-response robustness checks | From `extra_exploration.ipynb` |
| `spaGE/` | Visium HD imputation benchmark | From `spaGE.ipynb` |

See also [`script_to_figure_map.md`](script_to_figure_map.md) for script-level panel descriptions.
