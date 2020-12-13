module Day4.Part1 where

import Data.Foldable   ( asum )
import Data.List       ( all, foldl, isPrefixOf, isSuffixOf )
import Data.List.Split ( splitWhen )
import Data.Maybe      ( isJust )
import Text.Read       ( readMaybe )

data Passport = Passport { byr :: Maybe String
                         , iyr :: Maybe String
                         , eyr :: Maybe String
                         , hgt :: Maybe String
                         , hcl :: Maybe String
                         , ecl :: Maybe String
                         , pid :: Maybe String
                         , cid :: Maybe String
                         } deriving Show

isValidPassport :: Passport -> Bool
isValidPassport passport = all (== True) [ isJust $ byr passport
                                         , isJust $ iyr passport
                                         , isJust $ eyr passport
                                         , isJust $ hgt passport
                                         , isJust $ hcl passport
                                         , isJust $ ecl passport
                                         , isJust $ pid passport
                                         ]

day4part1 :: String -> String
day4part1 input = show $ length $ filter isValidPassport passportData
  where passportData = map parsePassportData $ splitPassportData input

mergePassports :: Passport -> Passport -> Passport
mergePassports p1 p2 = Passport { byr = asum $ map byr [p1, p2]
                                , iyr = asum $ map iyr [p1, p2]
                                , eyr = asum $ map eyr [p1, p2]
                                , hgt = asum $ map hgt [p1, p2]
                                , hcl = asum $ map hcl [p1, p2]
                                , ecl = asum $ map ecl [p1, p2]
                                , pid = asum $ map pid [p1, p2]
                                , cid = asum $ map cid [p1, p2]
                                }

empty :: Passport
empty = Passport { byr = Nothing
                 , iyr = Nothing
                 , eyr = Nothing
                 , hgt = Nothing
                 , hcl = Nothing
                 , ecl = Nothing
                 , pid = Nothing
                 , cid = Nothing
                 }

splitPassportData :: String -> [[String]]
splitPassportData = map (words . unlines) . splitWhen (== "") . lines

parsePassportData :: [String] -> Passport
parsePassportData = (foldl mergePassports empty) . (map parsePassportEntry)

parsePassportEntry :: String -> Passport
parsePassportEntry entry | "byr:" `isPrefixOf` entry = empty { byr = Just $ drop 4 entry }
                         | "iyr:" `isPrefixOf` entry = empty { iyr = Just $ drop 4 entry }
                         | "eyr:" `isPrefixOf` entry = empty { eyr = Just $ drop 4 entry }
                         | "hgt:" `isPrefixOf` entry = empty { hgt = Just $ drop 4 entry }
                         | "hcl:" `isPrefixOf` entry = empty { hcl = Just $ drop 4 entry }
                         | "ecl:" `isPrefixOf` entry = empty { ecl = Just $ drop 4 entry }
                         | "pid:" `isPrefixOf` entry = empty { pid = Just $ drop 4 entry }
                         | "cid:" `isPrefixOf` entry = empty { cid = Just $ drop 4 entry }
                         | otherwise                 = empty
