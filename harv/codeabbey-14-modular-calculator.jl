N = parse(BigInt, readline())
while true
    global N
    str = readline()
    eval(Meta.parse("N = N"*str))
    if str[1] == '%'
        break
    end
end
println(N)
# cojua8