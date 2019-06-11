import std.array, std.conv, std.stdio;

int main()
{
    /* read from stdin and convert */
    string input = readln();
    uint fractions = parse!uint(input);
    
    /* loop through input, read from stdin, convert and calculate */
    int[] q;
    int t;
    for (uint k = 0; k < fractions; k++)
    {
        auto nd = split(readln());
        int num = parse!int(nd[0]);
        int denom = parse!int(nd[1]);
        /* D comes with native assembly support */
        asm
        {
            fild    num;
            fidiv   denom;
            fistp   t;
        }
        q ~= t;
    }
    
    q.writeln;
    
    return 0;
}