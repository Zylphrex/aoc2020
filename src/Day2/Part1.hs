module Day2.Part1 where

import Day2.Util ( Entry (..), parseEntry )

day2part1 :: String -> String
day2part1 input = show $ solve entries
  where entries = map parseEntry $ lines input

solve :: [Entry] -> Int
solve = length . filter isValid

isValid :: Entry -> Bool
isValid entry = lower <= count && count <= upper
  where lower = a entry
        upper = b entry
        char  = c entry
        password = p entry
        count = length $ filter (== char) password
