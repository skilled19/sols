Module Module1
    Structure Test_Case
        Dim Day As Integer
        Dim Hour As Integer
        Dim Min As Integer
        Dim Sec As Integer

    End Structure
    Sub Main()
        Dim Number_Of_Cases As Integer
        Console.WriteLine("Input the number of cases: ")
        Number_Of_Cases = Console.ReadLine()
        Number_Of_Cases = Number_Of_Cases - 1
        Dim Each_Case(Number_Of_Cases) As Test_Case
        Dim Each_Case_2(Number_Of_Cases) As Test_Case
        For x As Integer = 0 To Number_Of_Cases
            Console.WriteLine("Input new 2 dates: ")
            Each_Case(x).Day = Console.ReadLine()
            Each_Case(x).Hour = Console.ReadLine()
            Each_Case(x).Min = Console.ReadLine()
            Each_Case(x).Sec = Console.ReadLine()
            Each_Case_2(x).Day = Console.ReadLine()
            Each_Case_2(x).Hour = Console.ReadLine()
            Each_Case_2(x).Min = Console.ReadLine()
            Each_Case_2(x).Sec = Console.ReadLine()
        Next
        Dim Converted_1(Number_Of_Cases) As Integer
        Dim Converted_2(Number_Of_Cases) As Integer
        Dim Difference(Number_Of_Cases) As Integer
        Dim Final_Answer(Number_Of_Cases) As Test_Case
        For x = 0 To Number_Of_Cases
            Converted_1(x) = Cnv_1(Each_Case, x)
            Converted_2(x) = Cnv_2(Each_Case_2, x)
            Difference(x) = Converted_2(x) - Converted_1(x)
            Final_Answer(x) = UnCnv(Difference, x)
            Console.Write("(" & Final_Answer(x).Day & " " & Final_Answer(x).Hour & " " & Final_Answer(x).Min & " " & Final_Answer(x).Sec & ") ")
        Next
        Console.ReadKey()
    End Sub
    Function Cnv_1(ByVal Each_Case() As Test_Case, ByVal x As Integer) As Integer
        Dim Answer As Integer
        Dim New_Hour As Integer
        Dim New_Min As Integer
        New_Hour = Each_Case(x).Day * 24 + Each_Case(x).Hour
        New_Min = Each_Case(x).Min + New_Hour * 60
        Answer = Each_Case(x).Sec + New_Min * 60
        Return Answer
    End Function
    Function Cnv_2(ByVal Each_Case_2() As Test_Case, ByVal x As Integer) As Integer
        Dim Answer As Integer
        Dim New_Hour As Integer
        Dim New_Min As Integer
        New_Hour = Each_Case_2(x).Day * 24 + Each_Case_2(x).Hour
        New_Min = Each_Case_2(x).Min + New_Hour * 60
        Answer = Each_Case_2(x).Sec + New_Min * 60
        Return Answer
    End Function

    Function UnCnv(ByVal Difference() As Integer, ByVal x As Integer) As Test_Case
        Dim Answer As Test_Case
        Answer.Sec = Difference(x) Mod 60
        Difference(x) = (Difference(x) - Answer.Sec) / 60
        Answer.Min = Difference(x) Mod 60
        Difference(x) = (Difference(x) - Answer.Min) / 60
        Answer.Hour = Difference(x) Mod 24
        Difference(x) = (Difference(x) - Answer.Hour) / 24
        Answer.Day = Difference(x)
        Return Answer
    End Function
End Module
;pussyslayer