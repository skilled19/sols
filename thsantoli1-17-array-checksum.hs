checksum r [] = r
checksum r (x:xs) = checksum (rem (113 * (r+x)) 10000007) xs
