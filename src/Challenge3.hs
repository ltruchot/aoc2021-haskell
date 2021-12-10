module Challenge3
    (
        toPowerConsumptionProduct
    ) where

import Data.Char(digitToInt)
import TupleHelper (tupleProduct)
import Data.List(group, sort, maximumBy, transpose, length, head, map)
import Data.Maybe (listToMaybe)
import Data.Ord (comparing)
import Numeric (readInt)

---- public ----
toPowerConsumptionProduct :: [String] -> String
toPowerConsumptionProduct = show. tupleProduct . getGammaAndEpsilon . mostCommonByColumns

---- private ----
getGammaAndEpsilon :: String -> (Int, Int)
getGammaAndEpsilon bitStr = (bitStringToInt bitStr, bitStringToInt . reverseBitString $ bitStr)

mostCommon :: Ord a => [a] -> a
mostCommon = head . maximumBy (comparing length) . group . sort

mostCommonByColumns :: [[Char]] -> [Char]
mostCommonByColumns = map mostCommon . transpose

bitStringToInt :: String -> Int
bitStringToInt = fst . head . readBin

reverseBitString :: String -> String 
reverseBitString = map reverseBitChar

reverseBitChar :: Char -> Char 
reverseBitChar char = if char == '0' then '1' else '0'

readBin :: String -> [(Int, String)]
readBin = readInt 2 (`elem` "01") digitToInt


