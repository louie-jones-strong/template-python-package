call .venv\Scripts\activate.bat

@REM Type checking
py -m mypy src/ --config-file config.ini

@REM Linting
py -m flake8 src --config=config.ini
py -m flake8 Tests --config=config.ini


@REM Unit tests
coverage run --data-file=reports/.converage -m pytest --junitxml=reports/junit.xml


@REM Create the coverage report
coverage report --data-file=reports/.converage
coverage xml -o reports/coverage.xml --data-file=reports/.converage
@REM coverage html -d reports/coverage --data-file=reports/.converage

@REM Update the badges
genbadge coverage --input-file=reports/coverage.xml --output-file=media/badges/coverage.svg
genbadge tests --input-file=reports/junit.xml --output-file=media/badges/tests.svg