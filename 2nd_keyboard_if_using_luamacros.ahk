#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; HELLO, poeple who want info about making a second keyboard, using luamacros!

; Here's my LTT video about how I use the 2nd keyboard with Luamacros: https://www.youtube.com/watch?v=Arn8ExQ2Gjg

; And Tom's video, which unfortunately does not have info on how to actually DO it: https://youtu.be/lIFE7h3m40U?t=16m9s

; If you have never used AutoHotKey, you must take this tutorial before proceeding!
; https://autohotkey.com/docs/Tutorial.htm

; So you will need luamacros, of course.
; Luamacros: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
; AutohotKey: https://autohotkey.com/

; However, I no longer use luamacros, because I believe interecept.exe is even better! My current code is available in "ALL_MULTIPLE_KEYBOARD_ASSIGNMENTS.ahk"

; Lots of other explanatory videos other AHK scripts can be found on my youtube channel! https://www.youtube.com/user/TaranVH/videos 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;-----------------------------普通键位设置--------------------------------------------
;Notes: #==win !==Alt 2015-05-20  ^==Ctr  +==shift

;========================================================================
; The tilde prefix (~) prevents AHK from blocking the 'Ctrl' key-down/up events. 

^i::send, {Escape}
^j::send, {Enter}
^!h::run C:\AHK\2nd-keyboard\LUAMACROS\2nd_keyboard_if_using_luamacros.ahk
^!s::run C:\Users\johhuang1\Documents\sublime\sublime_text.exe
^+r::run cmd
^h::send, {Backspace}
Insert::
send, {AppsKey}
if (Bctrldown)
msgbox,yes
return

;derection
<!j::
   Send, {Down}
Return

<!l::
   Send, {Right}
Return

<!h::
   Send, {Left}
Return

<!k::
   Send, {Up}
Return

+!^l::
{
run taskkill /IM LuaMacros.exe
run C:\Users\johhuang1\Downloads\lua\LuaMacros.exe C:\AHK\2nd-keyboard\LUAMACROS\SECOND_KEYBOARD_script_for_LUA_MACROS.lua
}
;=========================================================================

^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return

;replace CapsLock to LeftEnter; CapsLock = Alt CapsLock
;$CapsLock::Enter


$Ctrl::
    if (A_PriorHotkey = A_ThisHotkey) && (A_TimeSincePriorHotkey < 400)
        Send, {Esc}
    Else
        Send, {Ctrl}
return


::johnmail::john.huang@starcomww.com
::kenmail::ken.li@starcomww.com
::tel::
clipboard=+862028868327
send ^v

;-------------------------------------------------------------------------
;---------Fuction-------------
Activate(t)
{
  IfWinActive,%t%
  {
    WinMinimize
    return
  }
  SetTitleMatchMode 2    
  DetectHiddenWindows,on
  IfWinExist,%t%
  {
    WinShow
    WinActivate           
    return 1
  }
  return 0
}
ActivateAndOpen(t,p)
{
  if Activate(t)==0
  {
    Run %p%
    WinActivate
    return
  }
}

;-------------2ND KEYBOARD USING LUAMACROS-----------------

#IfWinActive ahk_exe Adobe Premiere Pro.exe ;---EVERYTHING BELOW THIS LINE WILL ONLY WORK INSIDE PREMIERE PRO. But you can change this to anything you like. You can use Window Spy to determine the ahk_exe of any program, so that your macros will only work when and where you want them to.

;There is no code here. T'was just an example.

#IfWinActive ;---- This will allow for everything below this line to work in ANY application.

F24::
FileRead, key, keypressed.txt

tippy(key) ;<--- this function will just launch a quick tooltip that shows you what key you pressed. OPTIONAL.
;msgbox, %key%
If (key = "o")
preset("flip horizontal") 
else if(key = "p")
{
    clipboard = C:\Users\johhuang1\Python36-32\
    send, +{Insert}
}
;preset("flip vertical")
else if(key = "i")
	{
	preset("multiply")
	;note that if you want to have multiple lines, you must use { } thingies.
	}
; key: KEY_RESERVED   value: 0000
else if(key = "0000")
preset("KEY_RESERVED  ")
; key: KEY_ESC    value: 0001
else if(key = "0001")
preset("KEY_ESC   ")
; key: KEY_1    value: 0002
else if(key = "0002")
preset("KEY_1   ")
; key: KEY_2    value: 0003
else if(key = "0003")
preset("KEY_2   ")
; key: KEY_3    value: 0004
else if(key = "0004")
preset("KEY_3   ")
; key: KEY_4    value: 0005
else if(key = "0005")
preset("KEY_4   ")
; key: KEY_5    value: 0006
else if(key = "0006")
preset("KEY_5   ")
; key: KEY_6    value: 0007
else if(key = "0007")
preset("KEY_6   ")
; key: KEY_7    value: 0008
else if(key = "0008")
preset("KEY_7   ")
; key: KEY_8    value: 0009
else if(key = "0009")
preset("KEY_8   ")
; key: KEY_9    value: 0010
else if(key = "0010")
preset("KEY_9   ")
; key: KEY_0    value: 0011
else if(key = "0011")
preset("KEY_0   ")
; key: KEY_MINUS   value: 0012
else if(key = "0012")
preset("KEY_MINUS  ")
; key: KEY_EQUAL   value: 0013
else if(key = "0013")
preset("KEY_EQUAL  ")
; key: KEY_BACKSPACE   value: 0014
else if(key = "0014")
preset("KEY_BACKSPACE  ")
; key: KEY_TAB    value: 0015
else if(key = "0015")
preset("KEY_TAB   ")
; key: KEY_Q    value: 0016
else if(key = "0016")
preset("KEY_Q   ")
; key: KEY_W    value: 0017
else if(key = "0017")
preset("KEY_W   ")
; key: KEY_E    value: 0018
else if(key = "0018")
preset("KEY_E   ")
; key: KEY_R    value: 0019
else if(key = "0019")
preset("KEY_R   ")
; key: KEY_T    value: 0020
else if(key = "0020")
preset("KEY_T   ")
; key: KEY_Y    value: 0021
else if(key = "0021")
preset("KEY_Y   ")
; key: KEY_U    value: 0022
else if(key = "0022")
preset("KEY_U   ")
; key: KEY_I    value: 0023
else if(key = "0023")
preset("KEY_I   ")
; key: KEY_O    value: 0024
else if(key = "0024")
preset("KEY_O   ")
; key: KEY_P    value: 0025
else if(key = "0025")
preset("KEY_P   ")
; key: KEY_LEFTBRACE   value: 0026
else if(key = "0026")
preset("KEY_LEFTBRACE  ")
; key: KEY_RIGHTBRACE   value: 0027
else if(key = "0027")
preset("KEY_RIGHTBRACE  ")
; key: KEY_ENTER   value: 0028
else if(key = "0028")
send, {Enter}
; key: KEY_LEFTCTRL   value: 0029
else if(key = "0029")
preset("KEY_LEFTCTRL  ")
; key: KEY_A    value: 0030
else if(key = "0030")
preset("KEY_A   ")
; key: KEY_S    value: 0031
else if(key = "0031")
preset("KEY_S   ")
; key: KEY_D    value: 0032
else if(key = "0032")
preset("KEY_D   ")
; key: KEY_F    value: 0033
else if(key = "0033")
preset("KEY_F   ")
; key: KEY_G    value: 0034
else if(key = "0034")
preset("KEY_G   ")
; key: KEY_H    value: 0035
else if(key = "0035")
preset("KEY_H   ")
; key: KEY_J    value: 0036
else if(key = "0036")
preset("KEY_J   ")
; key: KEY_K    value: 0037
else if(key = "0037")
preset("KEY_K   ")
; key: KEY_L    value: 0038
else if(key = "0038")
preset("KEY_L   ")
; key: KEY_SEMICOLON   value: 0039
else if(key = "0039")
preset("KEY_SEMICOLON  ")
; key: KEY_APOSTROPHE   value: 0040
else if(key = "0040")
preset("KEY_APOSTROPHE  ")
; key: KEY_GRAVE   value: 0041
else if(key = "0041")
preset("KEY_GRAVE  ")
; key: KEY_LEFTSHIFT   value: 0042
else if(key = "0042")
preset("KEY_LEFTSHIFT  ")
; key: KEY_BACKSLASH   value: 0043
else if(key = "0043")
preset("KEY_BACKSLASH  ")
; key: KEY_Z    value: 0044
else if(key = "0044")
preset("KEY_Z   ")
; key: KEY_X    value: 0045
else if(key = "0045")
preset("KEY_X   ")
; key: KEY_C    value: 0046
else if(key = "0046")
preset("KEY_C   ")
; key: KEY_V    value: 0047
else if(key = "0047")
preset("KEY_V   ")
; key: KEY_B    value: 0048
else if(key = "0048")
msgbox, "you press key b"
;preset("KEY_B   ")
; key: KEY_N    value: 0049
else if(key = "0049")
preset("KEY_N   ")
; key: KEY_M    value: 0050
else if(key = "0050")
preset("KEY_M   ")
; key: KEY_COMMA   value: 0051
else if(key = "0051")
preset("KEY_COMMA  ")
; key: KEY_DOT    value: 0052
else if(key = "0052")
preset("KEY_DOT   ")
; key: KEY_SLASH   value: 0053
else if(key = "0053")
preset("KEY_SLASH  ")
; key: KEY_RIGHTSHIFT   value: 0054
else if(key = "0054")
preset("KEY_RIGHTSHIFT  ")
; key: KEY_KPASTERISK   value: 0055
else if(key = "0055")
preset("KEY_KPASTERISK  ")
; key: KEY_LEFTALT   value: 0056
else if(key = "0056")
preset("KEY_LEFTALT  ")
; key: KEY_SPACE   value: 0057
else if(key = "0057")
preset("KEY_SPACE  ")
; key: KEY_CAPSLOCK   value: 0058
else if(key = "0058")
preset("KEY_CAPSLOCK  ")
; key: KEY_F1    value: 0059
else if(key = "0059")
preset("KEY_F1   ")
; key: KEY_F2    value: 0060
else if(key = "0060")
preset("KEY_F2   ")
; key: KEY_F3    value: 0061
else if(key = "0061")
preset("KEY_F3   ")
; key: KEY_F4    value: 0062
else if(key = "0062")
preset("KEY_F4   ")
; key: KEY_F5    value: 0063
else if(key = "0063")
preset("KEY_F5   ")
; key: KEY_F6    value: 0064
else if(key = "0064")
preset("KEY_F6   ")
; key: KEY_F7    value: 0065
else if(key = "0065")
preset("KEY_F7   ")
; key: KEY_F8    value: 0066
else if(key = "0066")
preset("KEY_F8   ")
; key: KEY_F9    value: 0067
else if(key = "0067")
preset("KEY_F9   ")
; key: KEY_F10    value: 0068
else if(key = "0068")
preset("KEY_F10   ")
; key: KEY_NUMLOCK   value: 0069
else if(key = "0069")
preset("KEY_NUMLOCK  ")
; key: KEY_SCROLLLOCK   value: 0070
else if(key = "0070")
preset("KEY_SCROLLLOCK  ")
; key: KEY_KP7    value: 0071
else if(key = "0071")
preset("KEY_KP7   ")
; key: KEY_KP8    value: 0072
else if(key = "0072")
preset("KEY_KP8   ")
; key: KEY_KP9    value: 0073
else if(key = "0073")
preset("KEY_KP9   ")
; key: KEY_KPMINUS   value: 0074
else if(key = "0074")
preset("KEY_KPMINUS  ")
; key: KEY_KP4    value: 0075
else if(key = "0075")
preset("KEY_KP4   ")
; key: KEY_KP5    value: 0076
else if(key = "0076")
preset("KEY_KP5   ")
; key: KEY_KP6    value: 0077
else if(key = "0077")
preset("KEY_KP6   ")
; key: KEY_KPPLUS   value: 0078
else if(key = "0078")
preset("KEY_KPPLUS  ")
; key: KEY_KP1    value: 0079
else if(key = "0079")
preset("KEY_KP1   ")
; key: KEY_KP2    value: 0080
else if(key = "0080")
preset("KEY_KP2   ")
; key: KEY_KP3    value: 0081
else if(key = "0081")
preset("KEY_KP3   ")
; key: KEY_KP0    value: 0082
else if(key = "0082")
preset("KEY_KP0   ")
; key: KEY_KPDOT   value: 0083
else if(key = "0083")
preset("KEY_KPDOT  ")
; key: KEY_ZENKAKUHANKAKU  value: 0085
else if(key = "0085")
preset("KEY_ZENKAKUHANKAKU ")
; key: KEY_102ND   value: 0086
else if(key = "0086")
preset("KEY_102ND  ")
; key: KEY_F11    value: 0087
else if(key = "0087")
preset("KEY_F11   ")
; key: KEY_F12    value: 0088
else if(key = "0088")
preset("KEY_F12   ")
; key: KEY_RO    value: 0089
else if(key = "0089")
preset("KEY_RO   ")
; key: KEY_KATAKANA   value: 0090
else if(key = "0090")
preset("KEY_KATAKANA  ")
; key: KEY_HIRAGANA   value: 0091
else if(key = "0091")
preset("KEY_HIRAGANA  ")
; key: KEY_HENKAN   value: 0092
else if(key = "0092")
preset("KEY_HENKAN  ")
; key: KEY_KATAKANAHIRAGANA  value: 0093
else if(key = "0093")
preset("KEY_KATAKANAHIRAGANA ")
; key: KEY_MUHENKAN   value: 0094
else if(key = "0094")
preset("KEY_MUHENKAN  ")
; key: KEY_KPJPCOMMA   value: 0095
else if(key = "0095")
preset("KEY_KPJPCOMMA  ")
; key: KEY_KPENTER   value: 0096
else if(key = "0096")
preset("KEY_KPENTER  ")
; key: KEY_RIGHTCTRL   value: 0097
else if(key = "0097")
preset("KEY_RIGHTCTRL  ")
; key: KEY_KPSLASH   value: 0098
else if(key = "0098")
preset("KEY_KPSLASH  ")
; key: KEY_SYSRQ   value: 0099
else if(key = "0099")
preset("KEY_SYSRQ  ")
; key: KEY_RIGHTALT   value: 0100
else if(key = "0100")
preset("KEY_RIGHTALT  ")
; key: KEY_LINEFEED   value: 0101
else if(key = "0101")
preset("KEY_LINEFEED  ")
; key: KEY_HOME   value: 0102
else if(key = "0102")
preset("KEY_HOME  ")
; key: KEY_UP    value: 0103
else if(key = "0103")
preset("KEY_UP   ")
; key: KEY_PAGEUP   value: 0104
else if(key = "0104")
preset("KEY_PAGEUP  ")
; key: KEY_LEFT   value: 0105
else if(key = "0105")
preset("KEY_LEFT  ")
; key: KEY_RIGHT   value: 0106
else if(key = "0106")
preset("KEY_RIGHT  ")
; key: KEY_END    value: 0107
else if(key = "0107")
preset("KEY_END   ")
; key: KEY_DOWN   value: 0108
else if(key = "0108")
preset("KEY_DOWN  ")
; key: KEY_PAGEDOWN   value: 0109
else if(key = "0109")
preset("KEY_PAGEDOWN  ")
; key: KEY_INSERT   value: 0110
else if(key = "0110")
preset("KEY_INSERT  ")
; key: KEY_DELETE   value: 0111
else if(key = "0111")
preset("KEY_DELETE  ")
; key: KEY_MACRO   value: 0112
else if(key = "0112")
preset("KEY_MACRO  ")
; key: KEY_MUTE   value: 0113
else if(key = "0113")
preset("KEY_MUTE  ")
; key: KEY_VOLUMEDOWN   value: 0114
else if(key = "0114")
preset("KEY_VOLUMEDOWN  ")
; key: KEY_VOLUMEUP   value: 0115
else if(key = "0115")
preset("KEY_VOLUMEUP  ")
; key: KEY_KPEQUAL   value: 0117
else if(key = "0117")
preset("KEY_KPEQUAL  ")
; key: KEY_KPPLUSMINUS   value: 0118
else if(key = "0118")
preset("KEY_KPPLUSMINUS  ")
; key: KEY_PAUSE   value: 0119
else if(key = "0119")
preset("KEY_PAUSE  ")
; key: KEY_KPCOMMA   value: 0121
else if(key = "0121")
preset("KEY_KPCOMMA  ")
; key: KEY_HANGEUL   value: 0122
else if(key = "0122")
preset("KEY_HANGEUL  ")
; key: KEY_HANJA   value: 0123
else if(key = "0123")
preset("KEY_HANJA  ")
; key: KEY_YEN    value: 0124
else if(key = "0124")
preset("KEY_YEN   ")
; key: KEY_LEFTMETA   value: 0125
else if(key = "0125")
preset("KEY_LEFTMETA  ")
; key: KEY_RIGHTMETA   value: 0126
else if(key = "0126")
preset("KEY_RIGHTMETA  ")
; key: KEY_COMPOSE   value: 0127
else if(key = "0127")
preset("KEY_COMPOSE  ")
; key: KEY_AGAIN   value: 0129
else if(key = "0129")
preset("KEY_AGAIN  ")
; key: KEY_FRONT   value: 0132
else if(key = "0132")
preset("KEY_FRONT  ")
; key: KEY_SETUP   value: 0141
else if(key = "0141")
preset("KEY_SETUP  ")
; key: KEY_SENDFILE   value: 0145
else if(key = "0145")
preset("KEY_SENDFILE  ")
; key: KEY_DELETEFILE   value: 0146
else if(key = "0146")
preset("KEY_DELETEFILE  ")
; key: KEY_XFER   value: 0147
else if(key = "0147")
preset("KEY_XFER  ")
; key: KEY_PROG1   value: 0148
else if(key = "0148")
preset("KEY_PROG1  ")
; key: KEY_PROG2   value: 0149
else if(key = "0149")
preset("KEY_PROG2  ")
; key: KEY_MSDOS   value: 0151
else if(key = "0151")
preset("KEY_MSDOS  ")
; key: KEY_DIRECTION   value: 0153
else if(key = "0153")
preset("KEY_DIRECTION  ")
; key: KEY_CYCLEWINDOWS  value: 0154
else if(key = "0154")
preset("KEY_CYCLEWINDOWS ")
; key: KEY_MAIL   value: 0155
else if(key = "0155")
preset("KEY_MAIL  ")
; key: KEY_COMPUTER   value: 0157
else if(key = "0157")
preset("KEY_COMPUTER  ")
; key: KEY_CLOSECD   value: 0160
else if(key = "0160")
preset("KEY_CLOSECD  ")
; key: KEY_EJECTCD   value: 0161
else if(key = "0161")
preset("KEY_EJECTCD  ")
; key: KEY_EJECTCLOSECD  value: 0162
else if(key = "0162")
preset("KEY_EJECTCLOSECD ")
; key: KEY_NEXTSONG   value: 0163
else if(key = "0163")
preset("KEY_NEXTSONG  ")
; key: KEY_PLAYPAUSE   value: 0164
else if(key = "0164")
preset("KEY_PLAYPAUSE  ")
; key: KEY_PREVIOUSSONG  value: 0165
else if(key = "0165")
preset("KEY_PREVIOUSSONG ")
; key: KEY_STOPCD   value: 0166
else if(key = "0166")
preset("KEY_STOPCD  ")
; key: KEY_RECORD   value: 0167
else if(key = "0167")
preset("KEY_RECORD  ")
; key: KEY_REWIND   value: 0168
else if(key = "0168")
preset("KEY_REWIND  ")
; key: KEY_ISO    value: 0170
else if(key = "0170")
preset("KEY_ISO   ")
; key: KEY_MOVE   value: 0175
else if(key = "0175")
preset("KEY_MOVE  ")
; key: KEY_EDIT   value: 0176
else if(key = "0176")
preset("KEY_EDIT  ")
; key: KEY_SCROLLUP   value: 0177
else if(key = "0177")
preset("KEY_SCROLLUP  ")
; key: KEY_SCROLLDOWN   value: 0178
else if(key = "0178")
preset("KEY_SCROLLDOWN  ")
; key: KEY_KPLEFTPAREN   value: 0179
else if(key = "0179")
preset("KEY_KPLEFTPAREN  ")
; key: KEY_KPRIGHTPAREN  value: 0180
else if(key = "0180")
preset("KEY_KPRIGHTPAREN ")
; key: KEY_F13    value: 0183
else if(key = "0183")
preset("KEY_F13   ")
; key: KEY_F14    value: 0184
else if(key = "0184")
preset("KEY_F14   ")
; key: KEY_F15    value: 0185
else if(key = "0185")
preset("KEY_F15   ")
; key: KEY_F16    value: 0186
else if(key = "0186")
preset("KEY_F16   ")
; key: KEY_F17    value: 0187
else if(key = "0187")
preset("KEY_F17   ")
; key: KEY_F18    value: 0188
else if(key = "0188")
preset("KEY_F18   ")
; key: KEY_F19    value: 0189
else if(key = "0189")
preset("KEY_F19   ")
; key: KEY_F20    value: 0190
else if(key = "0190")
preset("KEY_F20   ")
; key: KEY_F21    value: 0191
else if(key = "0191")
preset("KEY_F21   ")
; key: KEY_F22    value: 0192
else if(key = "0192")
preset("KEY_F22   ")
; key: KEY_F23    value: 0193
else if(key = "0193")
preset("KEY_F23   ")
; key: KEY_F24    value: 0194
else if(key = "0194")
preset("KEY_F24   ")
; key: KEY_PLAYCD   value: 0200
else if(key = "0200")
preset("KEY_PLAYCD  ")
; key: KEY_PAUSECD   value: 0201
else if(key = "0201")
preset("KEY_PAUSECD  ")
; key: KEY_PROG3   value: 0202
else if(key = "0202")
preset("KEY_PROG3  ")
; key: KEY_PROG4   value: 0203
else if(key = "0203")
preset("KEY_PROG4  ")
; key: KEY_SUSPEND   value: 0205
else if(key = "0205")
preset("KEY_SUSPEND  ")
; key: KEY_PLAY   value: 0207
else if(key = "0207")
preset("KEY_PLAY  ")
; key: KEY_FASTFORWARD   value: 0208
else if(key = "0208")
preset("KEY_FASTFORWARD  ")
; key: KEY_BASSBOOST   value: 0209
else if(key = "0209")
preset("KEY_BASSBOOST  ")
; key: KEY_HP    value: 0211
else if(key = "0211")
preset("KEY_HP   ")
; key: KEY_CAMERA   value: 0212
else if(key = "0212")
preset("KEY_CAMERA  ")
; key: KEY_SOUND   value: 0213
else if(key = "0213")
preset("KEY_SOUND  ")
; key: KEY_QUESTION   value: 0214
else if(key = "0214")
preset("KEY_QUESTION  ")
; key: KEY_EMAIL   value: 0215
else if(key = "0215")
preset("KEY_EMAIL  ")
; key: KEY_CHAT   value: 0216
else if(key = "0216")
preset("KEY_CHAT  ")
; key: KEY_SEARCH   value: 0217
else if(key = "0217")
preset("KEY_SEARCH  ")
; key: KEY_CONNECT   value: 0218
else if(key = "0218")
preset("KEY_CONNECT  ")
; key: KEY_SPORT   value: 0220
else if(key = "0220")
preset("KEY_SPORT  ")
; key: KEY_SHOP   value: 0221
else if(key = "0221")
preset("KEY_SHOP  ")
; key: KEY_ALTERASE   value: 0222
else if(key = "0222")
preset("KEY_ALTERASE  ")
; key: KEY_BRIGHTNESSDOWN  value: 0224
else if(key = "0224")
preset("KEY_BRIGHTNESSDOWN ")
; key: KEY_BRIGHTNESSUP  value: 0225
else if(key = "0225")
preset("KEY_BRIGHTNESSUP ")
; key: KEY_MEDIA   value: 0226
else if(key = "0226")
preset("KEY_MEDIA  ")
; key: KEY_KBDILLUMTOGGLE  value: 0228
else if(key = "0228")
preset("KEY_KBDILLUMTOGGLE ")
; key: KEY_KBDILLUMDOWN  value: 0229
else if(key = "0229")
preset("KEY_KBDILLUMDOWN ")
; key: KEY_KBDILLUMUP   value: 0230
else if(key = "0230")
preset("KEY_KBDILLUMUP  ")
; key: KEY_DOCUMENTS   value: 0235
else if(key = "0235")
preset("KEY_DOCUMENTS  ")
; key: KEY_BATTERY   value: 0236
else if(key = "0236")
preset("KEY_BATTERY  ")
; key: KEY_BLUETOOTH   value: 0237
else if(key = "0237")
preset("KEY_BLUETOOTH  ")
; key: KEY_WLAN   value: 0238
else if(key = "0238")
preset("KEY_WLAN  ")
; key: KEY_UWB    value: 0239
else if(key = "0239")
preset("KEY_UWB   ")
; key: KEY_UNKNOWN   value: 0240
else if(key = "0240")
preset("KEY_UNKNOWN  ")
; key: KEY_WIMAX   value: 0246
else if(key = "0246")
preset("KEY_WIMAX  ")

; key: reload  value: 294410
else if(key = "294410")
preset("ctl-z")
; key: reload  value: 29191810
else if(key = "29191810")
preset("reload")
reload this scrip
 

;from luamacros F24
;THE BLOCK OF CODE ABOVE is the original, simple Luamacros-dependant script.


;;;ALL THE CODE BELOW CAN BE THE ACTUAL FUNCTIONS THAT YOU WANT TO CALL;;;


;;;;;;temporary tooltip maker;;;;;;
Tippy(tipsHere, wait:=333)
{
ToolTip, %tipsHere% TP,,,8
SetTimer, noTip, %wait% ;--in 1/3 seconds by default, remove the tooltip
}
noTip:
	ToolTip,,,,8
	;removes the tooltip
return
;;;;;;/temporary tooltip maker;;;;;;


insertSFX(parameter){
msgbox, you launched insertSFX with the parameter %parameter%
msgbox, obviously you can now put any function you like in here.

}


audiomonomaker(parameter){
msgbox, you launched audiomonomaker with the parameter %parameter%
msgbox, you can grab the real function from Almost_All_Premiere_Functions.ahk

}


preset(parameter){
msgbox, you launched PRESET with the parameter %parameter%

}


recallTransition(parameter){
msgbox, you launched recallTransition with the parameter %parameter%
}


copy(bar){
msgbox, you launched COPY with the parameter %bar%

}

paste(foo){
msgbox, you launched PASTE with the parameter %foo%

}
