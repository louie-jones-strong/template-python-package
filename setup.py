import os
from importlib import import_module
from setuptools import setup, find_packages


with open(os.path.join("README.md"), "r") as f:
    longDescription = f.read()

with open(os.path.join("requirements.txt"), "r") as f:
    requirements = [i for i in f.read().split("\n") if len(i)]

with open(os.path.join("requirements-dev.txt"), "r") as f:
    devRequirements = [i for i in f.read().split("\n") if len(i)]


setup(
    long_description=longDescription,
    long_description_content_type="text/markdown",
    install_requires=requirements,
    tests_require=devRequirements,
)