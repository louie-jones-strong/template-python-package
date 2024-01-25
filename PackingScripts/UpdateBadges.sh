source PackingScripts/BashUtils.sh


Log "Updating badges..."
RunCommand false genbadge coverage --input-file=reports/coverage.xml --output-file=media/badges/coverage.svg
RunCommand false genbadge tests --input-file=reports/junit.xml --output-file=media/badges/tests.svg
python -m pybadges --left-text=Version --right-text=----- --right-color='blue' >> media/badges/Version.svg