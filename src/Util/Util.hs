module Util.Util where

parseInts :: String -> [Int]
parseInts = map read . lines
