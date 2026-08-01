# Beginner's Guide: Setting Up and Running the To-Do List App

This guide assumes you have **never used Python, Git, Visual Studio Code, virtual environments, or the terminal before**. Follow every step in order - nothing is assumed.

---

## Table of Contents

1. [Installing Python](#1-installing-python)
2. [Installing Git](#2-installing-git)
3. [Installing Visual Studio Code](#3-installing-visual-studio-code)
4. [Recommended VS Code Extensions](#4-recommended-vs-code-extensions)
5. [Opening the Project](#5-opening-the-project)
6. [Creating a Virtual Environment](#6-creating-a-virtual-environment)
7. [Activating the Virtual Environment](#7-activating-the-virtual-environment)
8. [Installing Dependencies](#8-installing-dependencies)
9. [The .env File](#9-the-env-file)
10. [Running the Application](#10-running-the-application)
11. [Testing the Application](#11-testing-the-application)
12. [Using Every Feature](#12-using-every-feature)
13. [Troubleshooting](#13-troubleshooting)
14. [FAQ](#14-faq)
15. [Common Mistakes](#15-common-mistakes)
16. [Security Recommendations](#16-security-recommendations)
17. [Next Learning Steps](#17-next-learning-steps)

---

## 1. Installing Python

Python is the programming language this app is written in.

1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Click the big **Download Python** button (it auto-detects your OS).
3. Run the installer.
   - **Windows:** On the first installer screen, check the box **"Add Python to PATH"** before clicking Install. This step is critical - if you skip it, your terminal won't recognize Python.
   - **macOS:** Run the downloaded `.pkg` file and follow the prompts (defaults are fine).
4. Verify the installation:
   - Open a terminal (see box below) and type:
     ```
     python --version
     ```
     On macOS, if that doesn't work, try:
     ```
     python3 --version
     ```
   - You should see something like `Python 3.12.4`. Any version 3.9 or higher works.

> **What's a terminal?** It's a text-based way to give your computer commands.
> - **Windows:** Press the Start menu, type `cmd`, and open **Command Prompt** (or `PowerShell`).
> - **macOS:** Press `Cmd + Space`, type `Terminal`, and press Enter.

---

## 2. Installing Git

Git lets you download ("clone") and manage code projects, including this one, from GitHub.

1. Go to [https://git-scm.com/downloads](https://git-scm.com/downloads)
2. Download the installer for your OS and run it.
3. On Windows, the default options in the installer are fine - just keep clicking "Next."
4. Verify installation by opening a terminal and typing:
   ```
   git --version
   ```
   You should see a version number like `git version 2.45.0`.

> If you already have the project folder (e.g. downloaded as a `.zip`), you can skip Git and just extract the folder instead.

---

## 3. Installing Visual Studio Code

Visual Studio Code (VS Code) is a free code editor that makes it easy to view and edit the project files.

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Click **Download** for your operating system.
3. Run the installer and accept the defaults.
4. Open VS Code once installation finishes to confirm it launches correctly.

---

## 4. Recommended VS Code Extensions

Open VS Code, click the **Extensions** icon in the left sidebar (it looks like four squares), and install:

| Extension | Publisher | Purpose |
|---|---|---|
| Python | Microsoft | Syntax highlighting, IntelliSense, and running Python files |
| Pylance | Microsoft | Faster, smarter Python code analysis (usually installs automatically with Python extension) |

To install: search the extension name in the Extensions panel, then click **Install**.

---

## 5. Opening the Project

**Option A - Using Git:**
```
git clone <your-repo-url>
cd <your-repo-folder>
```

**Option B - Downloaded as a ZIP:**
1. Extract the `.zip` file to a folder you'll remember (e.g. `Documents/ToDoApp`).

**Then, open it in VS Code:**
1. Open VS Code.
2. Go to **File -> Open Folder...**
3. Select the project folder and click **Select Folder** (Windows) or **Open** (macOS).

---

## 6. Creating a Virtual Environment

A virtual environment is an isolated space for this project's Python packages, so they don't interfere with other projects on your computer.

1. Open a terminal **inside VS Code**: go to **Terminal -> New Terminal** in the top menu.
2. Make sure you're in the project folder (the terminal usually opens there automatically).
3. Run:
   ```
   python -m venv venv
   ```
   (On macOS, use `python3` instead of `python` if needed.)
4. This creates a new folder called `venv` inside your project. This folder should **not** be uploaded to GitHub (see [Security Recommendations](#16-security-recommendations)).

---

## 7. Activating the Virtual Environment

You need to "activate" the environment every time you open a new terminal to work on this project.

**Windows (Command Prompt):**
```
venv\Scripts\activate
```

**Windows (PowerShell):**
```
venv\Scripts\Activate.ps1
```
> If PowerShell blocks this with a script execution error, see [Troubleshooting](#13-troubleshooting).

**macOS/Linux:**
```
source venv/bin/activate
```

When activated, you'll see `(venv)` appear at the start of your terminal line. This confirms it worked.

---

## 8. Installing Dependencies

With your virtual environment activated, install the one required package:

```
pip install customtkinter
```

Wait for it to finish downloading and installing. You'll see a "Successfully installed" message when done.

> **Tip:** If a `requirements.txt` file exists in the project, you can instead run `pip install -r requirements.txt`. This project currently doesn't include one - see `PROJECT_REVIEW.md`.

---

## 9. The .env File

This particular app **does not use any API keys or environment variables** - it runs entirely offline with no external services. You do **not** need to create a `.env` file to run it.

> If a future version of this app adds features requiring secrets (like an API key), you would create a file named `.env` in the project root and store secrets there, e.g.:
> ```
> API_KEY=your_key_here
> ```
> This file should **never** be uploaded to GitHub.

---

## 10. Running the Application

With your virtual environment activated and dependencies installed, run:

```
python "ToDo_App.py"
```

(Use `python3` instead of `python` on macOS if needed.)

A window titled **"To-Do List"** should appear.

---

## 11. Testing the Application

Try the following to confirm everything works:

1. Type a task (e.g. "Buy groceries") into the input box and click **Add Task**. It should appear numbered in the list above.
2. Click **Add Task** with the input box empty - the placeholder text should change to "Please enter a task!" instead of adding a blank task.
3. Add 2-3 more tasks, then click **Delete Last** - the most recently added task should disappear.
4. Click **Clear All** - the list should empty out and show "No tasks yet."

If all four behaviors work as described, the app is functioning correctly.

---

## 12. Using Every Feature

| Feature | How to Use It |
|---|---|
| **Add a task** | Type text into the input field and click **Add Task** |
| **Delete last task** | Click **Delete Last** to remove the most recently added task |
| **Clear all tasks** | Click **Clear All** to empty the entire list |
| **Empty input warning** | Clicking **Add Task** with no text shows a placeholder warning instead of adding an empty entry |

---

## 13. Troubleshooting

**"python is not recognized as an internal or external command" (Windows)**
Python wasn't added to PATH during installation. Reinstall Python and check the "Add Python to PATH" box, or search "Add Python to environment variables" for manual steps.

**"command not found: python" (macOS)**
Use `python3` instead of `python` for all commands.

**PowerShell won't let me activate the virtual environment**
Run this once in PowerShell (as your normal user, not admin), then try activating again:
```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

**`ModuleNotFoundError: No module named 'customtkinter'`**
Your virtual environment either isn't activated, or the package wasn't installed. Re-run:
```
pip install customtkinter
```
while `(venv)` is visible in your terminal prompt.

**The app window doesn't appear / nothing happens**
Check the terminal for an error message - it usually explains exactly what went wrong. Common cause: running the script with a plain double-click instead of through the terminal or the provided startup scripts.

**macOS says "Start App (Mac).command cannot be opened because it is from an unidentified developer"**
Right-click the file, choose **Open**, then confirm **Open** in the dialog that appears. You only need to do this once.

---

## 14. FAQ

**Do I need internet access to run this app?**
No, except for the one-time step of downloading Python packages.

**Will my tasks be saved if I close the app?**
No. Tasks are stored only in memory while the app is running (see `PROJECT_REVIEW.md` for details).

**Can I run this on Linux?**
Yes - follow the manual setup steps in the README; there's no dedicated Linux launcher script, but the same terminal commands work.

**Do I need to reinstall dependencies every time I run the app?**
No. Once installed inside `venv`, they stay there. You only need to activate the virtual environment each session.

---

## 15. Common Mistakes

- Forgetting to activate the virtual environment before installing packages or running the app (you won't see `(venv)` in the terminal).
- Installing Python without checking "Add Python to PATH" on Windows.
- Trying to run `python file.py` from a different folder than the project directory.
- Editing files with a plain text editor like Notepad instead of VS Code, which can introduce formatting issues.

---

## 16. Security Recommendations

- Never commit your `venv` folder to GitHub - add it to a `.gitignore` file.
- If future versions add API keys or secrets, always store them in a `.env` file and never hard-code them into the Python source.
- Never share a `.env` file publicly or commit it to version control.
- Keep Python and installed packages up to date to receive security patches.

---

## 17. Next Learning Steps

Once comfortable running this app, consider learning:

- **Python basics**: variables, functions, loops ([official tutorial](https://docs.python.org/3/tutorial/))
- **File I/O**: how to save the task list to a file so it persists between runs
- **JSON**: a simple format for storing structured data like a task list
- **Git basics**: committing, branching, and pushing changes to GitHub
- **Packaging Python apps**: tools like `PyInstaller` to turn this script into a standalone `.exe` or `.app`
