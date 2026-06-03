# `figs/` — Generated figures

Script outputs from the SIMPlex analysis pipeline. Figure files (PDF, JPG, PNG, HTML, …) are gitignored; directory structure and this README are tracked.

## Get the figures

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

Download the KTH archive and unpack `figs/` on top of this directory after cloning. Alternatively, regenerate locally by running scripts in order (see [README §5](../README.md#5-run-the-pipeline)).

## Layout

Folders mirror script output paths under `FIGS_ROOT` (set in `config.R`):

```
figs/
├── breast_cancer/
│   ├── qc_doubletRemoval/       ← scripts/rmd/qc_doubletRemoval.rmd
│   ├── analysis_majorLevel/     ← scripts/rmd/breast_cancer/analysis_majorLevel.rmd
│   └── analysis_cellStateLevel/ ← scripts/rmd/breast_cancer/analysis_cellStateLevel.rmd
├── prostate_cancer/             ← scripts/rmd/prostate_cancer/integrative_prostate.rmd
└── mouse_brain/                 ← scripts/rmd/mouse_brain/*.Rmd (see note below)
```

`annotation_majorLevel.rmd` writes to `breast_cancer/annotation/patient9_55um/` when run, but that folder is **not** part of the current deposit (incomplete / omitted). Extended Data Fig. 4a panels must be regenerated locally or taken from the KTH archive once finalized.

## Manuscript mapping

| Folder | Manuscript figures |
|--------|-------------------|
| `breast_cancer/qc_doubletRemoval/` | Extended Data Fig. 2 |
| `breast_cancer/analysis_majorLevel/` | Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6 |
| `breast_cancer/analysis_cellStateLevel/` | Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9 |
| `prostate_cancer/` | Extended Data Fig. 3 |
| `mouse_brain/` | Fig. 1c–f · Extended Data Fig. 1 (HTML knit only) |

Panel-level crosswalk (with Illustrator caveats): [`docs/manuscript_figure_map.md`](../docs/manuscript_figure_map.md).

Per-script details: [`docs/script_to_figure_map.md`](../docs/script_to_figure_map.md).

## Population status

| Folder | Status |
|--------|--------|
| `breast_cancer/analysis_majorLevel/` | Partial — integration UMAPs, deconvolution maps, HD comparisons; some bar/heatmap sources may need re-run |
| `breast_cancer/analysis_cellStateLevel/` | Partial — subcluster UMAPs (Fig. 2i–k), correlation, ligand–receptor; niche/radial panels sparse |
| `breast_cancer/qc_doubletRemoval/` | Partial |
| `breast_cancer/annotation/` | **Not deposited** (removed; EDF 4a — regenerate from script if needed) |
| `prostate_cancer/` | Populated |
| `mouse_brain/` | Empty — mouse brain scripts render plots to knitted HTML only |

Published figures were composited in Illustrator; script PDFs are source material, not pixel-identical copies. The KTH deposit is authoritative for the complete figure set once finalized.
