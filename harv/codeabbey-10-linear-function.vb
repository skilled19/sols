;Ray Wise
Option Explicit

Sub Linear()
    Dim numberOfPairs As Long
    numberOfPairs = Cells(1, 1)
    Dim i As Long
    Dim rawData As Variant
    Dim x1 As Long
    Dim x2 As Long
    Dim y1 As Long
    Dim y2 As Long
    Dim m As Double
    Dim b As Double
    Dim output As String
    For i = 2 To numberOfPairs + 1
        rawData = Split(Trim(Cells(i, 1)), " ")
        x1 = Int(rawData(0))
        y1 = Int(rawData(1))
        x2 = Int(rawData(2))
        y2 = Int(rawData(3))
        
        m = (y2 - y1) / (x2 - x1)
        b = y1 - (m * x1)
        output = output & "(" & m & " " & b & ") "
    Next
    Cells(1, 2) = Trim(output)
End Sub