Module Module1

    Sub Main()
        Dim A, B, N, trials, sum As Integer
        Dim data() As String

        FileOpen(1, "Numbers.txt", OpenMode.Input)

        trials = LineInput(1)

        While Not EOF(1)
            sum = 0
            data = LineInput(1).Split(" ")
            A = CInt(data(0))
            B = CInt(data(1))
            N = CInt(data(2))
            For i As Integer = 0 To N - 1
                sum += (A + (i * B))
            Next
            Console.Write(sum & " ")
        End While

        Console.ReadKey()
    End Sub

End Module