import customtkinter as ctk

# App appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Main window
app = ctk.CTk()
app.title("To-Do List")
app.geometry("420x580")
app.resizable(False, False)

# Task storage list
tasks = []

# Functions
def add_task():
    task_text = task_entry.get().strip()
    if task_text:
        tasks.append(task_text)
        task_entry.delete(0, "end")
        update_listbox()
    else:
        # Brief visual error handling if trying to add empty string
        task_entry.configure(placeholder_text="Please enter a task!")

def delete_task():
    # Deletes the last task added (or you can clear specific ones)
    if tasks:
        tasks.pop()
        update_listbox()

def clear_all():
    global tasks
    tasks = []
    update_listbox()

def update_listbox():
    # Clear the old text inside the textbox display
    task_display.configure(state="normal")
    task_display.delete("1.0", "end")
    
    # Repopulate tasks with elegant numbering
    if not tasks:
        task_display.insert("1.0", " No tasks yet. Add one below! 🚀\n")
    else:
        for idx, task in enumerate(tasks, 1):
            task_display.insert("end", f" {idx}. {task}\n")
            
    task_display.configure(state="disabled")


# Top Title Header
title_label = ctk.CTkLabel(
    app,
    text="My Tasks",
    height=60,
    font=("Arial", 28, "bold"),
)
title_label.pack(fill="x", padx=20, pady=(20, 5))

# Main Task Display Box (Matches your calculator display box structure)
task_display = ctk.CTkTextbox(
    app,
    height=260,
    font=("Arial", 16),
    corner_radius=12,
    border_width=2,
    border_color="#1f6aa5"
)
task_display.pack(fill="both", padx=20, pady=10)

# Input Box Area
task_entry = ctk.CTkEntry(
    app,
    placeholder_text="Type a new task here...",
    font=("Arial", 16),
    height=50,
    corner_radius=12
)
task_entry.pack(fill="x", padx=20, pady=10)


# Button Grid Layout Frame (Mirroring your calculator UI logic)
frame = ctk.CTkFrame(app)
frame.pack(expand=True, fill="both", padx=20, pady=(5, 20))

# Grid Sizing Configurations
frame.rowconfigure(0, weight=1)
frame.columnconfigure(0, weight=2)
frame.columnconfigure(1, weight=1)
frame.columnconfigure(2, weight=1)

# Control Buttons
btn_add = ctk.CTkButton(
    frame,
    text="Add Task",
    font=("Arial", 16, "bold"),
    height=60,
    corner_radius=12,
    command=add_task
)
btn_add.grid(row=0, column=0, padx=5, pady=5, sticky="nsew")

btn_delete = ctk.CTkButton(
    frame,
    text="Delete Last",
    font=("Arial", 14),
    height=60,
    corner_radius=12,
    fg_color="#D32F2F",
    hover_color="#9A1F1F",
    command=delete_task
)
btn_delete.grid(row=0, column=1, padx=5, pady=5, sticky="nsew")

btn_clear = ctk.CTkButton(
    frame,
    text="Clear All",
    font=("Arial", 14),
    height=60,
    corner_radius=12,
    fg_color="#555555",
    hover_color="#333333",
    command=clear_all
)
btn_clear.grid(row=0, column=2, padx=5, pady=5, sticky="nsew")

# Initialize display context setup
update_listbox()

# Start app
app.mainloop()
