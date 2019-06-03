Module Module1

    Sub Main()
        Dim nums As String = "1 2 3 4 5"
        Dim sides As String = "2 4 6 8 10 12"
        Dim num() As String = nums.Split(" ")
        Dim side() As String = sides.Split(" ")
        Dim output As String = ""
        Dim x = "20 24 17 27 17 19 27 11 22 27 23 25 21 16 14 16 12 19 22 18 19 20 24 7 16 21 11 25 25 26 29 27 30 29 16 17 12 30 18 20 28 23 20 23 24 9 18 26 13 25 17 31 15 25 19 11 22 23 26 20 20 15 19 23 31 12 15 24 11 25 28 19 23 22 26 19 23 18 28 18 10 21 21 22 23 28 24 18 20 17 16 15 13 28 19 31 25 14 11 22,28 34 31 28 40 35 29 30 31 27 27 23 34 20 29 36 30 23 33 39 40 33 23 34 23 41 41 25 38 45 42 50 45 26 25 28 32 24 39 37 38 43 25 29 26 15 47 13 20 30 33 19 34 34 39 28 23 30 21 34 31 19 29 28 41 23 34 39 16 36 20 32 49 22 29 42 35 29 31 40 16 37 36 37 23 46 31 28 23 30 36 43 42 32 24 25 35 31 33 30,24 5 21 15 12 11 13 4 21 16 4 4 17 10 9 6 15 8 9 7 13 18 18 13 21 14 9 23 15 7 21 5 8 21 8 11 20 9 22 15 23 5 7 6 11 7 11 18 10 21 17 12 9 12 4 24 5 7 7 20 12 12 12 3 17 13 16 8 20 15 9 12 17 12 18 17 20 14 19 15 12 20 14 12 21 7 4 18 11 6 22 20 13 10 22 7 13 11 16 11"
        For n As Integer = 0 To 2
            Dim bool = False
            Dim input() As String = x.Split(",")
            Dim inp() As String = input(n).Split(" ")
            For i As Integer = 0 To inp.Length - 1
                'Console.Write(inp(i) & " ")
            Next
            Dim avgs As String = ""

            Dim maxind As Integer = 0
            Dim potential As String = ""
            For j As Integer = 0 To num.Length - 1
                For i As Integer = 0 To side.Length - 1
                    Dim max = CInt(side(i)) * CInt(num(j))
                    Dim min = CInt(num(j))

                    For p As Integer = 0 To inp.Length - 2
                        If CInt(inp(p)) > max Or CInt(inp(p)) < min Then
                            bool = False
                            Exit For
                        Else bool = True

                        End If
                    Next

                    If bool = True Then
                        potential &= CStr(num(j)) & "d" & CStr(side(i)) & " "
                    End If
                Next
            Next


            Dim pot() As String = potential.Trim.Split(" ")
            For i As Integer = 0 To pot.Length - 1
                Dim avg = diceavg(pot(i))
                avgs = avgs & count(inp, avg) & " "
            Next

            Dim average() As String = avgs.Trim.Split(" ")

            Dim tmp = CInt(average(0))

            For i As Integer = 0 To average.Length - 1
                If CInt(average(i)) > tmp Then
                    maxind = i
                    tmp = CInt(average(i))
                End If

            Next



            output &= pot(maxind) & " "
        Next
        Console.WriteLine(output.Trim)
        My.Computer.Clipboard.SetText(output.Trim)
        Console.ReadLine()
    End Sub
    Function diceavg(n As String) As Integer
        n = n.Replace("d", " ")

        Dim x() As String = n.Split(" ")
        ' Console.WriteLine(x(0) & " " & x(1))
        Return (CInt(x(0)) + (CInt(x(0)) * CInt(x(1)))) / 2

    End Function
    Function count(arr() As String, x As Integer) As Integer
        Dim counter As Integer = 0
        For i As Integer = 0 To arr.Length - 2
            If CInt(arr(i)) < x + 2 And CInt(arr(i)) > x - 2 Then
                counter += 1
            End If
        Next
        Return counter

    End Function
End Module