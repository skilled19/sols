input     = File.open("InputData.txt",     "r")
output     = File.open("result.txt",         "w")
res     = []
sides     = [2, 4, 6, 8, 10, 12]
comb     = {}

#Gets all combinations of each variant of dices
1.upto(5) do |dice|
    sides.each do |side|
        if dice == 1
            comb[[dice, side]] = (1..side).zip
        elsif dice == 2
            comb[[dice, side]] = (1..side).zip.flatten.product((1..side).zip.flatten)
        elsif dice == 3
            comb[[dice, side]] = (1..side).zip.flatten.product((1..side).zip.flatten, (1..side).zip.flatten)
        elsif dice == 4
            comb[[dice, side]] = (1..side).zip.flatten.product((1..side).zip.flatten, (1..side).zip.flatten, (1..side).zip.flatten)
        elsif dice == 5
            comb[[dice, side]] = (1..side).zip.flatten.product((1..side).zip.flatten, (1..side).zip.flatten, (1..side).zip.flatten, (1..side).zip.flatten)
        end
    end
end

while (line = input.gets) do

    hh = {} 
    row = line.split.map(&:to_i)[0..-2]
    row.each do |val| comb.each do |key, value|
            
        next if row.min < key[0] or row.max > key[0]*key[1]                                #Filter by min and max value of the row

        pos = (value.select { |c| c.reduce(:+) == val}.count.to_f)/value.count.to_f        #Probability of combination
            if pos > 0 then
                hh[key] = 0 if !hh.key?(key)
                hh[key] += pos
            end
        end
    end

    res << "#{hh.key(hh.values.max)[0]}d#{hh.key(hh.values.max)[1]}"
    
end

print res.join(' ')
output.write(res*' ')

output.close
input.close
