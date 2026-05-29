# CellRanger outputs — Breast cancer snRNA-seq

Expected layout (Chromium Fixed RNA Profiling, CellRanger v7.1.0, GRCh38 2020-A, Chromium Human Transcriptome Probe Set):

```
breast_cancer/
├── patient4/
│   ├── patient4_1/sample_filtered_feature_bc_matrix.h5
│   └── patient4_2/sample_filtered_feature_bc_matrix.h5
└── patient5/
    ├── patient5_1/sample_filtered_feature_bc_matrix.h5
    └── patient5_2/sample_filtered_feature_bc_matrix.h5
```

`_1` and `_2` are replicate snRNA-seq libraries from consecutive SIMPlex sections of patients 4 and 5 (the deepest profiled TNBC cases).

## Status

MISSING — required as input to CellBender (`cellbender/` folder) and downstream `qc_doubletRemoval.rmd`. Awaiting from collaborators.
