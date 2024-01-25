source PackingScripts/BashUtils.sh

Log "Setup virtual environment..."
RunCommand false source PackingScripts/SetupVenv.sh

# Type checking
Log "Type checking..."
RunCommand true python -m mypy src/ --config-file config.ini

# Linting
Log "Linting..."
RunCommand true python -m flake8 src --config=config.ini
RunCommand true python -m flake8 Tests --config=config.ini

# create package
Log "Creating package..."
RunCommand false source PackingScripts/CreatePackage.sh


# check the created package is valid
Log "Checking package..."
RunCommand true twine check dist/*

# unit tests
Log "Running unit tests..."
RunCommand true coverage run --data-file=reports/.coverage -m pytest --junitxml=reports/junit.xml -q

Log "Creating coverage report..."
RunCommand false coverage xml -o reports/coverage.xml --data-file=reports/.coverage
RunCommand false coverage html -d reports/coverage --data-file=reports/.coverage

RunCommand true PackingScripts/UpdateBadges.sh

RunCommand true PackingScripts/UpdateDocs.sh

Log ""
Log "Complete. See log file for more information: $LogFile"
exit $ExitCode