# `data/` — SIMPlex data

Four **top-level** areas. **`raw_data/` is separate** from the processed trees (`single_nuclei/`, `spatial/`): scripts never read raw files (no `RAW_ROOT` in `config.R`). Analysis uses CellRanger, CellBender, SpaceRanger outputs and deposited `.rds` objects only.

| Folder | Role | Submission |
|--------|------|------------|
| `raw_data/` | FASTQs and microscopy (local curation layout) | **Separate** sequence-data deposit (not bundled with processed data) |
| `single_nuclei/` | Processed snRNA: CellRanger → CellBender → Seurat objects | Main processed deposit |
| `spatial/` | Processed spatial: SpaceRanger, Xenium, Visium Seurat objects | Main processed deposit |
| `other/` | CTA, histopathology, public reference atlases | Main processed deposit |

- **Processed data (figures / re-run from matrices):** KTH Data Repository, DOI [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40). Unpack `single_nuclei/`, `spatial/`, and `other/` into `data/`.
- **Raw sequencing data:** deposited **separately** upon publication (same folder layout as `raw_data/` below; link from the KTH record). A local `raw_data/` copy may exist during curation but is not required to run the analysis scripts.
- **Tracking:** directory structure and `.md` files are git-tracked; data files are gitignored. The KTH deposit is the canonical complete copy.
- **IDs:** breast cancer `patient1`–`patient10`; prostate `pt10` / `pt20`; mouse brain `A` / `B`. No source institution IDs or dates in paths or filenames.
- **`55um` = standard Visium** (55 µm spot pitch), not section thickness. Contrast with `HD` (Visium HD, 2 µm bins). Fresh-frozen breast (patient10) is standard Visium → under `55um/`.
- **Multi-library samples:** two sequencing libraries → `patientN/patientN_1` and `patientN/patientN_2` under snRNA and (where applicable) spatial raw / SpaceRanger. Single-library samples use a flat `patientN/` (snRNA) or `patientN_55um/` (SpaceRanger).

**Spatial naming:** SpaceRanger folders use a `_55um` or `_HD` suffix (`patient4_55um`, `patient4_HD`). Raw spatial folders use `patientN` only (`55um/patient4/`, not `patient4_55um/`).

---

## Cohort

| Sample | Subtype | Spatial | snRNA | Notes |
|--------|---------|---------|-------|-------|
| patient1 | Luminal A | Visium 55 µm | yes | snRNA from early FFPE pilot (`SIMPlex_FFPE`) |
| patient2 | Luminal B (ER) | Visium 55 µm | yes | same pilot library as patient1 |
| patient3 | TNBC | Visium 55 µm | yes | low quality; not in integrative analysis |
| patient4 | TNBC | Visium 55 µm + **HD** | yes (55 µm + HD) | multimodal; consecutive HD section |
| patient5 | TNBC | Visium 55 µm + **HD** + Xenium | yes (55 µm + HD) | multimodal |
| patient6 | TNBC | Visium 55 µm | yes | two FLEX libraries (`patient6_1`, `patient6_2`) |
| patient7 | Luminal B (ER) | Visium 55 µm | yes | |
| patient8 | Luminal A | Visium 55 µm | yes | |
| patient9 | Luminal B (ER) | Visium 55 µm | yes | |
| patient10 | unknown | Visium 55 µm (2 FF sections) | yes | fresh-frozen; object `spatial_bc_FreshFixed_filtered.rds`; snRNA pool `SIMPlex_BC1`; not in FFPE integrative analysis |
| pt10 | Prostate | Visium HD | yes | |
| pt20 | Prostate | Visium HD | yes | |
| A | Mouse brain | Visium | yes | |
| B | Mouse brain | Visium | yes | |

Subtype metadata: [`../resources/sample_metadata.csv`](../resources/sample_metadata.csv).

---

## Directory layout

```
data/
│
├── raw_data/                              # NOT read by analysis scripts
│   ├── single_nuclei/
│   │   ├── breast_cancer/                 # all snRNA FASTQs flat (pool-level *.fastq.gz)
│   │   │   # 55 µm: snrna_pool1–3, SIMPlex_FFPE, SIMPlex_BC1, …
│   │   │   # HD section nuclei: visHD_BC_rep1, visHD_BC_rep2 (multiplex → patient4 + patient5)
│   │   ├── mouse_brain/                   # MOB_Chromium, sn_sample_1/2
│   │   ├── prostate_cancer/               # prostate_AP5_P2 (multiplex → pt10 + pt20)
│   │   └── technical_experiments/         # SIMPlex_Rev001
│   └── spatial/
│       ├── breast_cancer/
│       │   ├── 55um/
│       │   │   ├── patient1 … patient9/   # fastqs/, images/, manual_alignment/
│       │   │   └── patient10/
│       │   │       ├── patient10_1/
│       │   │       └── patient10_2/     # H&E/CytAssist source TIFFs pending
│       │   └── HD/                        # placeholder (breast HD raw FASTQs pending)
│       ├── mouse_brain/{A,B}/             # fastqs/, images/, manual_alignment/
│       └── prostate_cancer/{pt10,pt20}/   # fastqs/, images/
│
├── single_nuclei/                         # SN_ROOT in config.R
│   ├── cellranger/
│   │   ├── breast_cancer/
│   │   │   ├── 55um/                      # patient1–3,7–9 (flat); patient4–6,10 (patientN_k/)
│   │   │   └── HD/                        # patient4, patient5
│   │   ├── mouse_brain/                   # sn_MOB_chromium_flex, sn_sample_1, sn_sample_2
│   │   ├── prostate_cancer/               # pt10, pt20
│   │   └── technical_experiments/         # outs_SIMPlex_Rev001_Tube1, Tube2
│   ├── cellbender/
│   │   ├── breast_cancer/55um/            # same patient layout as cellranger/55um
│   │   ├── breast_cancer/HD/              # patient4 (patient4_1/2), patient5
│   │   ├── mouse_brain/                   # sample_1, sample_2
│   │   └── prostate_cancer/               # pt10, pt20
│   └── r_objects/
│       ├── breast_cancer/cross_patient/SIMPlex_breast_allSamples.rds
│       ├── breast_cancer/other/patient10_seuratAnnotation.rds
│       ├── mouse_brain/snRNA.rds
│       └── prostate_cancer/{pt10_HD_seuratAnnotation.rds, pt20_HD_seuratAnnotation.rds}
│
├── spatial/                               # SPATIAL_ROOT in config.R
│   ├── spaceranger/
│   │   ├── breast_cancer/
│   │   │   ├── 55um/                      # patient1_55um … patient9_55um;
│   │   │   │                              # patient10_55um/patient10_{1,2}
│   │   │   └── HD/                        # patient4_HD, patient5_HD (binned_outputs)
│   │   ├── mouse_brain/{A,B}/
│   │   └── prostate_cancer/HD/            # pt10_HD, pt20_HD
│   ├── r_objects/
│   │   ├── breast_cancer/cross_patient/VISIUM_breast_allSamples.rds
│   │   ├── breast_cancer/HD/{patient4_HD,patient5_HD}/   # *_spatial.rds, *_major_map.csv
│   │   ├── breast_cancer/spatial_bc_FreshFixed_filtered.rds   # patient10 Visium (2 sections)
│   │   └── prostate_cancer/{pt10_visHD.rds, pt20_visHD.rds}
│   │   # per-sample 55 µm RDS: spatial/r_objects/breast_cancer/55um/<sample>/  (script output)
│   └── xenium/breast_cancer/{patient4,patient5}/
│
└── other/                                 # OTHER_ROOT in config.R
    ├── external_references/
    ├── CTA/
    └── histpathology_visium/
```

---

## What scripts read

Paths come from [`../config.R`](../config.R): `CELLRANGER`, `CELLBENDER`, `SN_RDS`, `SPACERANGER`, `SPATIAL_RDS`, `XENIUM`, `CTA_DIR`, `HISTO_DIR`, `EXT_REFS`. None point at `raw_data/`.

| Layer | Typical files | Used by |
|-------|---------------|---------|
| `single_nuclei/cellbender/…/*_cellbender_filtered.h5` | Denoised count matrix | `qc_doubletRemoval.rmd`, `mouse_brain/sn_analysis.Rmd` |
| `single_nuclei/cellranger/…/count/*.h5` | CellRanger matrices | QC (optional), pipeline input to CellBender |
| `single_nuclei/r_objects/…/*.rds` | Annotated snRNA | Breast / prostate / mouse analysis Rmds |
| `spatial/spaceranger/…` | `filtered_feature_bc_matrix.h5`, `spatial/`, HD `binned_outputs/` | Spatial analysis Rmds |
| `spatial/r_objects/…/*.rds` | Visium Seurat + deconvolution maps | Breast / prostate analysis |
| `spatial/xenium/…` | Xenium Analyzer output | `analysis_cellStateLevel.rmd` |
| `other/CTA/`, `other/histpathology_visium/` | Per-patient CSVs | `analysis_majorLevel.rmd` |
| `other/external_references/` | Public atlases | See [`../docs/data_availability.md`](../docs/data_availability.md) |

---

## snRNA raw → processed layers

### Standard Visium (55 µm) — pool-level FASTQs at `raw_data/…/breast_cancer/*.fastq.gz`

Multiplexed FLEX pools; patients are separated at CellRanger demultiplexing into `cellranger/…/55um/`:

| Raw FASTQ prefix | Patients |
|------------------|----------|
| `snrna_pool1`–`snrna_pool3` | patient3–patient9 |
| `SIMPlex_FFPE` | patient1, patient2 |
| `SIMPlex_BC1` | patient10 (`patient10_1`, `patient10_2`) |
| `single-nuclei_BC` | earlier pilot (not in manuscript objects) |
| `visHD_BC_rep1` | **patient4_HD + patient5_HD** (multiplex Visium-HD section nuclei; demux at CellRanger) |
| `visHD_BC_rep2` | same library, sequencing replicate 2 |

Processed HD snRNA: `cellranger|cellbender/…/HD/patient4/` (`patient4_1` ← rep1, `patient4_2` ← rep2) and `…/HD/patient5/` (manuscript object from `SIMPlex_4497`; alternate rep1/rep2 demux for patient5 is archived).

Prostate: `prostate_AP5_P2` → `pt10`, `pt20`. Barcode provenance: `remove_before_submission/provenance_trace.md` (local, gitignored).

---

## Deconvolution maps (breast HD)

| Strategy | Assay / file prefix | Reference |
|----------|---------------------|-----------|
| SIMPlex (section-matched) | `patspec_major_map` | Same-section snRNA |
| Pooled SIMPlex | `simplex_major_map` | All SIMPlex nuclei |
| Technical control | `control_major_map` | Other patients' nuclei |
| Public BC atlas | `garvan_major_map` | Wu et al. 2021 (public reference name, not a patient ID) |

---

## Status

| Item | Status |
|------|--------|
| Processed snRNA + spatial (CellRanger, CellBender, SpaceRanger, objects, Xenium) | Ready for submission; barcode-verified vs manuscript `.rds` |
| Main KTH deposit (`single_nuclei/`, `spatial/`, `other/`, `figs/`) | Processed layers + objects (scripts do not need raw FASTQs) |
| Raw sequencing (`raw_data/`) | **Separate deposit** upon publication |
| Raw snRNA HD breast (`visHD_BC_rep*`) | **Present** (flat in `breast_cancer/`; multiplex patient4 + patient5) |
| Raw spatial HD breast (`raw_data/spatial/breast_cancer/HD/`) | **Pending** (Visium HD spatial FASTQs; not the same as HD snRNA above) |
| patient10 H&E / CytAssist source TIFFs | Pending (collaborator copy; sequence or image deposit as applicable) |
| Per-sample `spatial/r_objects/breast_cancer/55um/<sample>/` | Generated when running analysis scripts |
