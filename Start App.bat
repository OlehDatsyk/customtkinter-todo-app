@echo off
setlocal enabledelayedexpansion
title To-Do List App - Setup and Launch
cd /d "%~dp0"

echo ===================================================
echo   To-Do List App - Windows Startup Script
echo ===================================================
echo.

REM ---------------------------------------------------
REM 1. Verify Python is installed
REM ---------------------------------------------------
echo [1/6] Checking for Python installation...
where python >nul 2>&1
if errorlevel 1 (
    echo.
    echo [ERROR] Python was not found on this system.
    echo Please install Python 3.9 or later from https://www.python.org/downloads/
    echo IMPORTANT: During installation, check the box "Add Python to PATH".
    echo See INSTRUCTION.md for a full step-by-step guide.
    echo.
    pause
    exit /b 1
)
python --version
echo Python found successfully.
echo.

REM ---------------------------------------------------
REM 2. Locate the application file
REM ---------------------------------------------------
set "APP_FILE="
if exist "ToDo_App.py" set "APP_FILE=ToDo_App.py"
if not defined APP_FILE if exist "ToDo App.py" set "APP_FILE=ToDo App.py"
if not defined APP_FILE (
    for %%f in (*.py) do (
        if not defined APP_FILE set "APP_FILE=%%f"
    )
)
if not defined APP_FILE (
    echo [ERROR] Could not find the application's .py file in this folder.
    echo Make sure this script is in the same folder as the To-Do app.
    echo.
    pause
    exit /b 1
)
echo Using application file: !APP_FILE!
echo.

REM ---------------------------------------------------
REM 3. Create virtual environment if necessary
REM ---------------------------------------------------
echo [2/6] Checking for virtual environment...
if not exist "venv\Scripts\activate.bat" (
    echo No virtual environment found. Creating one now...
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo Virtual environment created successfully.
) else (
    echo Virtual environment already exists.
)
echo.

REM ---------------------------------------------------
REM 4. Activate the virtual environment
REM ---------------------------------------------------
echo [3/6] Activating virtual environment...
call "venv\Scripts\activate.bat"
if errorlevel 1 (
    echo [ERROR] Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo Virtual environment activated.
echo.

REM ---------------------------------------------------
REM 5. Install missing dependencies
REM ---------------------------------------------------
echo [4/6] Checking dependencies...
python -c "import customtkinter" >nul 2>&1
if errorlevel 1 (
    echo Installing missing dependency: customtkinter ...
    if exist "requirements.txt" (
        pip install -r requirements.txt
    ) else (
        pip install customtkinter
    )
    if errorlevel 1 (
        echo [ERROR] Failed to install dependencies. Check your internet connection.
        pause
        exit /b 1
    )
) else (
    echo All dependencies already installed.
)
echo.

REM ---------------------------------------------------
REM 6. Verify the .env file (optional for this app)
REM ---------------------------------------------------
echo [5/6] Checking for .env file...
if exist ".env.example" (
    if not exist ".env" (
        echo [NOTE] No .env file found, but .env.example exists.
        echo This app does not currently require one, but if future
        echo features need configuration, copy .env.example to .env
        echo and fill in the required values.
    ) else (
        echo .env file found.
    )
) else (
    echo No .env.example present - this app does not require environment
    echo variables to run.
)
echo.

REM ---------------------------------------------------
REM 7. Launch the application
REM ---------------------------------------------------
echo [6/6] Launching To-Do List App...
echo.
python "!APP_FILE!"

if errorlevel 1 (
    echo.
    echo ===================================================
    echo [ERROR] The application closed with an error.
    echo Review the message above, or see the Troubleshooting
    echo section of INSTRUCTION.md for help.
    echo ===================================================
    echo.
    pause
    exit /b 1
)

echo.
echo Application closed normally.
pause
