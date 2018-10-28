[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=32
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=b99a4437-1ce1-4c5a-8d16-e058886f7009
Description=正赛花瓣
Enable=1
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

Dim chooseArray(3)
chooseArray(2) = 3
chooseArray(1) = 2
chooseArray(0) = 1

Function waitToClick(picPattern,offx,offy)
	Dim intX
	Dim intY
	intX = - 1 
	intY = -1
	While intX < 0 or intY < 0
		TracePrint picPattern
		FindPic 0, 0, 1300, 870, picPattern, 0.7, intX, intY
		Delay 500
	Wend
	
	MoveTo intX+offx, intY+offy
	LeftClick 1
	Delay 20	
End Function

Sub enter
	call waitToClick ("C:\FGO\entry.bmp",-100,40)
	Delay 2333
	x = - 1 
	y = - 1 
	u = - 1 
	v = - 1 
	FindPic 290, 240, 450, 600,"C:\FGO\apple1.bmp",0.7,x,y	
	FindPic 290, 240, 450, 600,"C:\FGO\apple.bmp",0.7,u,v
	If x>0 Then 
		MoveTo x,y
		LeftClick 1
		Delay 1000
		Call waitToClick("C:\FGO\accept.bmp", 50, 30)
	ElseIf u > 0 Then
		MoveTo u, v
		LeftClick 1
		Delay 1000
		Call waitToClick("C:\FGO\accept.bmp", 50, 30)		
	End If
End Sub

Sub selectFriend//选择助战
	x = - 1 
	y = - 1
	While x<0 or y<0
		FindPic 0, 0, 1500, 800, "C:\FGO\km.bmp", 0.8, x, y
		If x < 0 or y < 0 Then 
			MoveTo 1250, 333//点击滚动条
			LeftClick 1
			//FindColor 
			Delay 200
			FindPic 0, 0, 1500, 800, "C:\FGO\km.bmp", 0.8, x1, y1
			If x1 < 0 or y1 < 0 Then 
				MoveTo 1250, 420
				LeftClick 1
				Delay 200
				FindPic 0, 0, 1500, 800, "C:\FGO\km.bmp", 0.8, x2, y2
				If x2 < 0 or y2 < 0 Then 
					MoveTo 1250, 222
					LeftClick 1
					TracePrint "找不到助战"
				Else 
					x = x2
					y = y2
				End If
			Else 
			x = x1
			y = y1
			End If
		End If		
	Wend
	MoveTo x, y
	LeftClick 1	
	Delay 1200
End Sub

Sub selectCard
	MoveTo 1140, 655
	LeftClick 1
	Delay 1800
End Sub

Function hogu(n)
	x = 400 + 250 * (n-1)
	MoveTo x, 250
	LeftClick 1
	Delay 500
End Function

Function card(n)
	x = 150 + 250 * (n - 1)
	MoveTo x, 555
	LeftClick 1
	Delay 500
End Function

Function skill(i, j)
	Delay 500
	x = 78 + 316 * (i - 1) + 92 * (j - 1)
	MoveTo x, 625
	LeftClick 1
	Delay 3000
End Function

Function skillTarget(n)
	x = 350 + (n - 1) * 300
	MoveTo x, 490
	LeftClick 1
	Delay 2800
End Function

Function masterSkill(n)
	MoveTo 1200, 363
	LeftClick 1
	Delay 300
	x = 913 + (n - 1) * 88
	MoveTo x, 357
	LeftClick 1
	Delay 3000
End Function

Sub exchangeServant(i, j)
	
	x1 = 150 + (i - 1) * 200
	x2 = 150 + (j - 1) * 200
	mx = - 1 
	my = - 1 
	While mx < 0 or my < 0
		MoveTo x1, 388
		LeftClick 1
		Delay 1200
		FindPic x1-100,140,x1+100,333,"C:\FGO\selected.bmp",0.6,mx,my		
	Wend
	mx = - 1 
	my = - 1 
	While mx < 0 or my < 0
		MoveTo x2, 388
		LeftClick 1
		Delay 1200
		FindPic x2-100,140,x2+100,333,"C:\FGO\selected.bmp",0.6,mx,my
	Wend
	
	MoveTo 650, 675
	LeftClick 1
	Delay 10000
End Sub

Sub km//放孔明3个技能
	Call skill(3, 1)
	Call skillTarget(2)
	Call skill(3, 2)
	Call skill(3, 3)
End Sub

Sub waitForStart
	Delay 3000
	mx = - 1 
	my = - 1 
	While mx < 0 or my < 0
		FindPic 950, 20, 1300, 200, "C:\FGO\start.bmp", 0.8, mx, my
		Delay 100
	Wend
	Delay 3000
End Sub

Function readCards()
	Dim cards(5)
	i = 0
	For 5
		mb = - 1 //brust
		ma = - 1 //art
		mq = - 1 //quick
		mw = - 1 //weak(奶光)
		mr = - 1 //resist(km)
		x = 69 + i * 256
		y = 486
		FindColorEx x,y,x+2,y+2,"1818A4",0,0.7,mb,yy
		FindColorEx x,y,x+2,y+2,"A34016",0,0.7,ma,yy
		FindColorEx x,y,x+2,y+2,"167628",0,0.7,mq,yy
		//FindPic x, 550, x + 150, 680, "C:\Program Files (x86)\按键精灵\fgo\b.bmp", 0.6, mb, y
		//FindPic x, 550, x + 150, 680, "C:\Program Files (x86)\按键精灵\fgo\a.bmp", 0.7, ma, y
		//FindPic x, 550, x + 150, 680, "C:\Program Files (x86)\按键精灵\fgo\q.bmp", 0.6, mq, y
		
		x1 = 185 + i * 256
		y1= 396
		FindColorEx x1, y1, x1 + 36, y1 + 36, "1A1A9D", 0, 0.7, mw, yy
		FindColorEx x1, y1, x1 + 36, y1 + 36,"C54201",0,0.7,mr,yy
		//FindPic x1, 405, x1 + 50, 461, "C:\Program Files (x86)\按键精灵\fgo\weak.bmp", 0.6, mw, y
		//FindPic x1, 405, x1 + 50, 461, "C:\Program Files (x86)\按键精灵\fgo\resist.bmp", 0.6, mr, y
		score=0
		If mw > 0 Then 
			score = 7
		ElseIf mr > 0 Then
			score = 1
		Else 
			score = 3
		End If
		If mb > 0 Then 
			score = score + 3
		ElseIf ma > 0 Then
			score = score + 1
		End If
		cards(i) = score
		i=i+1
	Next
	TracePrint "cards:"&" "&cards(0)&" "&cards(1)&" "&cards(2)&" "&cards(3)&" "&cards(4)
	i = 0
	chooseArray(0) = - 1 
	chooseArray(1) = - 1 
	chooseArray(2) = - 1
	For 3
		j = 0
		maxj = 0
		maxs = 0
		For 5
			If cards(j) >= maxs and j<>chooseArray(0) and j<>chooseArray(1) Then 
				maxj = j
				maxs = cards(j)
			End If			
			j=j+1
		Next
		chooseArray(i)=maxj
		i=i+1
	Next
	//readCards=Array(chooseArray(0),chooseArray(1),chooseArray(2))
End Function

Function choose()
	TracePrint chooseArray(0)
	TracePrint chooseArray(1)
	TracePrint chooseArray(2)
	i = 0
	For 3
		c = chooseArray(i)+1
		If  c> 5 Then 
			hogu (c - 5)
		Else 
			card(c)
		End If
		i = i + 1
		//Delay 400
	Next
End Function

Function target(i)
	Delay 100
	x = 100 + (i - 1) * 270
	y = 75
	MoveTo x, y
	LeftClick 1
	Delay 100
End Function

Rem StartL
TracePrint "start 正赛花瓣本"
Delay 1000
xx = - 1 
yy = - 1 
xxx = - 1 
yyy = - 1 
FindPic 1000, 0, 1300, 120, "C:\FGO\rdy.bmp", 0.8, xx, yy
FindPic 1000, 0, 1300, 120, "C:\FGO\friend.bmp", 0.8, xxx, yyy
If xx > 0 Then 
	TracePrint "点击副本..."
	enter 
	Goto StartL
ElseIf xxx > 0 Then
	TracePrint "选择助战..."
	selectFriend 
Else 
	TracePrint "不在副本选择或助战选择界面!"
	Goto StartL
End if
Delay 1500

MoveTo 1200, 725//开始任务
LeftClick 1
waitForStart //第一面

Call skill(1, 3)

selectCard

Call hogu(1)
call card (1)
Call card(2)

Delay 12000
LeftClick 1


waitForStart //第二面

Call target(2)
km //孔明
Call masterSkill(3)
Call exchangeServant(3, 4)
km //第二个孔明

Call skill(1, 3)//杀师匠
call skill(2,2)//清姬降防
selectCard
Call hogu(1)
Call card(1)
Call card(2)


waitForStart//第三面

Call skill(2, 3)
Call masterSkill(1)

selectCard
Call hogu(2)
Call card(1)
Call card(2)

Rem WaitL
While True
	Delay 200
	mx = - 1 
	my = - 1
	FindPic 400, 200, 1000, 500, "C:\FGO\end.bmp", 0.7, mx, my
	If mx > 0 and my > 0 Then 
		Goto EndL
	End If
	mx = - 1 
	my = - 1
	FindPic 600, 0, 1200, 500, "C:\FGO\start.bmp", 0.8, mx, my
	If mx > 0 and my > 0 Then 
		Goto NextRoundL
	End If
	MoveTo 650, 400
	LeftClick 1
	Delay 1000
	FindPic 600, 100, 1300, 800, "C:\FGO\entry.bmp", 0.7, mx, my
		If mx > 0 Then 
			Goto StartL
		End If
	TracePrint "wait.."
Wend

Rem NextRoundL
TracePrint "next round"
Delay 2000
selectCard

Call readCards()
call choose()
Goto WaitL

Rem EndL
TracePrint "end"
LeftClick 1
mx = - 1 
my = - 1 
While mx < 0 or my < 0
	i=0
	For 20
		i = i + 1
		Delay 3000		
		FindPic 1000, 20, 1300, 120, "C:\FGO\rdy.bmp", 0.7, mx, my
		If mx > 0 Then 
			Goto StartL
		End If
		FindPic 600, 100, 1300, 800, "C:\FGO\entry.bmp", 0.7, mx, my
		If mx > 0 Then 
			Goto StartL
		End If
		MoveTo 469, 618//不申请
		LeftClick 1
		Delay 1000
		
		TracePrint "wait entry: " & i
		FindPic 1000, 20, 1300, 120, "C:\FGO\rdy.bmp", 0.7, mx, my
		If mx > 0 Then 
			Goto StartL
		End If
		FindPic 600, 100, 1300, 800, "C:\FGO\entry.bmp", 0.7, mx, my
		If mx > 0 Then 
			Goto StartL
		End If
		MoveTo 1187, 713//下一步 有可能点到菜单
		LeftClick 1
		Delay 100
		LeftClick 1//关闭菜单
		Delay 1000
		
	Next
	TracePrint "max i reached:"
	MoveTo 50, 50//退出礼装页
	LeftClick 1
Wend
Goto StartL

Rem QuitL