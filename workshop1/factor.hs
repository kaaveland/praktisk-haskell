module Main(main) where

import Data.List
import System.Environment

factors :: Integer -> [Integer]
factors n = loop n 2
  where loop n i
          | i * i > n = [n]
          | i `divides` n = i : loop (n `div` i) i
          | otherwise = loop n (i + 1)
        i `divides` n = n `rem` i == 0

printFactors :: [String] -> IO ()
printFactors = mapM_ printFactors'
  where printFactors' s = let n = read s :: Integer
                              f = map show $ factors n
                              e = s ++ ":"
                          in putStrLn $ intercalate " " (e : f)

main :: IO ()
main = do
  args <- getArgs
  if length args > 0 then
    printFactors args
    else
    do content <- getContents
       printFactors $ words content
