f = assert(io.open("abbey_051.txt", "r"))

io.write("input data:\n")

answers = {}

for i=1,3 do
    
    local roll_list = {}
    local roll = f:read("*number")

    while roll ~= 0 do
        io.write(roll, " ")
        table.insert(roll_list, roll)
        roll = f:read("*number")
    end
    io.write("\n")
    
    --sort rolls
    table.sort(roll_list)

    --smallest and largest roll sums
    local smallest = roll_list[1]
    local largest = roll_list[#roll_list]

    --all possible dice numbers
    poss_die = {}
    for j=1,5 do
        if j > smallest then
            break
        else
            if (j * 12) >= largest then
                table.insert(poss_die, j)
            end
        end
    end
    --all possible side numbers
    poss_sides = {}
    for j=2,12,2 do
        for k=1,#poss_die do
            if (j * poss_die[k]) >= largest then
                table.insert(poss_sides, j)
                break
            end
        end
    end
    
    --group and count rolls
    local last = roll_list[1]
    local roll_count = {}
    local tally = 1
    for j=2,#roll_list do
        if roll_list[j] == last then
            tally = tally + 1
        else
            roll_count[last] = tally
            tally = 1
        end
        last = roll_list[j]
    end
    roll_count[last] = tally
    
    local mean = 0
    for k,v in pairs(roll_count) do
        mean = mean + (k * v) / #roll_list
    end
    
    --compare means of possible dice/side combinations to measured
    local distance = 1/0
    local dice = 0
    local sides = 0
    for j=1,#poss_die do
        for k=1,#poss_sides do
            if (poss_die[j] * poss_sides[k]) >= largest then --valid
                --theoretical mean of rolling N M-sided dice
                local poss_mean = (poss_die[j] * (poss_sides[k] + 1)) / 2
                --find closest to measured mean
                if math.abs(mean - poss_mean) < distance then
                    distance = math.abs(mean - poss_mean)
                    dice = poss_die[j]
                    sides = poss_sides[k]
                elseif math.abs(mean - poss_mean) == distance then --tied
                    math.randomseed(os.time()) --pick one at random
                    if math.random(0, 1) == 0 then
                        dice = poss_die[j]
                        sides = poss_sides[k]
                    end
                end
            end
        end
    end
    answers[i] = dice .. "d" .. sides
end

io.write("\nanswer:\n")
for i=1,#answers do
    io.write(answers[i], " ")
end
io.write("\n")