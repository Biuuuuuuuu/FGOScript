[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=fd023e01-13da-496e-9521-09f90287f1d5
Description=µã¹·Á¸7x4
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]

j = 0
dx = 133
dy = 142
For 4//row count
	i=0
	For 5//column count
		MoveTo 141+i*dx,273+j*dy
		LeftClick 1
		Delay 24
		i=i+1	
	Next
	j=j+1
Next