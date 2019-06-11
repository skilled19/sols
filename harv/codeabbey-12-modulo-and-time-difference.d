import std.stdio;


void main()
{
    size_t count;
    ushort day1, hour1, min1, sec1, day2, hour2, min2, sec2;
    ushort diffs[][4];
    
    
    readf("%d\n", &count);
    diffs.length = count;
    
    
    foreach (size_t i; 0 .. count)
    {
        readf("%d %d %d %d %d %d %d %d\n",
            &day1, &hour1, &min1, &sec1, &day2, &hour2, &min2, &sec2);
        
        uint date1 = 60 * (60 * (day1 * 24 + hour1) + min1) + sec1;
        uint date2 = 60 * (60 * (day2 * 24 + hour2) + min2) + sec2;
        auto ddate = date2 - date1;
        
        ushort dday, dhour, dmin, dsec;
        
        dday = cast(ushort) (ddate / (24 * 60 * 60));
        ddate -= dday * 24 * 60 * 60;
        dhour = cast(ushort) (ddate / (60 * 60));
        ddate -= dhour * 60 * 60;
        dmin = cast(ushort) (ddate / 60);
        ddate -= dmin * 60;
        dsec = cast(ushort) ddate;
        
        diffs[i] = [dday, dhour, dmin, dsec];
    }
    
    
    foreach (ushort[4] diff; diffs)
    {
        writef("(%d %d %d %d) ", diff[0], diff[1], diff[2], diff[3]);
    }
    writeln();
}
; yozhikv10