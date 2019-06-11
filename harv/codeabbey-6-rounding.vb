Module Module1

    Sub Main()
        Dim n As Integer = Console.ReadLine()
        Dim arrayone(n - 1) As Decimal
        Dim arraytwo(n - 1) As Decimal
        Dim answer As Integer
        For i = 0 To n - 1
            arrayone(i) = Console.ReadLine
            arraytwo(i) = Console.ReadLine
        Next
        For i = 0 To n - 1
            answer = Math.Round(arrayone(i) / arraytwo(i), 0, MidpointRounding.AwayFromZero)
            Console.Write(answer & " ")
        Next
        Console.ReadLine()
    End Sub

End Module