
// inefficient is the new efficient

open System.IO

type CustomTimeStamp = { day: int; hour: int; minute: int;  second: int }

let readInput fname =
    let lines = File.ReadLines(fname) |> Array.ofSeq
    let amount = lines.[0]
    // day1 hour1 min1 sec1 day2 hour2 min2 sec2
    let mapInputLine (inLine:string) =
        let convert (ts0:int[], ts1:int[]) = 
            { day = ts0.[0] ; hour = ts0.[1] ; minute = ts0.[2] ; second = ts0.[3] },
            { day = ts1.[0] ; hour = ts1.[1] ; minute = ts1.[2] ; second = ts1.[3] }
        let r = Array.map System.Int32.Parse <| inLine.Split(' ')
        (r.[0..3], r.[4..])
        |> convert

    let computeDifference (cts0, cts1) =
        let ctsToSeconds cts =
            (int64 cts.day * 24L * 60L * 60L) + (int64 cts.hour * 60L * 60L) + (int64 cts.minute * 60L) + (int64 cts.second) 
        // simply do it as the task proposes, convert to a base unit (seconds obviously)
        // ts1 is always later
        let diffInSecs = (ctsToSeconds cts1) - (ctsToSeconds cts0)
        // divide off full days, hours, minutes...
        let remainingSecsAfterDays = diffInSecs % (24L*60L*60L)
        let days = (diffInSecs - remainingSecsAfterDays) / (24L*60L*60L)
        let remainingSecsAfterHours = remainingSecsAfterDays % (60L*60L)
        let hours = (remainingSecsAfterDays - remainingSecsAfterHours) / (60L*60L)
        let remainingSecsAfterMinutes = remainingSecsAfterHours % 60L
        let minutes = (remainingSecsAfterHours - remainingSecsAfterMinutes) / 60L
        let secs = remainingSecsAfterMinutes
        sprintf "(%d %d %d %d)" days hours minutes secs
        
    Array.map (fun x -> x |> mapInputLine |> computeDifference |> printf "%s ") lines.[1..]    

readInput "ModuloTimeDifferenceInput.txt" |> ignore
// iloimwald