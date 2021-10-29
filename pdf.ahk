#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Lib\BTT.ahk
#SingleInstance Force
SetBatchLines, -1
; 8-tools
; Ctrl 1 橡皮擦
global T_last:=2 ; 当前使用的工具
global T_cur:=1  ; 目前使用的工具
global pathArray:={1 : ".\pdf_image\eraser.bmp", 2 : ".\pdf_image\red_pen.bmp", 3 : ".\pdf_image\blue_pen.bmp", 4 : ".\pdf_image\underline.bmp", 5 : ".\pdf_image\highlight.bmp", 6 : ".\pdf_image\yellow_highlighter.bmp", 7 : ".\pdf_image\green_highlighter.bmp", 8: ".\pdf_image\move.bmp", 9:".\pdf_image\select.bmp"}
global nameArray:=["橡皮", "红笔", "蓝笔", "下划线", "高亮", "荧光笔-黄", "荧光笔-绿", "移动", "文本选择"]



ToolTip(Text)
{
	
	
	; fadein
	for k, v in [15,35,55,75,95,115,135,155,175,195,215,235,255]
	{
		btt(Text,A_ScreenWidth/2,A_ScreenHeight/2+300,,"Style4",{Transparent:v})
		Sleep, 30
	}

	;Sleep, 100

	; fadeout
	for k, v in [240,220,200,180,160,140,120,100,80,60,40,20,0]
	{
		btt(Text,A_ScreenWidth/2,A_ScreenHeight/2+300,,"Style4",{Transparent:v})
		Sleep, 30
	}

	return
}
SelectTool(tool_id)
{
	
    target_img:=pathArray[tool_id]
	gui,add,picture,hwnd_mypic,%target_img%
	controlgetpos,,,_img_w,_img_h,,ahk_id %_mypic%
	CoordMode Pixel
    ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight, %target_img%
	CoordMode Mouse
    pos_x:=OutputVarX+_img_w/2
    pos_y:=OutputVarY+_img_h/2
	if(ErrorLevel=0)
	{
		CoordMode, Mouse, Screen
		Click %pos_x%, %pos_y%, 1
		;Click %NowX%, %NowX%, 0
		ToolTip(nameArray[tool_id])

	}else{
		ToolTip(Error)
		;MsgBox, Error, %ErrorLevel%
	}
	return
}

^F5::
{
	T_tmp:=T_cur
	T_cur:=T_last
	T_last:=T_tmp
	SelectTool(T_cur)
	return
}

; 工具
^1:: 
{
	tool_id:=1
    SelectTool(tool_id)
	KeyWait, Ctrl, %tool_id%
	SelectTool(T_cur)
	return
}

^2:: 
{
	tool_id:=2
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^3:: 
{
	tool_id:=3
    if(tool_id=T_cur){
		return
	}
	SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^4:: 
{
	tool_id:=4
    if(tool_id=T_cur){
		return
	}
	SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^5:: 
{
	tool_id:=5
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^6:: 
{
	tool_id:=6
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^7:: 
{
	tool_id:=7
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^8:: 
{
	tool_id:=8
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^9:: 
{
	tool_id:=9
	if(tool_id=T_cur){
		return
	}
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}