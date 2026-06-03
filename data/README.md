# `data/` — Heavy data root

Runtime data for the SIMPlex pipeline. Directory structure and README files are git-tracked; actual data files are gitignored.

## Get the data

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

1. Download the KTH archive (~37 GB processed data).
2. Unpack so the three top-level folders merge into this directory:
   - `data/spatial/`
   - `data/single_nuclei/`
   - `data/other/`

After unpacking, paths should match what the scripts expect via `config.R`.

## Layout

| Branch | Contents |```{r}
```
|--------|----------|
| [`spatial/`](spatial/) | SpaceRanger outputs, Xenium, Visium/HD Seurat objects |
| [`single_nuclei/`](single_nuclei/) | CellRanger, CellBender, snRNA RDS, raw FASTQs |
| [`other/`](other/) | External reference atlases, CTA CSVs, histopathology spot annotations |

```
data/
├── spatial/
│   ├── spaceranger/          # Visium 55 µm, HD, mouse brain
│   ├── r_objects/            # Visium Seurat objects, deconvolution maps
│   └── xenium/               # Xenium Analyzer outputs (patients 4, 5)
├── single_nuclei/
│   ├── cellranger/
│   ├── cellbender/
│   ├── r_objects/            # snRNA Seurat objects
│   └── raw_data/             # FASTQs (upon publication)
└── other/
    ├── external_references/  # Wu BC atlas, Linnarsson, Allen, Cords CAF, …
    ├── CTA/                  # computational tissue annotation per sample
    └── histpathology_visium/ # pathologist spot annotations
```

Generated figures go to [`figs/`](../figs/) at the repo root (not inside `data/`).

## Population status

The KTH deposit is the canonical complete copy. The git checkout may be **partially populated** while files are being organized for upload:

| Item | Status |
|------|--------|
| External references (`other/external_references/`) | Present |
| CTA + histopathology (`other/CTA/`, `other/histpathology_visium/`) | Present |
| Cross-patient snRNA RDS (`single_nuclei/r_objects/breast_cancer/cross_patient/`) | Partial |
| HD Visium objects (`spatial/r_objects/breast_cancer/HD/`) | Partial (patients 4, 5) |
| Per-sample snRNA RDS (`single_nuclei/r_objects/breast_cancer/per_sample/`) | **Not yet populated** |
| 55 µm Visium Seurat objects (`spatial/r_objects/breast_cancer/55um/`) | **Not yet populated** |
| Full SpaceRanger 55 µm cohort (patients 1–9) | Partial (patients 1–2 present) |
| Integrated prostate RDS (`single_nuclei/r_objects/prostate_cancer/integrated/`) | **Not yet populated** |
| Xenium raw outputs | Partial |

This table will be updated as files are placed. Re-download from KTH after the deposit is finalized.

## Nested READMEs

Per-folder expected layouts and status:

- `spatial/spaceranger/breast_cancer/{55um,HD}/README.md`
- `spatial/spaceranger/{prostate_cancer/HD,mouse_brain}/README.md`
- `spatial/xenium/breast_cancer/README.md`
- `single_nuclei/{cellranger,cellbender}/*/README.md`
- `other/external_references/README.md`

External download URLs: [`docs/data_availability.md`](../docs/data_availability.md).
