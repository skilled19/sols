data = int(split("35 312 448 477 337 59 290 204 234 282 233 50 552 599 566 556 81 463 225 62 445 377 76 120 542 593 49 95 321 246 596 47 527 444 493 264"))

function rounder(a)
  d = split(string(a), '.')

  result = int(d[1])
  dopovi = d[2]
  elle = length(dopovi)
  dopovi = float(dopovi)/10^elle

  if dopovi >= 0.5
    if result <= 0
      result -= 1
    else
      result += 1
    end
  end
  return result
end

for i in 2:data[1]+1
  println(rounder((data[i]-32)/1.8))
end