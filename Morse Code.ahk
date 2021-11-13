#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Morse(timeout = 400) { ;
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   Loop {
      t := A_TickCount
      KeyWait %key%
      Pattern .= A_TickCount-t > timeout
      KeyWait %key%,DT%tout%
      If (ErrorLevel)
         Return Pattern
   }
}

!z::
   p := Morse()
   StringReplace, pOut1, p, 0, ., ReplaceAll
   StringReplace, pOut2, pOut1, 1, -, ReplaceAll

   If (pOut2 = ".-")
      pOut3:= "A"
   Else If (pOut2 = "-...")
      pOut3:= "B"
   Else If (pOut2 = "-.-.")
      pOut3:= "C"
   Else If (pOut2 = "-..")
      pOut3:= "D"
   Else If (pOut2 = ".")
      pOut3:= "E"
   Else If (pOut2 = "..-.")
      pOut3:= "F"
   Else If (pOut2 = "--.")
      pOut3:= "G"
   Else If (pOut2 = "....")
      pOut3:= "H"
   Else If (pOut2 = "..")
      pOut3:= "I"
   Else If (pOut2 = ".---")
      pOut3:= "J"
   Else If (pOut2 = "-.-")
      pOut3:= "K"
   Else If (pOut2 = ".-..")
      pOut3:= "L"
   Else If (pOut2 = "--")
      pOut3:= "M"
   Else If (pOut2 = "-.")
      pOut3:= "N"
   Else If (pOut2 = "---")
      pOut3:= "O"
   Else If (pOut2 = ".--.")
      pOut3:= "P"
   Else If (pOut2 = "--.-")
      pOut3:= "Q"
   Else If (pOut2 = ".-.")
      pOut3:= "R"
   Else If (pOut2 = "...")
      pOut3:= "S"
   Else If (pOut2 = "-")
      pOut3:= "T"
   Else If (pOut2 = "..-")
      pOut3:= "U"
   Else If (pOut2 = "...-")
      pOut3:= "V"
   Else If (pOut2 = ".--")
      pOut3:= "W"
   Else If (pOut2 = "-..-")
      pOut3:= "X"
   Else If (pOut2 = "-.--")
      pOut3:= "Y"
   Else If (pOut2 = "--..")
      pOut3:= "Z"
   Else If (pOut2 = "---.")
      pOut3:= " "
   Else If (pOut2 = "----")
      pOut3:= "^z"

   send %pOut3%
Return
