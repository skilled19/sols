stepRoot :: Double -> Double -> Double -> Double
stepRoot 0 _ r = r
stepRoot 1 x r = calc18 x r
stepRoot n x r = stepRoot (n-1) x $ calc18 x r

calc18 x r = (r + x/r) / 2

pp18 (x:n:[]) = stepRoot n x 1

p18 = do 
    getLine
        x <- getContents
    mapM_ (\x -> putStr x >> putStr " ") $ map (show . pp18 . map read . words) $ lines x
