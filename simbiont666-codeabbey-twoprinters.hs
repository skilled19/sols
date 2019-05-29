main :: IO ()
main = do
       putStrLn =<< fmap (unwords . map ((\[a,b,c] -> show $ f a b c) . map read . words) 
        . drop 1 . lines) getContents

f x y n = let n1 = floor $ fromIntegral(y*n)/((fromIntegral x) + (fromIntegral y))
          in  min (max (x*n1) (y*(n-n1))) (max (x*(n1+1)) (y*(n-n1-1)))
