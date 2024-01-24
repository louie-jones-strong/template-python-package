# if venv does not exist, create it
if [ ! -d ".venv" ]; then
	echo "Creating virtual environment..."
	python -m pip install virtualenv
	python -m virtualenv .venv
fi

echo "Activating virtual environment..."
source .venv/Scripts/activate


echo "Upgrading pip..."
python -m pip install --upgrade pip

echo "Installing package requirements..."
pip install -q -r requirements.txt

echo "Installing dev requirements..."
pip install -q -r requirements-dev.txt