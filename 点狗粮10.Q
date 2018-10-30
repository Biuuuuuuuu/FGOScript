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
MacroID=90d32a43-32ba-4ee6-9eee-03876b456994
Description=µã¹·Á¸
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
i = 0
For 5
	MoveTo 123 + i * 186, 300
	LeftClick 1
	i = i + 1
	Delay 20
Next
i=0
For 5
	MoveTo 123 + i * 186, 500
	LeftClick 1
	i = i + 1
	Delay 20
Next
