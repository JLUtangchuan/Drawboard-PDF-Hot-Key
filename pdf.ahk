#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode Pixel  ; 将下面的坐标解释为相对于屏幕而不是活动窗口.
; 8-tools
; Ctrl 1 橡皮擦
global T_last:=1 ; 当前使用的工具
global T_cur:=1  ; 目前使用的工具
global pathArray:={1 : ".\pdf_image\eraser.png", 2 : ".\pdf_image\red_pen.png", 3 : ".\pdf_image\blue_pen.png", 4 : ".\pdf_image\underline.png", 5 : ".\pdf_image\highlight.png", 6 : ".\pdf_image\yellow_highlighter.png", 7 : ".\pdf_image\green_highlighter.png", 8: ".\pdf_image\move.png", 9:".\pdf_image\select.png"}


SelectTool(tool_id)
{

    target_img:=pathArray[tool_id]
    ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight, %target_img%
    pos_x:=OutputVarX+28
    pos_y:=OutputVarY+28
    MouseClick, left, %pos_x%, %pos_y%, 1, 0
	;MsgBox, %pos_x%, %pos_y%
    
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
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^3:: 
{
	tool_id:=3
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^4:: 
{
	tool_id:=4
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^5:: 
{
	tool_id:=5
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^6:: 
{
	tool_id:=6
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}
^7:: 
{
	tool_id:=7
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^8:: 
{
	tool_id:=8
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}

^9:: 
{
	tool_id:=9
    SelectTool(tool_id)
	T_last:=T_cur
	T_cur:=tool_id
	return
}