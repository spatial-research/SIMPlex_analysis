# `data/` — Heavy data root

This directory holds all runtime data for the SIMPlex analysis pipeline. The directory structure is git-tracked; the actual data files are gitignored.

## Deposited data — KTH Data Repository

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

Download the archive and unpack on top of `data/r_objects/` (~37 GB). That single step gives you everything needed to run all `analysis_*.rmd` and `mouse_brain/*.Rmd` scripts end-to-end.

## Directory layout

```
data/
├── r_objects/          # KTH-deposited R objects — see r_objects/PLACEHOLDER.md
├── external_references/# Public reference atlases — see external_references/PLACEHOLDER.md
├── spaceranger/        # SpaceRanger outputs (Visium 55 µm, HD, mouse brain)
├── cellranger/         # CellRanger snRNA-seq outputs
├── cellbender/         # CellBender-denoised h5 matrices
├── raw_data/           # FASTQs + H&E images (to be deposited upon publication)
└── xenium/             # Raw Xenium Analyzer outputs
```

Generated figures are written to `figs/` at the repository root (not inside `data/`).

See `docs/data_availability.md` for full download instructions and external reference sources.
