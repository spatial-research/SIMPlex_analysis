# Xenium outputs — Breast cancer

Full Xenium Analyzer outputs are already available under `data/processed_data/breast_cancer/xenium/patient{4,5}/` (symlinked from data_submission). Each folder contains:

- `cells.zarr.zip`, `cell_feature_matrix.zarr.zip`, `transcripts.zarr.zip`, `analysis.zarr.zip`
- `experiment.xenium`, `gene_panel.json`, `morphology_focus.ome.tif`
- `patient{4,5}_annotation.csv` — cell type annotations (Python ingest, scanpy two-stage label transfer from BC atlas; see manuscript methods)
- `patient{4,5}_gene_groups.csv` — gene group definitions

This `xenium/` directory in DATA_ROOT is reserved for the raw Xenium folder structure if you prefer separating it from `processed_data/`. The scripts load from `processed_data/breast_cancer/xenium/` by default.

## Status

Available via the symlinked `processed_data/` (4.2 GB patient4 + 4.1 GB patient5).
