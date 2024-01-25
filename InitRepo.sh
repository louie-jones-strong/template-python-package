source PackingScripts/BashUtils.sh

version="0.0.1"
packageDisplayName="MyProject"
internalPackageName="MyProject"
pyPiPackageName="MyProject"
author="MyName"
authorEmail="MyEmail"

read -p "Version [$version]: " versionInput
read -p "Package Display Name [$packageDisplayName]: " packageDisplayNameInput
read -p "Internal Package Name [$internalPackageName]: " internalPackageNameInput
read -p "PyPi Package Name [$pyPiPackageName]: " pyPiPackageNameInput

read -p "Author [$author]: " authorInput
read -p "Author Email [$authorEmail]: " authorEmailInput

Log "Setup virtual environment..."
# RunCommand true source PackingScripts/SetupVenv.sh

# create project
Log "Create project..."
RunCommand false mkdir -p "src/$internalPackageName"
RunCommand false touch "src/$internalPackageName/py.typed"

RunCommand false touch "src/$internalPackageName/__init__.py"
echo "__version__ = \"$version\"" >> "src/$internalPackageName/__init__.py"



# create documentation
Log "Create documentation..."
RunCommand false sphinx-quickstart --quiet --no-sep --templatedir=docs/DocTemplates -p "$packageDisplayName" -a "$author" -v "$version" docs
RunCommand true PackingScripts/UpdateDocs.sh

RunCommand true PackingScripts/UpdateBadges.sh