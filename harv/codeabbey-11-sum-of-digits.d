import std.array, std.conv, std.stdio;

uint digsum(in uint n)
{
    uint m = n, d = 0;
    
    for (; m != 0; m /= 10) d += (m % 10);
    
    return d;
}

int main()
{
    /* read number of triples from stdin */
    string input = readln();
    uint triples = parse!uint(input);
    
    /* repeatedly read from stdin and perform calculations */
    uint[] sums;
    for (uint k = 0; k < triples; k++)
    {
        auto t = split(readln());
        sums ~= digsum(parse!uint(t[0]) * parse!uint(t[1]) + parse!uint(t[2]));
    }
    
    for (uint k = 0; k < sums.length; k++) write(sums[k], " ");
    writeln;
    
    return 0;
}

;Ratzenfutz
