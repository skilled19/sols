import Control.Monad
import Data.List
import Data.Char

getInt = read <$> getLine :: IO Int
getInts = map read . words <$> getLine :: IO [Int]
getFloats = map read . words <$> getLine :: IO [Float]

pp [a,b,c] = show ans
  where n = a * b + c
        ans = sum . map digitToInt $ show n

main = do
  n <- getInt
  ns <- replicateM n $ pp <$> getInts
  putStrLn . unwords $ ns

  # wizzup