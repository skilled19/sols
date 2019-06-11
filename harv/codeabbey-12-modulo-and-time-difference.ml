let file = "p12.txt" (* input file *) 

let convert_to_sec day hour min sec =
  let rez = sec + (min * 60) + (hour * 60 * 60) +
          (day * 24 * 60 * 60) in
  rez


let convert_from_sec sec =
  let left = ref sec in
  
  let day = !left / (24 * 60 * 60) in
  left := !left mod (24 * 60 * 60);

  let hour = !left / (60 * 60) in
  left := !left mod (60 * 60);

  let min = !left / (60) in
  left := !left mod (60);

  Printf.printf "(%d %d %d %d) " day hour min !left


let solve s_list =

  let i_list = List.map (int_of_string) s_list in
  match i_list with
  | day1::hour1::min1::sec1::day2::hour2::min2::sec2::[] ->
     let diff = (convert_to_sec day2 hour2 min2 sec2) -
        (convert_to_sec day1 hour1 min1 sec1) in
     convert_from_sec diff
                    
  | _ -> failwith "wrong format"
                    
    
let () =

  (* reading the input, string list list *)
  let sList = Ca.read_input file in
  
  List.iter solve sList;
  Printf.printf "\n"
#  IIIIkuoaIIII  