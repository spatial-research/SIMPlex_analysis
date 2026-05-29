# SpaceRanger outputs — Breast cancer Visium 55 µm

Expected layout (one folder per sample):

```
55um/
├── patient1_55um/
├── patient2_55um/
├── patient3_55um/
├── patient4_55um/
├── patient5_55um/
├── patient6_55um/
├── patient7_55um/
├── patient8_55um/
└── patient9_55um/
```

Each folder should contain the standard SpaceRanger v2+ output:
- `filtered_feature_bc_matrix.h5`
- `raw_feature_bc_matrix.h5`
- `spatial/` — `tissue_positions.csv`, `scalefactors_json.json`, `tissue_hires_image.png`, `tissue_lowres_image.png`, `aligned_fiducials.jpg`
- `metrics_summary.csv`, `web_summary.html`

## Status

Available locally (per Marcos). Populate this folder when uploading the local archive.
