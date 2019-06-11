data = split("39
906392 8 162 48 1885 68411 22017 32 460115 3 167368399 6572 357413 8033627 252 32 658330 504427972 2446631 259 7 595758 99 207925 670646 667254214 12334305 8185 8009 5998922 7191615 1862183 3 6590 23406238 233219156 151845 12235 4061", "\n")

iterator = int(data[1])
numbers = split(data[2])

for i in 1:iterator
  n = numbers[i]
  count = 0
  for j in 1:length(n)
    count += j*parseint(n[j])
  end
  println(int(count))
end
# melisale