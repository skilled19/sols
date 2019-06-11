sub ts {
    return (($_[0] * 24 + $_[1]) * 60 + $_[2]) * 60 + $_[3];
}
$n = <STDIN>;
while ($n-- > 0) {
    @a = split /\s+/, <STDIN>;
    $dt = ts(@a[4..7]) - ts(@a[0..3]);
    $s = $dt % 60;
    $dt = int($dt / 60);
    $m = $dt % 60;
    $dt = int($dt / 60);
    $h = $dt % 24;
    $d = int($dt / 24);
    print "($d $h $m $s) ";
}
# pearl_barley