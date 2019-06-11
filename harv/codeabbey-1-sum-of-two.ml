let (a, b) = Scanf.scanf " %d %d" (fun a b -> (a, b))
let c = a+b;;
Printf.printf "%d\n" c;;