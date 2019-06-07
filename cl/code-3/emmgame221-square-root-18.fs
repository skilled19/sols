let sqrt (x : double) (steps : int) : double =
    let mutable est = 1.0
    let mutable quot = (x / est)
    let mutable i = 0
    while (i < steps) do
        est <- (est + quot) / 2.0
        quot <- x / est
        i <- (i + 1)
    est
[<EntryPoint>]
let main argv = 
    let lines = Int32.Parse (Console.ReadLine())
    let roots = Array.zeroCreate lines
    for i = 0 to (lines - 1) do
        let line = Console.ReadLine().Split()
        roots.[i] <- sqrt (Double.Parse(line.[0])) (Int32.Parse(line.[1]))
    for root in roots do
        printf "%f " root
    printf "\n"
    0
