function ap(X::Array)
  # calculate sum of first n elements of an arithmetic progression of step b

  a, b, n = X
  s = a

  for i = 1:(n-1)
    a += b
    s += a
  end

  return s
end