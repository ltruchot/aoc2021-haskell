module Challenge2
    (
        toDirectionsProduct
    ) where

import Data.List (foldl)
import ListHelper (strListToInt)
import TupleHelper (showIntTuple, tuplify, tupleProduct)

---- public ----
toDirectionsProduct :: [String] -> String
toDirectionsProduct = show . tupleProduct . foldHorizontalAndDepth . map strToDirectionTuple

---- private ----
data Direction = Up | Down | Forward deriving (Enum, Show, Eq)

strToDirectionTuple :: String -> (Direction, Int)
strToDirectionTuple str =
    let w = tuplify (words str) 
        value = read (snd w) :: Int
        direction = case fst w of 
                "up" -> Up
                "down" -> Down
                _ ->  Forward
    in (direction, value)

foldHorizontalAndDepth :: [(Direction, Int)] -> (Int, Int)
foldHorizontalAndDepth = foldl conditionalTupleSum (0, 0)

conditionalTupleSum :: (Int, Int) -> (Direction, Int) -> (Int, Int)
conditionalTupleSum acc cur = 
        let (dir, val) = cur
            (horizontal, depth) = acc
            result = case dir of
                Up -> (horizontal, depth - val)
                Down -> (horizontal, depth + val)
                Forward -> (horizontal + val, depth)

        in result


