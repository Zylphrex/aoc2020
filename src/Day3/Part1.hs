module Day3.Part1 where

import Day3.Util ( countTrues )

day3part1 :: String -> String
day3part1 input = show $ countTrues slope (3, 1)
  where slope = map (map (== '#')) $ lines input
