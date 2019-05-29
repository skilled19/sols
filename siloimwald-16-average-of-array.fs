open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple

[<EntryPoint>]
let main argv =           
    for line in File.ReadAllLines("codeAbbeyIn.txt").[1..] do
        (lineToNumArray Double.Parse) line
        |> Array.filter (fun v -> v > 0.0)  // drop the last zero
        |> Array.average |> Operators.round |> int |> printf "%d "
    Console.ReadKey() |> ignore
    0 
