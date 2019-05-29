et secondsToDHMS (seconds : int) =
    let days = seconds / (60 * 60 * 24)
    let mutable temp = seconds % (60 * 60 * 24)
    let hours = temp / (60 * 60)
    temp <- temp % (60 * 60)
    let minutes = temp / 60
    temp <- temp % 60
    let seconds = temp
    (days, hours, minutes, seconds)

let dateToSeconds (date : int []) =
    date.[0] * 60 * 60 * 24 + date.[1] * 60 * 60 + date.[2] * 60 + date.[3]

[<EntryPoint>]
let main argv = 
    let lines = Int32.Parse (Console.ReadLine())
    let results = Array.zeroCreate lines
    for i = 1 to lines do
        let line = List.toArray (List.map Int32.Parse (Array.toList (Console.ReadLine().Split())))
        let firstDate = line.[0..3]
        let secondDate = line.[4..7]
        let difference = secondsToDHMS (dateToSeconds secondDate - dateToSeconds firstDate)
        results.[i - 1] <- difference
    for result in results do
        printf "%A " result
    printf "\n"
    0
