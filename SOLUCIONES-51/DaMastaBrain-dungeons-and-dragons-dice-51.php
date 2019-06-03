<?php

$dice = [2, 4, 6, 8, 10, 12];
$tuples = [];

for($i = 1; $i <= 5; $i++) {
    foreach($dice as $die) {
        $tuples[] = [$i, $die, $i * $die, ($i + $i * $die) / 2]; // [X, dY, max, avg] (no min because X == min)
    }
}

usort($tuples, function($a, $b) {
    if ($a[2]  < $b[2]) return -1;
    if ($a[2]  > $b[2]) return  1;
    if ($a[3] == $b[3]) return  0;
    return ($a[3] < $b[3]) ? -1 : 1;
});

//foreach ($tuples as $t) {
//    printf("[ %d,  %2d,  %2d,  %4.1f]\n", $t[0], $t[1], $t[2], $t[3]);
//}

for($i = 0, $answers = []; $i < 3; $i++) {
    $numbers = explode(' ', fgets(STDIN));
    array_pop($numbers);
    $max = max($numbers);
    $avg = array_sum($numbers) / count($numbers);
    $min = min($numbers);
    $plausible = [];

    foreach($tuples as $tuple) {
        if($min >= $tuple[0] && $max <= $tuple[2]) {
            if(empty($plausible)) {
                $plausible = $tuple;
                continue;
            }

            if(abs($avg - $tuple[3]) < abs($avg - $plausible[3])) {
                $plausible = $tuple;
            }
        }
    }

    $answers[] = $plausible[0] . 'd' . $plausible[1];
}

echo implode(' ', $answers);