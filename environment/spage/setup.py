"""Packaging shim for tabdelaal/SpaGE (upstream has no setup.py).

Pinned source revision: environment/spage.lock.json
"""
from setuptools import setup

setup(
    name="SpaGE",
    version="1.0.0",
    packages=["SpaGE"],
    install_requires=[
        "numpy>=1.26,<2",
        "pandas>=2.2,<3",
        "scipy>=1.13,<2",
        "scikit-learn>=1.5,<2",
    ],
)
