module Day3.Part2 where

import Day3.Util ( countTrues )

day3part2 :: String -> String
day3part2 input = show $ product $ map countTruesInDir directions
  where slope = map (map (== '#')) $ lines input
        countTruesInDir = countTrues slope
        directions = [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
