# KAPE Live Collection Scripts (Visual & Silent)

**Author:** Randy Grizzelli  
**Email:** grizzellir@gmail.com  
**GitHub:** [rsgrizz](https://github.com/rsgrizz)  
**Version:** 0.1  
**DatUSB** 2025-05-03  
**LicensUSB** MIT

---

## 🛠️ Overview

This project contains two batch scripts and a VBScript launcher for performing forensic data collection using [KAPE](https://www.kroll.com/en/kape) on live Windows systems.

- **Visual script**: Displays progress and logs in a command prompt window  
- **Silent script**: Runs in the background without user interaction  

**KAPE Targets used:**
- `!BasicCollection`
- `!SANS_Triage`

All output is saved to a timestamped folder on the same drive the script is launched from.

---

## 📁 Repository Contents

| File                     | Description                                     |
|--------------------------|-------------------------------------------------|
| `kape_collect.bat`       | Visual version of the script (shows progress)   |
| `kape_collect_silent.bat`| Silent version of the script (no interface)     |
| `run_silent.vbs`         | Launches the silent script invisibly            |
| `README.md`              | Project documentation                           |

---

## 🔧 Requirements

- Windows host with **Administrator privileges** (scripts self-elevate)
- KAPE files extracted to a `KAPE\` folder (with `kape.exe`, Targets, Modules)
- USB drive or writable local directory

---

## 🚀 Launch Instructions

### 🔹 Visual Script (command window visible)

1. Copy the following to your USB root:
   - `kape_collect.bat`
   - `KAPE\` folder with `kape.exe`, Targets, and Modules

```

USB:
├── kape\_collect.bat
└── KAPE
├── kape.exe
└── \[other KAPE files]

```

2. Insert USB into the target machine  
3. Double-click `kape_collect.bat`  
4. The script will:
- Self-elevate to admin
- Run both KAPE targets
- Display status messages
- Prompt at the end

**Output location:**
```

USB:\KAPE\_Collected\<HOSTNAME>\_<YYYY-MM-DD>\\

```

---

### 🔹 Silent Script (background execution, no output)

1. Copy the following to your USB root:
   - `kape_collect_silent.bat`
   - `run_silent.vbs`
   - `KAPE\` folder

```

USB
├── kape\_collect\_silent.bat
├── run\_silent.vbs
└── KAPE
├── kape.exe
└── \[other KAPE files]

```

2. Insert USB into the target machine  
3. Double-click `run_silent.vbs`  
4. Script will run silently in the background  
5. After a few minutes, check the output folder

**Output location:**
```

USB\KAPE\_Collected\<HOSTNAME>\_<YYYY-MM-DD>\\

```

---

## 📄 Example Output

```

KAPE\_Collected
└── DESKTOP-123456\_2025-05-03
├── KAPE\_RunLog\_Basic.txt
├── KAPE\_RunLog\_SANS.txt
├── KAPE\_MasterLog.txt
└── \[Collected Artifacts]

```

---

## 🔐 Legal Disclaimer

Use this toolkit only on systems you are **authorized** to examine. Unauthorized use may violate local, federal, or organizational policies.

---

## 📄 License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
