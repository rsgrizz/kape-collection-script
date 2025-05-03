KAPE Live Collection Scripts (Visual & Silent)

Author: Randy GrizzelliEmail: grizzellir@gmail.comGitHub: rsgrizzVersion: 0.1Date: 2025-05-03License: MIT

🛠️ Overview

This project contains two batch scripts and a VBScript launcher for performing forensic data collection using KAPE on live Windows systems.

Visual script: Displays progress and logs in a command prompt window.

Silent script: Runs in the background without user interaction.

Targets used:

!BasicCollection

!SANS_Triage

All output is saved to a timestamped folder on the drive the script is launched from.

📁 Repository Contents

File

Description

kape_collect.bat

Visual version of the script (shows progress)

kape_collect_silent.bat

Silent version of the script (no interface)

run_silent.vbs

Launches the silent script invisibly

README.md

Project documentation

🔧 Requirements

Windows host with Administrator privileges (scripts auto-elevate)

KAPE files extracted in a KAPE folder with kape.exe at the root

USB drive or local folder with write access

🚀 Launch Instructions

🔹 Visual Script (shows command prompt window)

Copy the following to your USB root:

kape_collect.bat

KAPE\ folder (with kape.exe, Targets, Modules, etc.)

Example structure:

E:\
├── kape_collect.bat
├── KAPE\
│   └── kape.exe
└── ... other KAPE files ...

Insert USB into target machine

Double-click kape_collect.bat

Script will self-elevate, run both KAPE targets, and display progress

When finished, it will show a completion message and wait for a keypress

Output location:

<USB>:\KAPE_Collected\<HOSTNAME>_<YYYY-MM-DD>\

🔹 Silent Script (runs in background, no UI)

Copy the following to your USB root:

kape_collect_silent.bat

run_silent.vbs

KAPE\ folder

Insert USB into target machine

Double-click run_silent.vbs

Nothing will appear onscreen; the collection runs silently

Wait a few minutes, then browse to the KAPE_Collected folder to confirm results

Output location:

<USB>:\KAPE_Collected\<HOSTNAME>_<YYYY-MM-DD>\

📄 Example Output

KAPE_Collected\
└── DESKTOP-123456_2025-05-03\
    ├── KAPE_RunLog_Basic.txt
    ├── KAPE_RunLog_SANS.txt
    ├── KAPE_MasterLog.txt
    └── [Collected Artifacts]

🔐 Legal Disclaimer

Use this toolkit only on systems you are authorized to examine. Unauthorized use may violate laws or organizational policies.

📄 License

This project is licensed under the MIT License. See LICENSE for details.