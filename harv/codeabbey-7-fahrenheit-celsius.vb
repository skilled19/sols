Sub challenge7()

        Dim numbers As String
        Dim pair As Integer
        Dim celcius As Integer
        numbers = Console.ReadLine()

        pair = numbers.Split(" ")(0)

        For i As Integer = 1 To pair
            celcius = (numbers.Split(" ")(i) - 32) * 5 / 9
            Console.Write(celcius & " ")
        Next
        Console.ReadLine()
    End Sub