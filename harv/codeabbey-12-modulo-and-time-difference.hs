import Control.Monad

main :: IO()
main = do
    n <- readLn :: IO Int
    forM_ [1..n] (\i -> do
        line <- getLine
        let (d1:h1:m1:s1:d2:h2:m2:s2:_) = map (\a -> read a :: Integer) $ words line
            time1 = ((d1 * 24 + h1) * 60 + m1) * 60 + s1
            time2 = ((d2 * 24 + h2) * 60 + m2) * 60 + s2
        putStrLn $ calcTime (time2 - time1)
        )

calcTime :: Integer -> String
calcTime num = "(" ++ show day ++ " " ++ show hour ++ " " ++ show minute ++ " " ++ show sec ++ ")"
    where sec = num `mod` 60
          minute = (num - sec) `div` 60 `mod` 60
          hour = num `div` 3600 `mod` 24
          day = num `div` 3600 `div` 24
# Haskeller          