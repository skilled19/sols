f = open("codeabbey/input.txt")
lines = readlines(f)
records = parse(Int64, lines[1])
results = []

Φ_cos(s1, s2, s3) = (s1^2+s2^2-s3^2)/(2*s1*s2)
Φ(t) = 0 <= t <= 1 ? acos(t) : 0
equals(n1, n2, δ) = abs(n2-n1) < δ

istriangle(s1, s2, s3) = s1+s2>s3 && s2+s3>s1 && s1+s3>s2

for i = 2:records+1
    input = [parse(Int64, x) for x = split(lines[i], " ")]
    res = sum([Φ(Φ_cos(input[1], input[2], input[3])),
            Φ(Φ_cos(input[1], input[3], input[2])),
            Φ(Φ_cos(input[2], input[3], input[1]))])
    # Joke! xP
    # push!(results, equals(res, pi, 3) ? 1 : 0)
    push!(results, istriangle(input[1], input[2], input[3]) ? 1 : 0)
end

for r = results
    print(r, " ")
end