# To-Do List App

A simple, elegant desktop to-do list application built with Python and [CustomTkinter](https://github.com/TomSchimansky/CustomTkinter). Add tasks, remove the most recent one, or clear your whole list - all through a clean, dark-themed GUI.

![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![License](https://img.shields.io/badge/license-unspecified-lightgrey)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

## Features

- ✅ Add new tasks through a simple text entry field
- ✅ View all tasks in a numbered, scrollable display
- ✅ Delete the most recently added task
- ✅ Clear the entire task list in one click
- ✅ Dark mode UI with a modern, rounded aesthetic

## Screenshot

> _Add a screenshot of the running app here (e.g. `docs/screenshot.png`) so visitors can see the UI before running it._

## Requirements

- Python 3.9 or later
- [`customtkinter`](https://pypi.org/project/customtkinter/)

If you're new to Python, virtual environments, or the terminal, see **[INSTRUCTION.md](INSTRUCTION.md)** for a complete beginner-friendly walkthrough.

## Quick Start

### Windows

Double-click **`Start App.bat`**. It will set up everything automatically and launch the app.

### macOS

Double-click **`Start App (Mac).command`**. It will set up everything automatically and launch the app.

### Manual Setup (any OS)

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd <your-repo-folder>

# 2. Create a virtual environment
python -m venv venv

# 3. Activate it
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# 4. Install dependencies
pip install customtkinter

# 5. Run the app
python "ToDo_App.py"
```

## Usage

1. Type a task into the input field labeled **"Type a new task here..."**
2. Click **Add Task** (or press Enter after focusing the button) to add it to your list
3. Click **Delete Last** to remove the most recently added task
4. Click **Clear All** to wipe the entire list

> **Note:** Tasks are stored in memory only. Closing the app will erase your task list, since there is currently no file or database persistence.

## Project Structure

```
.
├── ToDo_App.py # Main application file
├── README.md # This file
├── INSTRUCTION.md # Beginner setup & usage guide
├── Start App.bat # Windows launcher script
└── Start App (Mac).command # macOS launcher script
```

## Known Limitations

- No persistent storage - tasks reset every time the app is closed (see `PROJECT_REVIEW.md` for details and suggestions)
- No way to delete or edit a *specific* task - only the last one added
- No task completion/checkbox tracking

## Contributing

Issues and pull requests are welcome. Please open an issue first to discuss any significant changes.

## License

No license has been specified for this project yet. See `PROJECT_REVIEW.md` for why adding one is recommended before publishing publicly.
