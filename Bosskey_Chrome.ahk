;;;;Bosskey for Chrome AutoHotKey version 

SetTitleMatchMode, 2	;allow window title match a part of string.
DetectHiddenWindows On	;allow to detect hidden windows
#SingleInstance ignore	;don't allow to run again if it already running.

F1::	;F1 hotkey action
HideOrShowWindow()
return

HideOrShowWindow()
{
	strWinTitle = Google Chrome		;Chrome Title
	ifWinExist %strWinTitle%
	{
		IfWinNotActive
		{
			WinShow
			WinActivate 
		}
		else
		{
			Send, !{esc}			; This way sends the active window (which is
									; about to be hidden) to the back of the stack.
			WinHide
		}		
	}
	else
	{
		msgbox There is no %strWinTitle% running. 
	}
}
