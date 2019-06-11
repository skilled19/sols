let modular_calculator (lines: string list) =
    let seed = bigint.Parse lines.Head
    let rec performOperations acc operations =
        match operations with
        | [] -> acc
        | (op, value) :: rest -> 
            match op with
            | "+" -> performOperations (acc + (bigint.Parse value)) rest
            | "*" -> performOperations (acc * (bigint.Parse value)) rest
            | "%" -> performOperations (acc % (bigint.Parse value)) rest
            | _ -> failwith "invalid input. (Expected: +|*|%)"
    lines.Tail
    |> read_test_cases as_pair
    |> performOperations seed
    |> printfn "%O"

execute modular_calculator "modular_calculator.data"
;  trevon.sutton.dev