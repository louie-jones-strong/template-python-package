import re

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

def GetCurrentBranch():
    """
    Get the current branch from the .git/HEAD file.
    """

    with open(".git/HEAD", "r") as f:
        content = f.read()

    branch = content.replace("ref: refs/heads/", "").strip()

    return branch