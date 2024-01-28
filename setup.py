from setuptools import setup, find_packages
import re
import os

def GetRepositoryUrl():
    """
    Get the repository url from the .git/config file.
    """

    with open(".git/config", "r") as f:
        content = f.read()

    urlRegex = re.compile(r"url = (.*)")
    repositoryUrl = urlRegex.search(content).group(1)

    # check if the url ends with .git
    assert repositoryUrl.endswith(".git"), "The repository url should end with .git"
    assert repositoryUrl.startswith("https://" or "http://"), "The repository url should start with https:// or http://"

    # strip the .git extension
    repositoryUrl = repositoryUrl[:-4]

    return repositoryUrl

def GetLastCommitHash():
    """
    Get the commit hash from the .git/HEAD file.
    """


    with open(".git/FETCH_HEAD", "r") as f:
        content = f.read()

    commitHash = content.split("	")[0]

    return commitHash



def LoadLongDescription():
    """
    Load the long description from the README.md file.
    Then replace the relative paths to absolute paths.
    """

    with open("README.md", "r") as f:
        longDescription = f.read()

    repositoryUrl = GetRepositoryUrl()
    commitHash = GetLastCommitHash()

    longDescription = longDescription.replace("](./", f"]({repositoryUrl}/raw/{commitHash}/")

    return longDescription

def LoadRequirements(fileName):
    with open(fileName, "r") as f:
        content = f.read()

    return [i for i in content.split("\n") if len(i)]

def GetPackageName():
    packages = find_packages(where="src")


    return packages[0]

def GetVersion(packageName):
    packagePath = os.path.join("src", packageName, "__init__.py")

    with open(packagePath, "r") as f:
        content = f.read()

    versionRegex = re.compile(r"__version__ = \"(.*)\"")
    version = versionRegex.search(content).group(1)


    return version

print("="*50)
packageName = GetPackageName()
version = GetVersion(packageName)

print(f"Package name: {packageName}")
print(f"Version: {version}")
print("="*50)

setup(
    long_description=LoadLongDescription(),
    long_description_content_type="text/markdown",
    install_requires=LoadRequirements("requirements.txt"),
    tests_require=LoadRequirements("requirements-dev.txt"),
    version=version
)