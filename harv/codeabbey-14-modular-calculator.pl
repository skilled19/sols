$x = <STDIN>;
@r = ();
while (1) {
    @a = split /\s+/, <STDIN>;
    if ($a[0] ne "%") {
        push @r, @a;
    } else {
        $m = $a[1];
        last;
    }
}
$n = scalar(@r);
for ($i = 0; $i < $n; $i += 2) {
    if ($r[$i] eq "+") {
        $x += $r[$i + 1];
    } else {
        $x *= $r[$i + 1];
    }
    $x %= $m;
}
print $x;
# pearl_barley