open System.IO

let digitsum (x: string) = x.ToCharArray() |> Seq.sumBy System.Char.GetNumericValue |> int
let tripProduct x y z = x * y + z

let n = File.ReadAllLines("input.txt")
for line in n do
    let tmp = line.Split() |> Seq.map int |> Seq.toList |> fun x -> tripProduct x.[0] x.[1] x.[2]
    printf "%i " (sprintf "%i" tmp |> digitsum)
