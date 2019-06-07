Imports System.IO
Imports System.Numerics
Module Module1

    Sub Main()
        Dim unknownword As Double
        Dim file As String
        file = My.Computer.FileSystem.ReadAllText("C:\Users\hamza.DESKTOP-8DJLPME\Desktop\PrimeNumbers.txt")
        Dim str As String = ""
        Dim final As Double
        Dim result As Decimal = Nothing
        Dim arr() As String = file.Split(" ")
        Dim nums As Integer = Console.ReadLine()
        For j As Integer = 1 To nums

            Dim x As Double = Console.ReadLine()
            Dim strx = x

            For i As Integer = 0 To arr.Length - 1
                result = x / CInt(arr(i))
                If Math.Floor(result) = Math.Ceiling(result) Then
                    '      Console.WriteLine(result)
                    str &= (arr(i) & "*")
                    x = result
                    final = result
                    i -= 1


                End If
            Next
     '
            str = str.Substring(0, str.Length - 1)
            str &= " "
        Next

        Console.WriteLine(str)
        Console.ReadLine()
    End Sub

End Module
