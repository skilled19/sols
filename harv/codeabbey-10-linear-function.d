import std.conv, std.array, std.string, std.stdio;

int main()
{
    /* read number of test cases */
    uint cases = readln.strip.to!uint;
    
    /* process cases */
    int[] m, n;
    for (uint k = 0; k < cases; k++)
    {
        auto coord = readln.strip.split;
        int x1 = coord[0].to!int;
        int y1 = coord[1].to!int;
        int x2 = coord[2].to!int;
        int y2 = coord[3].to!int;
        
        if (x1 == x2) continue;
        
        int a = (y2 - y1)/(x2 - x1);
        int b = y1 - a*x1;
        m ~= a; n ~= b;
    }
    
    writeln;
    for (uint k = 0; k < m.length; k++) writef("(%d %d) ", m[k], n[k]);
    writeln;
    
    return 0;
}
# Ratzenfutz