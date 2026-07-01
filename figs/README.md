# `figs/` — Generated figures

Script outputs from the SIMPlex pipeline. Figure files (PDF, PNG, HTML, …) are gitignored; **directory structure** and this README are tracked.

## Get the figures

**KTH Data Repository:** [https://datarepository.kth.se/records/v2nqh-scr27](https://datarepository.kth.se/records/v2nqh-scr27)

Download `figs.tar` from the record and extract on top of this folder, or regenerate by running notebooks ([pipeline order](../README.md#5-run-the-pipeline)).

## Layout

Folders mirror `FIGS_ROOT` in [`config.R`](../config.R) and map to notebooks under `scripts/jupyter/`:

```
figs/
├── breast_cancer/
│   ├── qc_doubletRemoval/           ← qc_doubletRemoval.ipynb
│   ├── analysis_majorLevel/         ← breast_cancer/analysis_majorLevel.ipynb
│   ├── analysis_cellStateLevel/     ← breast_cancer/analysis_cellStateLevel.ipynb
│   ├── annotation/                  ← breast_cancer/annotation_majorLevel.ipynb
│   └── suppl/                       ← analysis_majorLevel.ipynb (supplementary QC panels)
├── prostate_cancer/                 ← prostate_cancer/integrative_prostate.ipynb
├── mouse_brain/                     ← mouse_brain/*.ipynb
├── technical/
│   ├── qc_doubletRemoval/           ← qc_doubletRemoval.ipynb (technical experiments)
│   └── metrics_comparison/          ← technical/metrics_comparison.ipynb
├── review/                          ← breast_cancer/extra_exploration.ipynb
│   ├── LR_sanity_check/
│   ├── CAF_validation/
│   ├── correlation_threshold_sensitivity/
│   ├── cluster_stability/
│   └── sn_vs_sc_deconv/
└── spaGE/                           ← breast_cancer/spaGE.ipynb
```

`annotation_majorLevel.ipynb` writes under `breast_cancer/annotation/<sample>/` (e.g. `patient9_55um/`). That tree is optional in the KTH deposit; regenerate locally for Extended Data Fig. 4a if needed.

## Manuscript mapping

| Folder | Figures |
|--------|---------|
| `breast_cancer/qc_doubletRemoval/` | Extended Data Fig. 2 |
| `breast_cancer/analysis_majorLevel/` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `breast_cancer/analysis_cellStateLevel/` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `prostate_cancer/` | Extended Data Fig. 3 |
| `mouse_brain/` | Fig. 1c–f · Extended Data Fig. 1 |

**Supplementary outputs** (reviewer / technical analyses, not primary manuscript figures):

| Folder | Script |
|--------|--------|
| `technical/metrics_comparison/` | `technical/metrics_comparison.ipynb` |
| `technical/qc_doubletRemoval/` | `qc_doubletRemoval.ipynb` (SIMPlex Rev001 controls) |
| `review/` | `breast_cancer/extra_exploration.ipynb` |
| `spaGE/` | `breast_cancer/spaGE.ipynb` |

Panel-level crosswalk: [`docs/manuscript_figure_map.md`](../docs/manuscript_figure_map.md). Per-script notes: [`docs/script_to_figure_map.md`](../docs/script_to_figure_map.md).

## Deposit status

| Folder | Status |
|--------|--------|
| `breast_cancer/analysis_majorLevel/` | In KTH bundle / regenerate from notebook |
| `breast_cancer/analysis_cellStateLevel/` | In KTH bundle / regenerate from notebook |
| `breast_cancer/qc_doubletRemoval/` | In KTH bundle / regenerate from notebook |
| `breast_cancer/annotation/` | Optional — regenerate if needed |
| `prostate_cancer/` | In KTH bundle or from notebook run |
| `mouse_brain/` | From notebook run (mostly knitted HTML) |
| `technical/` | From notebook run |
| `review/` | From notebook run (reviewer-response analyses) |
| `spaGE/` | From notebook run |

Published figures were composited in Illustrator; script PDFs are source material, not pixel-identical finals.
