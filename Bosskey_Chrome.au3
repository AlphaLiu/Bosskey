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

	$ChromeList = WinList($title)
	for $i = 1 to $ChromeList[0][0]
		if IsVisible($ChromeList[$i][1]) == 0 Then
			$ShowOrHide = 1
		Else	
			$ShowOrHide = 0
			ExitLoop
		EndIf
	Next
	if $ShowOrHide == 1 Then
		for $i = 1 to $ChromeList[0][0]
			WinSetState($ChromeList[$i][1], "", @SW_SHOW)
		Next
		WinActivate($ChromeList[$ChromeList[0][0]][1])
	Else
		for $i = 1 to $ChromeList[0][0]
			WinSetState($ChromeList[$i][1], "", @SW_MINIMIZE)
			WinSetState($ChromeList[$i][1], "", @SW_HIDE)
		Next
	EndIf 

EndFunc

Func IsVisible($handle)
	$state = WinGetState($handle)	;Get states of window 
	;if BitAND($state, 16) Or Not(BitAND($state, 8)) Or Not(BitAND($state, 2)) Then	
	if BitAND($state, 16) Or Not(BitAND($state, 8)) Or Not(BitAND($state, 2)) Then	
	;Minimized, not activate, not visiabled Window should show in the foreground
		return 0
	Else
		return 1
	EndIf
EndFunc
