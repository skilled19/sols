let file = "p8.txt" (* input file *)

let p_aritm b r n =

  (* aritmetic progression *)
  let rec loop i acc =
    if (i >= n) then
      acc
    else loop (i+1) (acc + b + r*i)
  in loop 0 0
;;
    
       
let solve s_list =
  
  let i_list = List.map (int_of_string) s_list in

  match i_list with
  | b::r::n::[] ->
     let rez = p_aritm b r n in
     Printf.printf "%d " rez

  | _ -> ()
                                            
let () =

  (* reading the input, string list list *)
  let sList = Ca.read_input file in
  List.iter solve sList;
  Printf.printf "\n"