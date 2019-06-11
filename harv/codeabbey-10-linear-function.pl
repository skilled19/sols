$n = <STDIN>;
while ($n-- > 0) {
    @a = split(/\s+/, <STDIN>);
    $k = int(($a[3] - $a[1]) / ($a[2] - $a[0]));
    $b = $a[1] - $k * $a[0];
    print "($k $b) ";
}
#pearl_barley