open System.IO
let readInput fname =
    let doSomeMath (x1,y1,x2,y2) =
        // some napkin math later...
        let a = (y1 - y2) / (x1 - x2)
        let b = y2 - x2 * a
        a,b 
    let extractPairs (line:string) =
        let tmp = line.Split(' ') |> Array.map System.Int32.Parse
        (tmp.[0], tmp.[1], tmp.[2], tmp.[3]) 
    (File.ReadAllLines fname).[1..]
    |> Array.map extractPairs 
    |> Array.map (doSomeMath)
    |> Array.iter (fun (a,b) -> printf "(%d %d) " a b)

readInput "LinearFunctionInput.txt" |> ignore