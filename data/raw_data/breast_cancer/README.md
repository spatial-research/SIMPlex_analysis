# Raw breast cancer sequencing data — TO BE DEPOSITED

This directory will hold the raw inputs for the breast cancer (BC) cohort:

## Expected contents

- `fastq/patient{1-10}_55um/` — Visium 55 µm spatial transcriptomics FASTQs (Read 1: 28 bp, Read 2: 50 bp; NextSeq 2000)
- `fastq/patient{4,5}_HD/` — Visium HD spatial FASTQs (Read 1: 43 bp, Read 2: 50 bp)
- `fastq/patient{4,5}_xenium/` — Xenium in situ raw outputs (decoded transcripts, segmented masks)
- `fastq/patient{4,5}_{1,2}_snRNA/` — Chromium snRNA-seq FASTQs (Read 1: 28 bp, Read 2: 90 bp) — patients 4 and 5, two replicates each
- `images/H&E/patient*.tiff` — High-resolution H&E whole-slide TIFFs used for CytAssist registration and CTA annotation

## Status

Not deposited yet. Raw sequencing data will be uploaded to a public repository upon publication. See `docs/data_availability.md` for the public DOI of processed data (KTH Data Repository).
