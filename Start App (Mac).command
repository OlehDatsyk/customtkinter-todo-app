#!/bin/bash
# To-Do List App - macOS Startup Script
# Double-click this file to set up and launch the app.
# If macOS blocks it the first time, right-click -> Open -> Open.

cd "$(dirname "$0")"

echo "==================================================="
echo "  To-Do List App - macOS Startup Script"
echo "==================================================="
echo

# ---------------------------------------------------
# 1. Verify Python is installed
# ---------------------------------------------------
echo "[1/6] Checking for Python installation..."

PYTHON_CMD=""
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD="python"
fi

if [ -z "$PYTHON_CMD" ]; then
    echo
    echo "[ERROR] Python was not found on this system."
    echo "Please install Python 3.9 or later from https://www.python.org/downloads/"
    echo "See INSTRUCTION.md for a full step-by-step guide."
    echo
    read -p "Press Enter to exit..."
    exit 1
fi

$PYTHON_CMD --version
echo "Python found successfully (using '$PYTHON_CMD')."
echo

# ---------------------------------------------------
# 2. Locate the application file
# ---------------------------------------------------
APP_FILE=""
if [ -f "ToDo_App.py" ]; then
    APP_FILE="ToDo_App.py"
elif [ -f "ToDo App.py" ]; then
    APP_FILE="ToDo App.py"
else
    APP_FILE=$(find . -maxdepth 1 -name "*.py" | head -n 1)
fi

if [ -z "$APP_FILE" ]; then
    echo "[ERROR] Could not find the application's .py file in this folder."
    echo "Make sure this script is in the same folder as the To-Do app."
    echo
    read -p "Press Enter to exit..."
    exit 1
fi
echo "Using application file: $APP_FILE"
echo

# ---------------------------------------------------
# 3. Create virtual environment if necessary
# ---------------------------------------------------
echo "[2/6] Checking for virtual environment..."
if [ ! -f "venv/bin/activate" ]; then
    echo "No virtual environment found. Creating one now..."
    $PYTHON_CMD -m venv venv
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to create the virtual environment."
        read -p "Press Enter to exit..."
        exit 1
    fi
    echo "Virtual environment created successfully."
else
    echo "Virtual environment already exists."
fi
echo

# ---------------------------------------------------
# 4. Activate the virtual environment
# ---------------------------------------------------
echo "[3/6] Activating virtual environment..."
source "venv/bin/activate"
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to activate the virtual environment."
    read -p "Press Enter to exit..."
    exit 1
fi
echo "Virtual environment activated."
echo

# ---------------------------------------------------
# 5. Install missing dependencies
# ---------------------------------------------------
echo "[4/6] Checking dependencies..."
python -c "import customtkinter" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Installing missing dependency: customtkinter ..."
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        pip install customtkinter
    fi
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to install dependencies. Check your internet connection."
        read -p "Press Enter to exit..."
        exit 1
    fi
else
    echo "All dependencies already installed."
fi
echo

# ---------------------------------------------------
# 6. Verify the .env file (optional for this app)
# ---------------------------------------------------
echo "[5/6] Checking for .env file..."
if [ -f ".env.example" ]; then
    if [ ! -f ".env" ]; then
        echo "[NOTE] No .env file found, but .env.example exists."
        echo "This app does not currently require one, but if future"
        echo "features need configuration, copy .env.example to .env"
        echo "and fill in the required values."
    else
        echo ".env file found."
    fi
else
    echo "No .env.example present - this app does not require environment"
    echo "variables to run."
fi
echo

# ---------------------------------------------------
# 7. Launch the application
# ---------------------------------------------------
echo "[6/6] Launching To-Do List App..."
echo
python "$APP_FILE"
STATUS=$?

if [ $STATUS -ne 0 ]; then
    echo
    echo "==================================================="
    echo "[ERROR] The application closed with an error."
    echo "Review the message above, or see the Troubleshooting"
    echo "section of INSTRUCTION.md for help."
    echo "==================================================="
    echo
    read -p "Press Enter to exit..."
    exit 1
fi

echo
echo "Application closed normally."
read -p "Press Enter to exit..."
