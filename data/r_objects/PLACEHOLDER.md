# `r_objects/` — Deposited R objects + Xenium outputs

All files in this directory are deposited at the **KTH Data Repository**:

**DOI:** [`10.71775/kth.jg1wh-kza40`](https://datarepository.kth.se/records/jg1wh-kza40)

Download the archive(s), unpack on top of this directory, and the analysis scripts will run end-to-end.

## Expected layout after download

```
r_objects/
├── breast_cancer/
│   ├── CTA/                                   patient3–9 computational tissue annotation CSVs (also git-tracked under resources/)
│   ├── single_nuclei/
│   │   ├── cross_patient/SIMPlex_breast_allSamples.rds    integrated 71,418 BC nuclei (7.8 GB)
│   │   └── other/patient10_seuratAnnotation.rds           patient10 fresh-frozen (5.0 GB)
│   ├── visium/
│   │   ├── cross_patient/VISIUM_breast_allSamples.rds     integrated Visium 55 µm (11 GB)
│   │   ├── HD/patient{4,5}_HD/                            HD spatial.rds + 4 deconvolution map CSVs each
│   │   └── spatial_bc_FreshFixed_filtered.rds             patient10 FF Visium (608 MB)
│   ├── visium_histpathology/                  pathologist spot annotations (also git-tracked under resources/)
│   └── xenium/patient{4,5}/                   full Xenium Analyzer outputs (zarr.zip, ~4 GB each)
├── mouse_brain/
│   ├── snRNA.rds                              processed mouse brain snRNA (1.4 GB)
│   └── visium/{A,B}/                          SpaceRanger outputs (matrices, spatial/, web_summary.html)
└── prostate_cancer/
    ├── HD/{pt10,pt20}_visHD.rds               processed VisiumHD objects (1.4 GB)
    └── single_nuclei/{pt10,pt20}_HD_seuratAnnotation.rds  annotated snRNA (392 MB)
```

Total uncompressed: ~37 GB. The repository's `.gitignore` excludes everything here except this `PLACEHOLDER.md`, so the folder appears in git but no heavy file is ever tracked.

## Note on legacy naming inside deposited objects

Some saved Seurat objects still use the legacy assay names `garvan_major_map`, `garvan_subpopulation`, `niche_score_garvan`, and `top_niche_garvan` for the BC Atlas (Wu et al. 2021) reference. The analysis scripts read these assays under those names for compatibility with the deposit; **all user-facing plot labels and figure captions display them as "BC Atlas"** via the script-level recode maps.
