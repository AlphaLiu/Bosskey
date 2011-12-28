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

	WinGet arrWinList, List, %strWinTitle%
	if %arrWinList% != 0
	{
		bShowOrHide = 0
		Loop, %arrWinList%
		{
			curWin := arrWinList%A_Index%

			IfWinNotActive ahk_id%curWin%
			{
				bShowOrHide = 1
			}
			else
			{
				bShowOrHide = 0
				break
			}		
		}
		if bShowOrHide = 1
		{
			Loop, %arrWinList%
			{
				curWin := arrWinList%A_Index%
				WinShow ahk_id%curWin%
			}
			WinActivate ahk_id%arrWinList1% 
		}
		else
		{
			Loop, %arrWinList%
			{
				curWin := arrWinList%A_Index%
				WinMinimize ahk_id%curWin%
				WinHide ahk_id%curWin%
			}
		}
	}
	else
	{
		msgbox There is no %strWinTitle% running. 
	}
}
