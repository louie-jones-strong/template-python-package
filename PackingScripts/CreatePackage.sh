source PackingScripts/BashUtils.sh


Log "Cleaning up build folders Pre Build..."
RunCommand false rm -rf dist
RunCommand false rm -rf build
RunCommand false rm -rf src/*.egg-info


Log "Creating package..."
RunCommand true py -m build -s -w


Log "Cleaning up build folders Post Build..."
RunCommand false rm -rf build
RunCommand false rm -rf src/*.egg-info