let minimumOfThese (strs: string list) =
    strs
    |> Seq.map (fun t-> t.Split ' ')
    |> Seq.map (Seq.map Int32.Parse)
    |> Seq.map (Seq.min)
