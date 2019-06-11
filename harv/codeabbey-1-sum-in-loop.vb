Module Module1

    Sub Main()
        Dim Counter As Integer
        Dim Input As String
        Dim Input_Numbers() As String
        Dim Output As Integer
        Counter = Console.ReadLine
        Input = Console.ReadLine
        Input_Numbers = Input.Split(" ")
        For X = 0 To Counter - 1
            Output += Convert.ToInt32(Input_Numbers(X))
        Next

        Console.WriteLine(Output)
        Console.ReadLine()
    End Sub

End Module