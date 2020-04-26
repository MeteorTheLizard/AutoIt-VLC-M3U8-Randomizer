#NoTrayIcon

#Include <Array.au3>

HotKeySet("{F5}","_Exit")
Func _Exit()
	Exit
EndFunc

Global $M3U8FilePath = "C:\Users\RX1500x-METEOR\Desktop/Longplay.m3u8"
If not FileExists($M3U8FilePath) Then Exit

Global $FileContents = FileRead($M3U8FilePath)
Local $TempSplit = StringSplit($M3U8FilePath,"/") ;- Tiny Optimization
Global $M3U8LocalPath = $TempSplit[1]
Global $M3U8LocalName = $TempSplit[2]
Global $NewFileName = "Scrambled_" & $M3U8LocalName

;- Convert String to Array
$FileContents = StringSplit($FileContents,@CRLF)

;- Remove blanks
$FileContents = _ArrayToString($FileContents,"|")
$FileContents = StringReplace($FileContents,"||","|")
$FileContents = StringSplit($FileContents,"|",2)

_ArrayDelete($FileContents,0) ;- Remove ArrayCount
_ArrayDelete($FileContents,0) ;- Remove Filetype info
;- Remove blank at the end (If it exists)
If $FileContents[uBound($FileContents) - 1] == "" Then _ArrayDelete($FileContents,uBound($FileContents)-1)

;- Find a new suffix if the File already exists
If FileExists($M3U8LocalPath & "/" & $NewFileName) Then
	For $I = 0 To 1000 Step 1
		If not FileExists($M3U8LocalPath & "/" & $I & "_" & $NewFileName) Then
			ConsoleWrite("File already existed, new suffix! ( "&$I&" )"&@CRLF)
			If $I <> 0 Then $NewFileName = "Scrambled_" & $I & "_" & $M3U8LocalName
			ExitLoop
		EndIf
	Next
EndIf

Global $Length = uBound($FileContents) - 1
Global $NewFileContentArray[$Length] = ["#EXTM3U"]
Global $NewIndex = 1

Do
	Local $LLength = uBound($FileContents) - 1
	Local $RNGesus = Round(Random(0,$LLength),0)
	If Mod($RNGesus,2) = 1 Then $RNGesus = $RNGesus - 1 ;- If RNG number is even, go back by 1 so we can start at the M3U8 Index.

	$NewFileContentArray[$NewIndex] = $FileContents[$RNGesus]
	$NewIndex = $NewIndex + 1

	$NewFileContentArray[$NewIndex] = $FileContents[$RNGesus + 1]
	$NewIndex = $NewIndex + 1

	;_ ArrayDelete is extremely slow and makes this program take a very long time. (Find a solution for this)
	_ArrayDelete($FileContents,$RNGesus) ;- Remove M3U8 Index
	_ArrayDelete($FileContents,$RNGesus) ;- Remove Path to song
Until $NewIndex >= $Length

;Finish things up and write it to a File.
FileWrite($M3U8LocalPath & "/" & $NewFileName,_ArrayToString($NewFileContentArray,@CRLF))