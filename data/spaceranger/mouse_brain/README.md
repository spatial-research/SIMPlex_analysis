# SpaceRanger outputs — Mouse brain Visium

Expected layout:

```
mouse_brain/
├── A/
│   ├── filtered_feature_bc_matrix.h5
│   ├── raw_feature_bc_matrix.h5
│   ├── probe_set.csv
│   ├── spatial/ (tissue_positions.csv, scalefactors_json.json, images)
│   └── web_summary.html
└── B/  (same structure)
```

## Status

A and B SpaceRanger outputs are already in `data/processed_data/mouse_brain/visium/A/` and `.../B/` (symlinked from data_submission). The scripts load from there. This folder is reserved if you want to keep the raw SpaceRanger output tree separately.
