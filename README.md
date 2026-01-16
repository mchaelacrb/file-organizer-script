# Downloads Auto Organizer (Windows Batch Script)

This project is a Windows batch file that automatically organizes files and folders in the **Downloads** directory by moving older items into designated folders.

## 📌 Description
The batch script helps keep the Downloads folder clean by:
- Moving files and folders older than a specified number of days to an **Archived** folder
- Moving even older files and folders from **Archived** to **ToBeDeleted**
- Automatically creating folders if they do not exist
- Preventing important folders from being moved

No files are deleted automatically, making it safe to use.

## 🛠 Technologies Used
- Windows Batch Script (.bat)
- Command Prompt
- Windows built-in commands (`forfiles`, `move`, `mkdir`)

## 📂 Folder Structure
Downloads
│
├── Archived
│
└── ToBeDeleted
## ⚙️ How It Works
1. The script checks if `Archived` and `ToBeDeleted` folders exist
2. Files older than **7 days** are moved from `Downloads` to `Archived`
3. Folders older than **7 days** are moved from `Downloads` to `Archived`
4. Files older than **3 days** are moved from `Archived` to `ToBeDeleted`
5. Folders older than **3 days** are moved from `Archived` to `ToBeDeleted`

## ▶️ How to Run

1. Open **Notepad**
2. Paste the batch script code
3. Save the file as:
Downloads-Cleanup.bat
4. Double-click the file to run it  
   *(or right-click → Run as administrator if needed)*

## 🔒 Safety Notes
- The script does **not delete files**
- Users can manually review files inside `ToBeDeleted`
- The script avoids moving its own folders to prevent errors

## 📈 Possible Improvements
- Automatic deletion of files in `ToBeDeleted`
- Logging moved files to a text file
- Running the script automatically using Task Scheduler
- Customizable day values
