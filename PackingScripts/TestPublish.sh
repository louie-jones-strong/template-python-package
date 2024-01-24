source BashUtils.sh

Log "Setup virtual environment..."
RunCommand false source SetupVenv.sh


Log "Checking package..."
RunCommand false twine check dist/*

RunCommand true python -m twine upload --repository testpypi dist/* --non-interactive