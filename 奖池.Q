[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=122
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=fd58af15-85ba-46ad-9c87-91af80a38338
Description=奖池
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
iter = 10//抽取池数

Sub clk
	Delay 5
	MoveTo 430, 455
	LeftClick 1
	Delay 5
End Sub

For iter
	While true
		For 50
			clk 
		Next
		x = - 1 
		y = - 1 
		FindPic 530, 210, 1280, 310, "E:\FGO\poolend.bmp", 0.8, x, y
		If x > 0 Then 
			MoveTo x + 100, y + 20//重置礼物
			LeftClick 1
			Delay 1500
			MoveTo 840, 591
			LeftClick 1//执行
			Delay 2000
			MoveTo 640, 591
			LeftClick 1//关闭
			Goto NextL
		End If
	Wend
	Rem NextL
Next
