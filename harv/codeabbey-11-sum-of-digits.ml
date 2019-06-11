let file = "p43.txt" (* input file *)
               
let solve sList =

  (* int of char provides the ascii code *)
  let ascii_code = int_of_char '0' in
  let rez = ref 0 in

  let rec loop i size string =
    if (i < size) then (

      let digit = (int_of_char string.[i]) - ascii_code in
      let prod = digit * (i+1) in      

      rez := !rez + prod;

      (* recursive call *)
      loop (i+1) size string       
    )
    else
      Printf.printf "%d " !rez

  in match sList with
     | word::[] ->
    
    let size = String.length word in
    loop 0 size word         

     | _ -> ()
          
;;
     
let () =
  
  (* reading the input, string list list *)
  let sList = Ca.read_input file in
  
  List.iter solve sList;
  Printf.printf "\n"
#IIIIkuoaIIII