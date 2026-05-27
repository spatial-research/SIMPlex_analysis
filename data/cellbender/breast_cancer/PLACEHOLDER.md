# CellBender outputs — Breast cancer snRNA-seq

CellBender v0.3+ removes ambient RNA / background noise from CellRanger outputs. Expected files per replicate (input to `scripts/qc_doubletRemoval.rmd`):

```
breast_cancer/
├── patient4/
│   ├── patient4_1_cellbender_filtered.h5     # the primary file consumed by QC script
│   ├── patient4_1_cellbender.h5
│   ├── patient4_1_cellbender_posterior.h5
│   ├── patient4_1_cellbender_metrics.csv
│   ├── patient4_1_cellbender_cell_barcodes.csv
│   ├── patient4_1_cellbender_report.html
│   ├── patient4_1_cellbender.pdf
│   ├── patient4_1_cellbender.log
│   └── (patient4_2_ counterparts)
└── patient5/  (analogous)
```

Generate by running CellBender's `cellbender remove-background` on the CellRanger `raw_feature_bc_matrix.h5` for each replicate. See Fleming et al. 2023 (Nat. Methods) for parameter recommendations.

## Status

Files were available previously under the original `data/visHD_scrapes/` layout. To repopulate: copy the existing CellBender outputs here using the `patient{N}_{1,2}_*` naming convention.