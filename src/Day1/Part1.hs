module Day1.Part1 where

import Control.Monad ( guard )
import Data.List     ( tails )
import Util.Util          ( parseInts )

day1part1 :: String -> String
day1part1 input = show $ a * b
  where xs     = parseInts input
        (a, b) = head $ solve 2020 xs

solve :: Int -> [Int] -> [(Int, Int)]
solve c xs = do
    (x:ys) <- tails xs
    y <- ys
    guard $ x + y == c
    return (x, y)
