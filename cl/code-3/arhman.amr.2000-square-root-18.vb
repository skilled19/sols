Module Module1

    Sub Main()
        Dim n As Integer = Console.ReadLine()
        Dim a(n) As Double

        For i = 0 To n - 1
            Dim cData() As String = Console.ReadLine().Split()
            a(i) = 1

            For z = 0 To CInt(cData(1)) - 1
                a(i) = (a(i) + CInt(cData(0)) / a(i)) / 2
            Next
        Next

        For j = 0 To n - 1
            Console.Write(a(j) & " ")
        Next

        Console.ReadLine()
    End Sub


End Module
