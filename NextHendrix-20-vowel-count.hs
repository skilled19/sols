import Data.List

main = do
  input <- getContents
  putStrLn $ (formatOut . wizardry) input

parse :: String -> ([String], Int)
parse s = ((tail $ lines s), (read . head . lines $ s :: Int))

wizardry s = map length $ (doMagic . parse) s
doMagic :: ([String], Int) -> [String]
doMagic (_, 0) = []
doMagic ((x:xs), n) = (intersect x vowels) : doMagic (xs, (n-1)) where
  vowels = "aeiouy"

formatOut :: [Int] -> String
formatOut xs = intercalate " " (map show xs)
