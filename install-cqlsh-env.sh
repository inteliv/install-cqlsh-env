#!/bin/bash

VENV_PATH="/opt/cqlsh-venv"

echo "🔵 Starting safe production installation of Python virtual environment for CQLSH..."

# Step 1: Update repositories
echo "➡️ Updating system package list..."
sudo apt update

# Step 2: Ensure required packages are installed
echo "➡️ Installing Python3, python3-venv, and pip3 if needed..."
sudo apt install -y python3 python3-venv python3-pip

# Step 3: Check if the virtual environment already exists
if [ -d "$VENV_PATH" ]; then
    echo "⚠️  Virtual environment already exists at $VENV_PATH."
    echo "✅ Skipping creation. Activating existing environment..."
else
    echo "➡️ Creating Python virtual environment at $VENV_PATH..."
    sudo python3 -m venv "$VENV_PATH"
fi

# Step 4: Activate the virtual environment
echo "➡️ Activating virtual environment..."
source "$VENV_PATH/bin/activate"

# Step 5: Upgrade pip inside the virtual environment
echo "➡️ Upgrading pip inside virtual environment..."
pip install --upgrade pip

# Step 6: Check installed packages and install missing ones
REQUIRED_PACKAGES=("six" "cassandra-driver" "cqlsh")

echo "➡️ Checking and installing required Python packages..."
for package in "${REQUIRED_PACKAGES[@]}"; do
    pip show "$package" >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "📦 Installing missing package: $package"
        pip install "$package"
    else
        echo "✅ Package already installed: $package"
    fi
done

# Step 7: Done!
echo ""
echo "✅ Setup complete!"
echo ""
echo "👉 To start using cqlsh, run the following commands:"
echo "   source $VENV_PATH/bin/activate"
echo "   cqlsh"
echo ""
echo "🛑 To exit the virtual environment, simply type: deactivate"
echo ""
