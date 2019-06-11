let file = "p10.txt" (* input file *) 

let find_a_b x1 y1 x2 y2 =
  let a = (y2 - y1) / (x2 - x1) in
  let b = y1 - (a * x1) in
  Printf.printf "(%d %d) " a b

  
         
let solve s_list =
  let i_list = List.map (int_of_string) s_list in

  match i_list with
  | x1::y1::x2::y2::[] ->
     find_a_b x1 y1 x2 y2

  | _ -> failwith "wrong format"
                         
let () =

  (* reading the input, string list list *)
  let sList = Ca.read_input file in 
  List.iter solve sList;
  Printf.printf "\n"
  #IIIIkuoaIIII