open System

let checksum a =
    let mutable result = 0L
    a
    |> Array.iter (fun x -> result <- (result + x) * 113L % 10000007L)
    result

let count = Convert.ToInt32(Console.ReadLine())

printfn "%d " (checksum (Console.ReadLine().Split(' ') |> Array.map int64))
