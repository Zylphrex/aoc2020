{-# LANGUAGE DeriveDataTypeable #-}
module Main where

import System.Console.CmdArgs ( Data
                              , Typeable
                              , cmdArgs
                              , def
                              )
import System.Exit            ( ExitCode ( ExitFailure )
                              , exitWith
                              )

import Day1.Part1 ( day1part1 )
import Day1.Part2 ( day1part2 )
import Day2.Part1 ( day2part1 )
import Day2.Part2 ( day2part2 )
import Day3.Part1 ( day3part1 )
import Day3.Part2 ( day3part2 )

data AoC = Aoc { day  :: Int
               , part :: Int
               }
           deriving (Show, Data, Typeable)

aoc = Aoc { day = def
          , part = def
          }

main :: IO ()
main = do
    config <- cmdArgs aoc
    let d = day config
        p = part config
        m = case (d, p) of
                (1, 1) -> Just day1part1
                (1, 2) -> Just day1part2
                (2, 1) -> Just day2part1
                (2, 2) -> Just day2part2
                (3, 1) -> Just day3part1
                (3, 2) -> Just day3part2
                _ -> Nothing
    case m of
        Just f -> interact f
        Nothing -> exitWith $ ExitFailure 1
