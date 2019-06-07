for cnt = io.read('*n'), 1, -1 do
    local num = io.read('*n')
    local n = num

    local nums = {}
    for i = 2, math.sqrt(n) do
        while n % i == 0 do
            table.insert(nums, i)
            n = math.floor(n / i)
        end
    end
    if #nums == 0 then
        table.insert(nums, num)
    end
    io.write(table.concat(nums, '*'), ' ')
end
