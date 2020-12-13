module Day3.Util where

countTrues :: [[Bool]] -> (Int, Int) -> Int
countTrues grid (dx, dy) = sum $ map gridIsTrue positions
  where height = length grid
        pos i  = (row, col)
          where row = i * dy
                w   = length $ grid !! row
                col = i * dx `mod` w
        positions = takeWhile (\a -> height > fst a) $ map pos [0..]
        gridIsTrue (i, j) = if grid !! i !! j then 1 else 0
