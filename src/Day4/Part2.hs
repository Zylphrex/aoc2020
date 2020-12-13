module Day4.Part2 where

import Data.Char       ( isDigit, isHexDigit, isLetter, isLower )
import Data.Foldable   ( asum )
import Data.List       ( all, foldl, isPrefixOf, isSuffixOf )
import Data.List.Split ( splitWhen )
import Data.Maybe      ( fromJust, fromMaybe, isJust )
import Text.Read       ( readMaybe )

day4part2 :: String -> String
day4part2 = show . length . filterValidPassport . parsePassportDatas . splitPassportData
  where filterValidPassport = filter isValidPassport
        parsePassportDatas  = map parsePassportData

maybeToPrec :: Maybe a -> [(a, String)]
maybeToPrec (Just a) = [(a, "")]
maybeToPrec Nothing  = []

newtype Year = Year Int deriving Show

makeYear :: String -> Maybe Year
makeYear x = if fourChars
             then fmap Year $ readMaybe x
             else Nothing
  where fourChars = length x == 4

instance Read Year where
    readsPrec _ = maybeToPrec . makeYear

data Length = Cm Int | In Int deriving Show

makeLength :: String -> Maybe Length
makeLength x | "cm" `isSuffixOf` x = fmap Cm height
             | "in" `isSuffixOf` x = fmap In height
             | otherwise           = Nothing
  where height = if length x < 2
                 then Nothing
                 else readMaybe $ init $ init x

instance Read Length where
    readsPrec _ = maybeToPrec . makeLength

newtype HairColor = HairColor String deriving Show

makeHairColor :: String -> Maybe HairColor
makeHairColor x = if startsWithHash && sevenChars && validHex && validLower
                  then Just $ HairColor x
                  else Nothing
  where startsWithHash = "#" `isPrefixOf` x
        sevenChars     = length x == 7
        validHex       = all isHexDigit $ tail x
        validLower     = all isLower $ filter isLetter $ tail x

instance Read HairColor where
    readsPrec _ = maybeToPrec . makeHairColor

data EyeColor = Amber | Blue | Brown | Gray | Green | Hazel | Other deriving Show

makeEyeColor :: String -> Maybe EyeColor
makeEyeColor "amb" = Just Amber
makeEyeColor "blu" = Just Blue
makeEyeColor "brn" = Just Brown
makeEyeColor "gry" = Just Gray
makeEyeColor "grn" = Just Green
makeEyeColor "hzl" = Just Hazel
makeEyeColor "oth" = Just Other
makeEyeColor _     = Nothing

instance Read EyeColor where
    readsPrec _ = maybeToPrec . makeEyeColor

newtype Pid = Pid Int deriving Show

makePid :: String -> Maybe Pid
makePid x = if nineChars
            then fmap Pid $ readMaybe x
            else Nothing
  where nineChars = length x == 9

instance Read Pid where
    readsPrec _ = maybeToPrec . makePid

type Cid = Int

data Passport = Passport { byr :: Maybe Year
                         , iyr :: Maybe Year
                         , eyr :: Maybe Year
                         , hgt :: Maybe Length
                         , hcl :: Maybe HairColor
                         , ecl :: Maybe EyeColor
                         , pid :: Maybe Pid
                         , cid :: Maybe Cid
                         } deriving Show

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
parsePassportEntry entry | "byr:" `isPrefixOf` entry = empty { byr = readMaybe $ drop 4 entry }
                         | "iyr:" `isPrefixOf` entry = empty { iyr = readMaybe $ drop 4 entry }
                         | "eyr:" `isPrefixOf` entry = empty { eyr = readMaybe $ drop 4 entry }
                         | "hgt:" `isPrefixOf` entry = empty { hgt = readMaybe $ drop 4 entry }
                         | "hcl:" `isPrefixOf` entry = empty { hcl = readMaybe $ drop 4 entry }
                         | "ecl:" `isPrefixOf` entry = empty { ecl = readMaybe $ drop 4 entry }
                         | "pid:" `isPrefixOf` entry = empty { pid = readMaybe $ drop 4 entry }
                         | "cid:" `isPrefixOf` entry = empty { cid = readMaybe $ drop 4 entry }
                         | otherwise                 = empty

isValidPassport :: Passport -> Bool
isValidPassport passport = and [ validByr
                               , validIyr
                               , validEyr
                               , validHgt
                               , validHcl
                               , validEcl
                               , validPid
                               ]
  where validByr = case byr passport of
            Just (Year year) -> 1920 <= year && year <= 2002
            Nothing          -> False
        validIyr = case iyr passport of
            Just (Year year) -> 2010 <= year && year <= 2020
            Nothing          -> False
        validEyr = case eyr passport of
            Just (Year year) -> 2020 <= year && year <= 2030
            Nothing          -> False
        validHgt = case hgt passport of
            Just (Cm height) -> 150 <= height && height <= 193
            Just (In height) -> 59 <= height && height <= 76
            Nothing          -> False
        validHcl = isJust $ hcl passport
        validEcl = isJust $ ecl passport
        validPid = isJust $ pid passport

