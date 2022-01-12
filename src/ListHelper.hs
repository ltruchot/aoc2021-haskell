module ListHelper
    (
        strListToInt
    ) where

strListToInt :: [String] -> [Int]
strListToInt = map read

