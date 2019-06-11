let is_triangle a b c =
  if a + b >= c && b + c >= a && c + a >= b
  then 1
  else 0

let () =
  Scanf.scanf "%d " (fun n ->
                      for i = 0 to n - 1 do
                        Scanf.scanf "%d %d %d " is_triangle
                        |> Printf.printf "%d "
                      done)