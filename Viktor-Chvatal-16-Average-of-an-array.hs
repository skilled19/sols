import Data.List

avg x = realToFrac (sum x) / genericLength x
process_line x = show $ round $ avg $ map read $ init $ words x
process_all x = unwords $ map process_line $ tail $ lines x
main = getContents >>= \ text -> putStrLn $ process_all text
