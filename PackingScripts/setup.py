import GitHelper
from setuptools import setup



def LoadLongDescription():
    """
    Load the long description from the README.md file.
    Then replace the relative paths to absolute paths.
    """

    with open("README.md", "r") as f:
        longDescription = f.read()

    repositoryUrl = GitHelper.GetRepositoryUrl()
    commitHash = GitHelper.GetLastCommitHash()

    longDescription = longDescription.replace("](./", f"]({repositoryUrl}/raw/{commitHash}/")

    return longDescription

def LoadRequirements(fileName):
    with open(fileName, "r") as f:
        content = f.read()

    return [i for i in content.split("\n") if len(i)]




setup(
    long_description=LoadLongDescription(),
    long_description_content_type="text/markdown",
    install_requires=LoadRequirements("requirements.txt"),
    tests_require=LoadRequirements("requirements-dev.txt"),
)