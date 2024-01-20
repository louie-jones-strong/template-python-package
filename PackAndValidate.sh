source BashUtils.sh

Log "Setup virtual environment..."
RunCommand false source SetupVenv.sh

# Type checking
Log "Type checking..."
RunCommand true python -m mypy src/ --config-file config.ini

# Linting
Log "Linting..."
RunCommand true python -m flake8 src --config=config.ini
RunCommand true python -m flake8 Tests --config=config.ini

# create package
Log "Creating package..."
RunCommand false py -m build -s -w

# check the created package is valid
Log "Checking package..."
RunCommand true twine check dist/*

# unit tests
Log "Running unit tests..."
RunCommand true coverage run --data-file=reports/.coverage -m pytest --junitxml=reports/junit.xml -q

Log "Creating coverage report..."
RunCommand false coverage xml -o reports/coverage.xml --data-file=reports/.coverage
RunCommand false coverage html -d reports/coverage --data-file=reports/.coverage

Log "Updating badges..."
RunCommand false genbadge coverage --input-file=reports/coverage.xml --output-file=media/badges/coverage.svg
RunCommand false genbadge tests --input-file=reports/junit.xml --output-file=media/badges/tests.svg


Log ""
Log "Complete. See log file for more information: $LogFile"
exit $ExitCode