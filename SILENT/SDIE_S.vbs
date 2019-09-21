Set WshShell = CreateObject("WScript.Shell" ) 
WshShell.CurrentDirectory = "src(do not delete, even if empty)"
WshShell.Run chr(34) & "dzone_a5_a12x_silent_.bat" & Chr(34), 0 
Set WshShell = Nothing 