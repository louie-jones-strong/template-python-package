source SetupVenv.sh

# Type checking
python -m mypy src/ --config-file config.ini

# Linting
python -m flake8 src --config=config.ini
python -m flake8 Tests --config=config.ini

# Unit tests
coverage run --data-file=reports/.coverage -m pytest --junitxml=reports/junit.xml

# Create the coverage report
coverage report --data-file=reports/.coverage
coverage xml -o reports/coverage.xml --data-file=reports/.coverage
# coverage html -d reports/coverage --data-file=reports/.coverage

# Update the badges
genbadge coverage --input-file=reports/coverage.xml --output-file=media/badges/coverage.svg
genbadge tests --input-file=reports/junit.xml --output-file=media/badges/tests.svg