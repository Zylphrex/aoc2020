module Day2.Util where

import Data.Char ( isDigit, isLetter, isSpace )

data Entry = Entry { a :: Int
                   , b :: Int
                   , c :: Char
                   , p :: String
                   } deriving Show

parseEntry :: String -> Entry
parseEntry line = Entry { a = read aStr
                        , b = read bStr
                        , c = cStr !! 0
                        , p = pStr
                        }
  where (aStr, _:rest1)  = span isDigit line
        (bStr, _:rest2)  = span isDigit rest1
        (cStr, _:_:pStr) = span isLetter rest2


