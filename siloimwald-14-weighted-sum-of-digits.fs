open System
open System.IO

open CodeAbbeyLib.CodeAbbeySimple

[<EntryPoint>]
let main argv =       
    let numToDigitList num = 
        // iterate over chars, to string again, to number again, mult with position :o
        [for v in num do yield v.ToString() |> Int32.Parse ]        
        |> List.mapi (fun p e -> (1+p)*e)
        |> List.fold (+) 0
        |> printfn "%d"        
        
    File.ReadAllLines("codeAbbeyIn.txt").[1].Split(' ')    
    |> Array.iter numToDigitList    
    Console.ReadKey() |> ignore
    0 
