        Dim lines = input.Trim.Split(vbLf)
        For Each line In lines
            Dim numbers = line.Split(" "c).ToList.Select(Function(x) CInt(x)).ToList
            Dim value = numbers(0) * numbers(1) + numbers(2)
            ' sum the digits
            Dim sum = 0
            Do
                Dim remainder = value Mod 10
                sum += remainder
                value = value \ 10
            Loop Until value <= 0
            Debug.Write(sum & " ")
        Next
;Guy Gervais        