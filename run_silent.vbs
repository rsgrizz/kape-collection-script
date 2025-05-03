Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "kape_collect_silent.bat" & Chr(34), 0
Set WshShell = Nothing