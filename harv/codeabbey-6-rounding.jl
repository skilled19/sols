function parse_nums_in_string(S::String)
  a = split(S, " ")
  b = int(a)

  return b
end

function array_to_string(A::Array)
  S = ""
  N = length(A)

  for i = 1:N
    S = string(S, A[i], " ")
  end

  return S[1:(length(S)-1)]
end

function parse_file(fn::String, header = true)
  if !(contains(fn,":"))
    fn = string("F:\\Julia\\data\\", fn)
  end

  f = open(fn, "r")
  data = readlines(f)
  close(f)

  for i = 1:length(data)
    if contains(data[i],"\r\n")
      n = length(data[i])
      data[i] = data[i][1:(n-2)]
    end
  end

  if header
    N = int(splice!(data,1))
    return N, data
  else
    return data
  end
end

function rounder(x,y)
  z = int(round(x / y))
  return z
end

function main(fn = "data.txt")
  N, data = parse_file(fn, true)
  s = Array(Int,N)
  
  for i = 1:N
    numbers = parse_nums_in_string(data[i])
    s[i] = rounder(numbers[1], numbers[2])
  end
  
  print(array_to_string(s))
end

main()
