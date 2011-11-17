; Press F1 show or hide Chrome browser
; It is simple
Opt("WinTitleMatchMode", 2) 		;Title match mode change to mode 2, 
									;that means if title contains the string, 
									;it would return match

HotKeySet("{F1}", "HideOrShow")  	;Bosskey is F1

;;;; main contents;;;;
$version = "BossKey for Chrome,v0.00.01"  	
If WinExists($version)  Then Exit	;Only allow one process
AutoItWinSetTitle($version)

While 1
    Sleep(100)
WEnd
;;;;;;;;

Func HideOrShow()
	$title = "Google Chrome"		;Chrome title
	$state = WinGetState($title)	;Get states of Chrome
	;MsgBox(0, "", $state)
	if BitAND($state, 16) Or Not(BitAND($state, 8)) Or Not(BitAND($state, 2)) Then	
		;Minimized, not activate, not visiabled Window should show in the foreground
		WinSetState($title, "", @SW_SHOW);
		WinActivate($title)
	Else	
		WinSetState($title, "", @SW_HIDE);\
	EndIf
EndFunc
