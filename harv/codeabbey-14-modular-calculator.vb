Public Class Form1

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim inputNum As Integer
        Dim array1() As String
        Dim array2() As String
        Dim linesNum As Integer
        Dim result As Integer
        inputNum = Val(TextBox1.Lines(0))
        linesNum = TextBox1.Lines.GetUpperBound(0)
        array1 = Split(Trim(TextBox1.Lines(linesNum)))
        result = inputNum
        Dim modNum As Integer
        modNum = Val(array1(1))
        For i As Integer = 1 To linesNum - 1
            array2 = Split(Trim(TextBox1.Lines(i)))
            Select Case array2(0)
                Case "+"
                    result += Val(array2(1))
                Case "*"
                    result = result Mod modNum
                    result *= Val(array2(1))
            End Select
        Next i
        result = result Mod modNum
        TextBox2.Text = Str(result)
    End Sub
End Class
;  WitcherOfFire