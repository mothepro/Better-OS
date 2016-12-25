; Dec -> Hex

#Q::
	InputBox, num, Dec to Hex, Enter a base 10 floating point number,,,,,,,,%Clipboard%
	if ErrorLevel <> 0  ; The user pressed Cancel.
		Return
	ret := FloatToHex(num)
	Send % SubStr(ret, 3)
	Return

#W::
	InputBox, num, Dec to Hex, Enter a base 10 integer,,,,,,,,%Clipboard%
	; SetFormat Integer, H
	num:= num + 0
	SetFormat, Integer, Hex
	num += 0 ;forces number into current fomatinteger
	Send % SubStr(num, 3)
	Return

; Hex -> Dec

#S:: 
	InputBox, num, Hex to Dec, Enter a base 16 integer,,,,,,,,%Clipboard%
	num := "0x" . num
	
	SetFormat, Integer, D
	num:= num + 0

	Send % num
	Return

#A::
	InputBox, num, Hex to Dec, Enter a base 16 floating point number,,,,,,,,%Clipboard%
	if ErrorLevel <> 0  ; The user pressed Cancel.
		Return

	num := "0x" . num
	Send % HexToFloat(num)
	Return

GetSelectedText() {
	tmp = %ClipboardAll% ; save clipboard
	Clipboard := "" ; clear clipboard
	Send, ^c ; simulate Ctrl+C (=selection in clipboard)
	ClipWait, 0, 1 ; wait until clipboard contains data
	selection = %Clipboard% ; save the content of the clipboard
	Clipboard = %tmp% ; restore old content of the clipboard
	return selection
}

HexToFloat(d) {
	  Return (1-2*(d>>31)) * (2**((d>>23 & 255)-127)) * (1+(d & 8388607)/8388608) ; 2**23
}

HexToDouble(x) { ; may be wrong at extreme values
	Return (2*(x>0)-1) * (2((x>>52 & 0x7FF)-1075)) * (0x10000000000000 | x & 0)
}

FloatToHex(f) {
	form := A_FormatInteger
	SetFormat Integer, HEX
	v := DllCall("MulDiv", Float,f, Int,1, Int,1, UInt)
	SetFormat Integer, %form%
	Return v
}

DoubleToHex(d) {
	form := A_FormatInteger
	SetFormat Integer, HEX
	v := DllCall("ntdll.dll\RtlLargeIntegerShiftLeft",Double,d, UChar,0, Int64)
	SetFormat Integer, %form%
	Return v
}
