Imports System.IO

Module Module1

    Sub Main()

        Dim myReader As StreamReader = New StreamReader("Inputs.txt")
        Dim numberOfLines As Integer = myReader.ReadLine()
        Dim solutionList As New List(Of String)
        Dim finalAnswer As String = Nothing
        Dim line As String = myReader.ReadLine()
        Dim inputArray As Array = line.Split(" ")
        Debug.Print("inputArray is length: " & inputArray.Length)

        For x As Integer = 0 To (inputArray.Length - 1) Step 1
            Debug.Print(inputArray(x))
            Debug.Print(inputArray(0))
            Dim wsdAnswer As Integer = wsd(CStr(inputArray(x)))
            Debug.Print("wsd = " & wsdAnswer)
            solutionList.Add(wsdAnswer)
        Next


        For k As Integer = 0 To solutionList.Count - 1 Step 1
            My.Computer.FileSystem.WriteAllText("Outputs.txt",
                                                String.Format(solutionList(k)) & " ", True)
        Next

    End Sub

    Private Function wsd(ByVal _inputNumber As String)
        Dim inputCharArray As Array = _inputNumber.ToCharArray()
        Dim inputIntArray As Array = Array.ConvertAll(Of Char, Integer)(inputCharArray, Function(str) Int32.Parse(str))
        Dim _outputNumber As Integer
        For i = 1 To inputIntArray.Length Step 1
            _outputNumber += inputIntArray(i - 1) * i
        Next
        Return _outputNumber
    End Function


End Module
; miki.hirama