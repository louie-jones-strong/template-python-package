source PackingScripts/BashUtils.sh


Log "Creating package..."
RunCommand true py -m build -s -w


Log "Cleaning up build folders..."
RunCommand false rm -rf build
RunCommand false rm -rf src/*.egg-info