function Round(num::Float64)
    intNum = trunc(Int, num)
    if abs(intNum - num) > 0.5
        if num > 0.0
            return intNum + 1
        else
            return intNum - 1
        end
    else
        return intNum
    end
end


N = parse(Int, readline())

for i in 1:N
    x1, y1, x2, y2 = parse.(Int, split(readline()))
    m = (y2 - y1)/(x2 - x1)
    n = y1 - m*x1
    println("(", R
# cojua8   