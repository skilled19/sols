Imports System.IO
Module Module1

    Sub Main()

        'declaration
        Dim sr As New StreamReader("numbers.txt")
        Dim numbers(2) As String
        Dim finished As Boolean = False
        Dim temp As Integer

        For i As Integer = 1 To CInt(sr.ReadLine)
            'return array containing three numbers
            numbers = Split(sr.ReadLine, " ")
            'Console.WriteLine(numbers(0) & ", " & numbers(1) & ", " & numbers(2))
            'begin bubble sort
            Do
                finished = True
                For j = 1 To 2
                    If CInt(numbers(j - 1)) > CInt(numbers(j)) Then
                        temp = numbers(j - 1)
                        numbers(j - 1) = numbers(j)
                        numbers(j) = temp
                    End If
                Next j
                For j = 1 To 2
                    If CInt(numbers(j)) < CInt(numbers(j - 1)) Then
                        finished = False
                    End If
                Next
            Loop Until finished
            Console.WriteLine(numbers(0))
        Next i

        Console.ReadKey()

        sr.Close()
        sr.Dispose()

    End Sub

End Module
