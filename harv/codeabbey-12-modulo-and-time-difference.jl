 # First copy and paste test data into a file called "input_data"
 # hawkdove
"""
    parsefile(infile)

Return an array with one subarray of integers for 
each line in the input file (excluding the first).
"""
function parsefile(infile)
    infile = open(infile)
    lines = readlines(infile)
    close(infile)
    lines = [ [parse(Int64, x) for x in split(line, " ")] for line in lines[2:end]]
end

"""
    delayalternative(dates)

Alternative to `delay` that does a bit more work
"""
function delayalternative(dates)
    # determine what the delay between the two dates is
    # with output [#days, #hours, #min, # sec]
    delaybyunit = dates[5:end] .- dates[1:4]
    # Determine the total number of seconds in the delay
    conversions = [24 * 60 * 60, 60*60, 60, 1]
    secondsdelay = sum(delaybyunit .* conversions)
    # Convert the total delay in seconds back to delay by units
    # (This will get rid of any negative values in the delay,
    # such as changing [0, 1, -34, 0] to [0 0 26 0])
    for (i, x) in enumerate(conversions)
        intquotient, secondsdelay = fldmod(secondsdelay, x)
        delaybyunit[i] = intquotient
    end
    return delaybyunit
end

"""
    alldelays(infile)

Print a line expressing time delay between input dates on/for each line of input file.
"""
function alldelays(infile)
    lines = parsefile(infile)
    for line in lines
        print( "($(join(delayalternative(line), " ")))", " ")
    end
    println()
end