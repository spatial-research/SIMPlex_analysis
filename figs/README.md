# `figs/` — Generated figures

Script outputs from the SIMPlex pipeline. Figure files (PDF, PNG, HTML, …) are gitignored; **directory structure** and this README are tracked.

## Get the figures

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

Unpack `figs/` on top of this folder after cloning, or regenerate by running scripts ([pipeline order](../README.md#5-run-the-pipeline)).

## Layout

Folders mirror `FIGS_ROOT` in [`config.R`](../config.R) (same names as under `scripts/rmd/`):

```
figs/
├── breast_cancer/
│   ├── qc_doubletRemoval/        ← scripts/rmd/qc_doubletRemoval.rmd
│   ├── analysis_majorLevel/      ← scripts/rmd/breast_cancer/analysis_majorLevel.rmd
│   ├── analysis_cellStateLevel/ ← scripts/rmd/breast_cancer/analysis_cellStateLevel.rmd
│   └── annotation/               ← scripts/rmd/breast_cancer/annotation_majorLevel.rmd (optional; often not deposited)
├── prostate_cancer/              ← scripts/rmd/prostate_cancer/integrative_prostate.rmd
└── mouse_brain/                  ← scripts/rmd/mouse_brain/*.Rmd
```

The git checkout currently tracks **`breast_cancer/`** only; `prostate_cancer/` and `mouse_brain/` appear after running those scripts (mouse outputs are mostly knitted HTML).

`annotation_majorLevel.rmd` writes under `breast_cancer/annotation/<sample>/` (e.g. `patient9_55um/`). That tree is **not** part of the current deposit; regenerate locally for Extended Data Fig. 4a if needed.

## Manuscript mapping

| Folder | Figures |
|--------|---------|
| `breast_cancer/qc_doubletRemoval/` | Extended Data Fig. 2 |
| `breast_cancer/analysis_majorLevel/` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `breast_cancer/analysis_cellStateLevel/` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `prostate_cancer/` | Extended Data Fig. 3 |
| `mouse_brain/` | Fig. 1c–f · Extended Data Fig. 1 |

Panel-level crosswalk: [`docs/manuscript_figure_map.md`](../docs/manuscript_figure_map.md). Per-script notes: [`docs/script_to_figure_map.md`](../docs/script_to_figure_map.md).

## Deposit status

| Folder | Status |
|--------|--------|
| `breast_cancer/analysis_majorLevel/` | Partial in checkout |
| `breast_cancer/analysis_cellStateLevel/` | Partial |
| `breast_cancer/qc_doubletRemoval/` | Partial |
| `breast_cancer/annotation/` | Not deposited — regenerate if needed |
| `prostate_cancer/` | From KTH bundle or script run |
| `mouse_brain/` | From script run (HTML knit; few standalone PDFs) |

Published figures were composited in Illustrator; script PDFs are source material, not pixel-identical finals.
