#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode Pixel  ; 将下面的坐标解释为相对于屏幕而不是活动窗口.
; 8-tools
; Ctrl 1 橡皮擦
global T_last:=1 ; 当前使用的工具
global T_cur:=1  ; 目前使用的工具
global pathArray:={1 : ".\pdf_image\eraser.png", 2 : ".\pdf_image\red_pen.png", 3 : ".\pdf_image\blue_pen.png", 4 : ".\pdf_image\underline.png", 5 : ".\pdf_image\highlight.png", 6 : ".\pdf_image\yellow_highlighter.png", 7 : ".\pdf_image\green_highlighter.png", 8: ".\pdf_image\move.png", 9:".\pdf_image\select.png"}
global nameArray:=["橡皮", "红笔", "蓝笔", "下划线", "高亮", "荧光笔-黄", "荧光笔-绿", "移动", "文本选择"]

MsgBoxTimed(msg, seconds, complete="") {
    static init = false, _seconds, _complete
    global Msg92, Seconds92
    if (!init)
    {
        init := true
        CustomColor = 008084  ; 可以为任意 RGB 颜色 (在下面会被设置为透明).
        Gui, 92: +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow 避免显示任务栏按钮和 alt-tab 菜单项.
        Gui, 92: Color, %CustomColor%
        Gui, 92:Font, cRed
        Gui, 92:Font, s24, Microsoft YaHei Mono 
		Gui, 92:Add, Text, vMsg92 Center w240, %msg%
        WinSet, TransColor, %CustomColor%
    }

    _seconds := seconds
    _complete := complete
	GuiControl, 92: , Msg92, %msg%
    Gui, 92:Show, w300 h70 y1000

    Update92:
    _seconds -= 1
    if (_seconds > 0) {
        SetTimer, Update92, -1000
    }
    else {
        Gui, 92:Hide
        if (_complete)
            SetTimer, %_complete%, -1
    }
    return
} 

SelectTool(tool_id)
{
	
    target_img:=pathArray[tool_id]
    ImageSearch, OutputVarX, OutputVarY, 0, 0, A_ScreenWidth, A_ScreenHeight, %target_img%
    pos_x:=OutputVarX+28
    pos_y:=OutputVarY+28
    MouseClick, left, %pos_x%, %pos_y%, 1, 0
	;MsgBox, %pos_x%, %pos_y%
    MsgBoxTimed(nameArray[tool_id], 2)
	;MsgBox, % nameArray[tool_id]
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