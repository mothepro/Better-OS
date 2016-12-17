#Q::
	InputBox, num, Dec to Hex, Enter a base 10 floating point number
	if ErrorLevel <> 0  ; The user pressed Cancel.
		Return
	ret := FloatToHex(num)
	Send % SubStr(ret, 3)
	Return

#W::
	InputBox, num, Dec to Hex, Enter a base 10 integer
	; SetFormat Integer, H
	num:= num + 0
	SetFormat, Integer, Hex
	num += 0 ;forces number into current fomatinteger
	Send % SubStr(num, 3)
	Return

HexToFloat(x) {
	Return (1-2*(x>>31)) * (2**((x>>23 & 255)-150)) * (0x800000 | x & 0x7FFFFF)
}

HexToDouble(x) { ; may be wrong at extreme values
	Return (2*(x>0)-1) * (2**((x>>52 & 0x7FF)-1075)) * (0x10000000000000 | x & 0xFFFFFFFFFFFFF)
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
