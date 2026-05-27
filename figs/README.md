# `figs/` — Generated figures

This directory holds all figure outputs produced by the analysis scripts. Figure files (PDF, JPG, PNG, etc.) are gitignored; only this README and directory structure are tracked.

## Data availability

The canonical figure set accompanying the manuscript is deposited at the **KTH Data Repository**:

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

All figures can also be regenerated locally by running the scripts in order — see `README.md §5` and `docs/script_to_figure_map.md` for the script → figure mapping.

## Directory layout

```
figs/
├── breast_cancer/
│   ├── analysis_majorLevel/    # Fig. 1g · Fig. 2a–h · Extended Data Fig. 4–6
│   ├── analysis_cellStateLevel/# Fig. 2i–k · Fig. 3 · Extended Data Fig. 7–9
│   ├── annotation/             # Extended Data Fig. 4a
│   ├── qc_doubletRemoval/      # Extended Data Fig. 2
│   └── suppl/                  # Additional supplementary panels
├── prostate_cancer/            # Extended Data Fig. 3
└── mouse_brain/                # Fig. 1c–f · Extended Data Fig. 1
```
