module Day2.Part2 where

import Day2.Util ( Entry (..), parseEntry )

day2part2 :: String -> String
day2part2 input = show $ solve entries
  where entries = map parseEntry $ lines input

solve :: [Entry] -> Int
solve = length . filter isValid

isValid :: Entry -> Bool
isValid entry = (password !! pos1 == char) /= (password !! pos2 == char)
  where pos1 = a entry - 1
        pos2 = b entry - 1
        char = c entry
        password = p entry
