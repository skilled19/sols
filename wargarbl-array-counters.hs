import Data.List

main = do
    content <- getContents
    let input = map read $ words content ::[Int]
    putStr $ concat $ intersperse " " $ map show $ arrayCounter input

arrayCounter :: [Int] -> [Int]
arrayCounter l = map (\xs -> length xs) $ group $ sort l
