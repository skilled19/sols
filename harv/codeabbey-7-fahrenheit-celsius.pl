use POSIX;

@a = split(/\s+/, <STDIN>);
for ($i = 1; $i <= @a[0]; $i++) {
    print floor((@a[$i] - 32) * 5 / 9 + 0.5), " ";
}