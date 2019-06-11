  Private Sub Prob9_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim sr As New StreamReader("Prob9Data.txt")
        Dim n As Integer = sr.ReadLine()
        Dim values() As String
        Dim output As Boolean

        For i As Integer = 1 To n
            values = sr.ReadLine.Split()
            output = triangle_ineq_theorem(CInt(values(0)), CInt(values(1)), CInt(values(2)))
            If output = True Then
                txtOutput.Text &= "1 "
            Else : txtOutput.Text &= "0 "
            End If
        Next i

    End Sub

    Public Function triangle_ineq_theorem(ByVal a As Integer, ByVal b As Integer, ByVal c As Integer) As Boolean

        Dim check1, check2, check3 As Boolean

        If (a + b) > c Then
            check1 = True
        End If
        If (a + c) > b Then
            check2 = True
        End If
        If (b + c) > a Then
            check3 = True
        End If

        If (check1 And check2 And check3) Then
            Return True
        Else : Return False
        End If

    End Function