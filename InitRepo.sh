source PackingScripts/BashUtils.sh

version="0.0.1"
projectName="MyProject"
author="MyName"

read -p "Version [$version]: " versionInput
read -p "Project name [$projectName]: " projectNameInput
read -p "Author [$author]: " authorInput

Log "Setup virtual environment..."
# RunCommand true source PackingScripts/SetupVenv.sh

RunCommand true sphinx-quickstart --quiet --no-sep --ext-autodoc --ext-todo --ext-coverage --ext-viewcode --ext-githubpages --templatedir=docs/DocTemplates -p "$projectName" -a "$author" -v "$version" docs

RunCommand true PackingScripts/UpdateDocs.sh

