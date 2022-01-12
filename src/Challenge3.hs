module Challenge3
    (
        toPowerConsumptionProduct,
        toLifeSupportRating,
        filterByMostCommonDigit,
    ) where

import Data.Char(digitToInt)
import TupleHelper (tupleProduct)
import Data.Maybe (listToMaybe)
import Data.Ord (comparing)
import Numeric (readInt)
import OrdListHelper (mostCommon, lessCommon)
import MatrixHelper (mostCommonByColumns, getColumnByIndex)


---- public ----
toPowerConsumptionProduct :: [String] -> String
toPowerConsumptionProduct = show . tupleProduct . getGammaAndEpsilon . mostCommonByColumns

toLifeSupportRating :: [String] -> String
toLifeSupportRating = show . tupleProduct . getOxygenAndCo2

---- private ----
getGammaAndEpsilon :: String -> (Int, Int)
getGammaAndEpsilon bitStr = (bitStringToInt bitStr, bitStringToInt . reverseBitString $ bitStr)

getOxygenAndCo2 :: [String] -> (Int, Int)
getOxygenAndCo2 digits = (bitStringToInt $ filterByMostCommonDigit 0 digits, bitStringToInt $ filterByLessCommonDigit 0 digits)

filterByMostCommonDigit :: Int -> [String] -> String
filterByMostCommonDigit colsToDrop digits = if length digits == 1
    then head digits
    else filterByMostCommonDigit nextColsToDrop nextDigits
        where
            mostCommonFirstDigit = mostCommon $ getColumnByIndex colsToDrop digits
            nextDigits = filter (\str -> mostCommonFirstDigit == (str !! colsToDrop)) digits
            nextColsToDrop = colsToDrop + 1

filterByLessCommonDigit :: Int -> [String] -> String
filterByLessCommonDigit colsToDrop digits = if length digits == 1
    then head digits
    else filterByLessCommonDigit nextColsToDrop nextDigits
        where
            lessCommonFirstDigit = lessCommon $ getColumnByIndex colsToDrop digits
            nextDigits = filter (\str -> lessCommonFirstDigit == (str !! colsToDrop)) digits
            nextColsToDrop = colsToDrop + 1

bitStringToInt :: String -> Int
bitStringToInt = fst . head . readBin

reverseBitString :: String -> String
reverseBitString = map reverseBitChar

reverseBitChar :: Char -> Char
reverseBitChar char = if char == '0' then '1' else '0'

readBin :: String -> [(Int, String)]
readBin = readInt 2 (`elem` "01") digitToInt


