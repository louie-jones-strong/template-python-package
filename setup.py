
import os
from setuptools import setup, find_packages

DIR = os.path.dirname(os.path.abspath(__file__))

with open(os.path.join(DIR, "README.md"), "r") as f:
    longDescription = f.read()

with open(os.path.join(DIR, "requirements.txt"), "r") as f:
    requirements = [i for i in f.read().split("\n") if len(i)]

with open(os.path.join(DIR, "requirements-dev.txt"), "r") as f:
    devRequirements = [i for i in f.read().split("\n") if len(i)]

setup(
    name="",
    packages=find_packages(where="src"),
    version="0.0.0",
    description="",
    long_description=longDescription,
    long_description_content_type="text/markdown",
    author="",
    author_email="",
    url="",
    install_requires=requirements,
    tests_require=devRequirements,
    python_requires='',
    keywords=[],
    license="",
    classifiers=[
    ],
)