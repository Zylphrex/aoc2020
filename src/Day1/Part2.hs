module Day1.Part2 where

import Control.Monad ( guard )
import Data.List     ( tails )
import Util.Util     ( parseInts )

day1part2 :: String -> String
day1part2 input = show $ a * b * c
  where xs        = parseInts input
        (a, b, c) = head $ solve 2020 xs

solve :: Int -> [Int] -> [(Int, Int, Int)]
solve c xs = do
    (x:ys) <- tails xs
    (y:zs) <- tails ys
    z <- zs
    guard $ x + y + z == c
    return (x, y, z)
