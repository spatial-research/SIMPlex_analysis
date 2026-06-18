# Analysis environment (`simplex`)

Reproducible R + Python stack for SIMPlex_analysis. **Single entry point:** `bash environment/setup.sh`.

## Files

| File | Role |
|------|------|
| [`environment.yml`](environment.yml) | Conda: R 4.3.3, Python 3.12, scientific Python libs, system build deps |
| [`renv.lock`](renv.lock) | Pinned CRAN / Bioconductor / GitHub R packages |
| [`spage.lock.json`](spage.lock.json) | Pinned SpaGE git commit (spatial gene imputation) |
| [`spage/setup.py`](spage/setup.py) | Pip packaging shim for SpaGE (upstream repo has none) |
| [`install_spage.sh`](install_spage.sh) | Clone SpaGE at pinned commit and `pip install` into `simplex` |
| [`setup.sh`](setup.sh) | Create/activate conda env, restore renv, install SpaGE, register Jupyter kernel |
| [`cellbender.yml`](cellbender.yml) | Optional separate env for CellBender v0.3 only |

## Python packages

Conda pins the SpaGE runtime stack in `environment.yml`:

- `numpy`, `pandas`, `scipy`, `scikit-learn`
- `loompy` (pip; used from R via reticulate in notebooks)

**SpaGE** is not on PyPI. It is installed from GitHub at the commit in `spage.lock.json` via `install_spage.sh` (called automatically by `setup.sh`). Source is cloned to `environment/vendor/SpaGE/` (gitignored).

```bash
conda activate simplex
python -c "from SpaGE.main import SpaGE"
```

To reinstall or refresh SpaGE only:

```bash
bash environment/install_spage.sh
```

### Updating the SpaGE pin

1. Choose a commit from [tabdelaal/SpaGE](https://github.com/tabdelaal/SpaGE) and update `spage.lock.json` (`commit`, `commit_short`, `commit_message`).
2. Run `bash environment/install_spage.sh` and verify `from SpaGE.main import SpaGE`.
3. Commit the lockfile change with any analysis that depends on the new revision.

## R packages

Restored from `renv.lock` into `environment/renv/library/` on first `setup.sh` run. Key analysis packages: Seurat v5, DoubletFinder, semla, arrow, fgsea, singlet.

## Jupyter

Kernel name: **R (simplex renv)** (`simplex-renv`). R notebooks under `scripts/jupyter/` use this kernel. Python cells in mixed notebooks use the `simplex` conda Python (including SpaGE when imported explicitly).
