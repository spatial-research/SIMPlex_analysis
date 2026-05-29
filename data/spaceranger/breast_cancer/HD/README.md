# SpaceRanger outputs — Breast cancer Visium HD

Expected layout:

```
HD/
├── patient4_HD/binned_outputs/
└── patient5_HD/binned_outputs/
```

`binned_outputs/` should follow the Visium HD SpaceRanger v3+ structure, containing pre-binned matrices at multiple resolutions (2 µm, 8 µm, 16 µm, 48 µm). Required by `scripts/prostate_cancer/integrative_prostate.rmd`-style loaders via `semla::ReadVisiumHD()`.

## Status

Available locally (per Marcos). Populate this folder when uploading the local archive.
