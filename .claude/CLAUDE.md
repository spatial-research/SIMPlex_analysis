# Handoff: probe overlap investigation (branch `49-investigate-probe-overlap`)

Context from a previous Claude Code session (2026-10-22, run on a laptop without the data).
Continue on the server where `data/` is unpacked.

## Why

Reviewer comment (paraphrased): SIMPlex runs two whole-transcriptome probe hybridizations on the
same section (Visium CytAssist, then Chromium Flex). CytAssist probe release digests RNA, so sites
engaged in round 1 may be unavailable for Flex. Asked us to (a) report the overlap between the two
probe sets, (b) explain what Flex detects, (c) consider target-dependent depletion / gene-level bias.

Our response goes to the **editor only**, kept brief and theory-based (draft at the bottom). The
plots below are supporting material: show the probe overlap, show that genes correlate well between
Visium and Flex, and report outliers.

## Established facts

**Probe sets used** (preprint methods, https://www.biorxiv.org/content/10.64898/2026.09.07.749790v1):
- snRNA (Flex): Cell Ranger 7.1.0, Chromium Human / Mouse Transcriptome Probe Set **v1.0.1**
- Visium: Space Ranger 2.0.1, **Visium Human v2.0** / **Visium Mouse v1.0**
- All 10 local BC Visium 55 µm `web_summary.html` files report Visium Human v2.0
  (4 runs spaceranger-2.0.1, 6 runs spaceranger-2.1.0 — methods only say 2.0.1).
- Mouse brain is fresh-frozen but run on CytAssist, so it is still probe-based.

**Probe-set comparison** (`scripts/jupyter/technical/probe_overlap.ipynb`, already executed):
- Human Visium v2.0 vs Flex v1.0.1: **identical 54,580 probe sequences**. Only difference: 60 probes
  relabelled `DEPRECATED_` and `included=FALSE` in Flex. Genes: 18,082 shared; Visium-only GABARAPL2,
  SLC39A4, TKT.
- Mouse Visium v1.0 vs Flex v1.0.1: **~3% sequence overlap** (2,329 shared sequences). Genes measured
  by both: 18,253; Visium-only 1,505; Flex-only 806.
- Mouse Visium v2.0 would have been identical to Flex mouse v1.0.1 (not what was used).

**Mechanism (from the user):** CytAssist probe release uses **RNase H** (cuts only RNA in RNA–DNA
heteroduplexes). Early pilot experiments with and without RNase showed it is required for probe
release. Implication: only probe-bound copies are cleaved, at the ~50 nt site; unbound copies stay
intact. Human: Flex reads the residual copies. Mouse: Flex mostly targets other sites, which stay
intact even on cleaved transcripts.

## Task on the server

Extend `scripts/jupyter/technical/probe_overlap.ipynb` (Python, keep code minimal, embed plots,
save to `figs/technical/probe_overlap/`). Run section 1 first: it reads probe-set names from every
`web_summary.html` under `data/` and confirms the versions above, especially **MB_2 = Visium Mouse v1.0**.

1. **Probe overlap figure**: the existing heatmap; optionally per-gene overlap categories for mouse
   (each gene: all / some / none of its Flex probes share a sequence with Visium v1.0).
2. **Gene correlation Visium vs Flex** for each matched sample (same section): pseudobulk per gene
   (sum over spots / over nuclei), CPM, log1p, matched on Ensembl `gene_id`, only genes included in both
   panels. Scatter + Pearson/Spearman. Human BC samples and mouse brain (MB_2 vs mouse snRNA `sample_2`).
3. **Outliers**: fit the log-log relation and flag genes with large residuals (e.g. |z| > 3). For mouse,
   colour by overlap category and check whether residuals differ between shared-site and distinct-site
   genes. Report outlier gene lists as CSV. Human probes are all shared, so outliers there are not due to
   probe design; note the 3 Visium-only genes and 60 deprecated probes.
4. Optional (only if quick): SIMPlex Flex vs control Flex (no Visium step, "SIMPlex Ctrl" cohorts in
   `technical/metrics_comparison.ipynb`) per-gene correlation, to show no gene-specific depletion.

Data paths come from `config.R` / `data/README.md`: `data/spatial/spaceranger/…/filtered_feature_bc_matrix.h5`,
`data/single_nuclei/cellranger/…` (Flex may also have per-probe `raw_probe_bc_matrix.h5`), CellBender
outputs, and `.rds` objects. Prefer the 10x `.h5` files (scanpy `read_10x_h5` / h5py) so this stays Python.

## Methods-text issues to flag to the user (not fixed)
- Mouse reference: methods only mention GRCh38 2020-A; mouse should be mm10-2020-A.
- Space Ranger version: 2.0.1 in text, but 6/10 BC runs are 2.1.0.
- Methods say probe release on CytAssist but never mention RNase.

## Draft editor response (agreed with user)

> We thank the reviewer for raising this point. The probe-release step on CytAssist uses RNase H, which
> cleaves RNA only within RNA–DNA heteroduplexes. Only the transcript copies hybridized to ligated Visium
> probes are cleaved, and only at the ~50-nt probe-binding site; unbound transcript copies are left intact.
> (In pilot experiments we confirmed that this RNase step is required for efficient probe release.)
>
> For human samples, the Visium Human Transcriptome Probe Set v2.0 and the Chromium Flex Human
> Transcriptome Probe Set v1.0.1 are sequence-identical (54,580 probes; 18,082 shared genes). Flex
> therefore detects transcript copies that were not engaged in the first hybridization round, rather than
> different regions of the same transcripts. Because probe hybridization in situ does not capture every
> transcript copy, a residual pool remains available for the second round. For mouse, the Visium Mouse v1.0
> and Flex Mouse v1.0.1 panels share only ~3% of probe sequences while covering 18,253 common genes. Most
> Flex probes therefore target regions outside the Visium binding sites, which RNase H leaves uncut even on
> transcripts engaged in the first round.
>
> Consistent with this, Flex libraries generated after Visium yielded per-nucleus UMI and gene detection
> comparable to published FFPE single-nucleus datasets. This indicates that the remaining substrate is
> sufficient for robust second-round profiling.

## Repo state at handoff
- New: `scripts/jupyter/technical/probe_overlap.ipynb` (Python, executed, outputs embedded).
- Edited: `README.md` (Additional analyses row), `docs/data_availability.md` (10x probe sets section).
- Probe CSVs cache to `data/other/external_references/probe_sets/` (gitignored, auto-downloaded).
