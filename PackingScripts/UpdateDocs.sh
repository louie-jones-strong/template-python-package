source PackingScripts/BashUtils.sh


Log "Updating docs..."
RunCommand true sphinx-build -M html docs docs/_build