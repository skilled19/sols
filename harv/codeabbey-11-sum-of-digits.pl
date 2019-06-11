#!/usr/bin/perl

use strict;
use warnings;

print "Your Input: ";
my @in = <STDIN>;
shift(@in);
my @hold;
my @values;
my $foo;
my @bar;
my $baz;
foreach (@in){
        @values = ();
        @values = split(' ', $_);
        $foo = (($values[0] * $values[1])+ $values[2]);
        @bar = split("", $foo);
        $baz = 0;
        foreach(@bar){
                $baz += $_;
        }

    push(@hold, $baz);
}



foreach (@hold){
       print "$_ ";
}
# funboixer