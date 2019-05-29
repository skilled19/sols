open System
open System.IO

let foldMin =    
    Array.fold (fun s (x:string) -> Math.Min(s, Convert.ToInt32(x))) Int32.MaxValue  // good enough :)

[<EntryPoint>]
let main argv = 
    // no checks made, assume input is sane
    let input = File.ReadAllLines("MinOfTwo.txt")
    // ignore the count
    for line in input.[1..] do
        printfn "%d" (foldMin <| line.Split(' '))
    Console.ReadKey() |> ignor
