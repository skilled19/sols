function count_digits(n)
    s = 0
    while (n > 0)
        s += (n % 10)
        n = div(n, 10)
    end
    return s
end

n = parse(Int, readline())
lst = Array{Int64}(zeros(n))
for i in 1:n
    str = split(readline())
    three_numbers = [parse(Int, str[1]), parse(Int, str[2]), parse(Int, str[3])]
    lst[i] = count_digits(three_numbers[1] * three_numbers[2] + three_numbers[3])
end
for elem in lst
    print(elem, " ")
end
#  AsuraStrike