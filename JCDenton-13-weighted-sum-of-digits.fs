pen System.IO

let rec weightedSum (x: int list, y: int) =
  match x with
  | [] -> 0
  | hd :: tail -> int(hd) * y + weightedSum(tail, y + 1)

let df = File.ReadAllText("input.txt").Split()
let result = df |> Seq.map(fun x -> x.ToCharArray() |> Seq.map (fun x -> int x - int '0')
                                                    |> Seq.toList
                                                    |> fun x -> weightedSum(x, 1))

result |> Seq.iter (printf "%i ")

