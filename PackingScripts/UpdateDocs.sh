source PackingScripts/BashUtils.sh


Log "Updating docs..."
# RunCommand true docs/make html
RunCommand true sphinx-build -M html docs docs/_build