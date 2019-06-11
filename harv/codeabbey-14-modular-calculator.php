<?php
$data = "37
* 8174
* 460
+ 838
+ 617
+ 2
+ 26
* 4
+ 1610
* 7959
+ 10
+ 958
+ 7444
* 4130
* 99
* 4
* 8082
+ 9582
+ 7443
+ 5192
+ 7
+ 1660
* 951
+ 8
+ 143
* 1809
+ 1019
+ 10
+ 8918
* 7757
+ 976
* 95
+ 5161
+ 72
+ 4
* 2
* 1
* 3
+ 3
+ 199
+ 8324
+ 170
* 167
+ 570
* 79
* 9
+ 99
+ 11
* 15
* 84
% 2716";

$vals = explode("\n", $data);
$start_int = array_shift($vals);
$del = explode(" ", array_pop($vals));

foreach ($vals as $val){
    $calc = explode(" ", $val);
    switch($calc[0]){
        case "+":
            $start_int += $calc[1];
            $start_int %= $del[1];
            break;
        case "*":
            $start_int *= $calc[1];
            $start_int %= $del[1];
            break;
    }
    
}
echo $start_int;
// xufimec_
?>