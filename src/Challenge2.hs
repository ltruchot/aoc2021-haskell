module Challenge2
    (
        toDirectionsProduct,
        toEnhancedDirectionsProduct
    ) where

import Data.List (foldl)
import ListHelper (strListToInt)
import TupleHelper (tuplify, tupleProduct, take2)

---- public ----
toDirectionsProduct :: [String] -> String
toDirectionsProduct = show . tupleProduct . foldHorizontalAndDepth . map strToDirectionTuple

-- TODO, challenge2'
toEnhancedDirectionsProduct :: [String] -> String
toEnhancedDirectionsProduct = show . tupleProduct . take2 . foldHorizontalAndDepthByAim . map strToDirectionTuple


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

foldHorizontalAndDepthByAim :: [(Direction, Int)] -> (Int, Int, Int)
foldHorizontalAndDepthByAim = foldl conditionalTupleByAim(0, 0, 0)

conditionalTupleByAim:: (Int, Int, Int) -> (Direction, Int) -> (Int, Int, Int)
conditionalTupleByAim acc cur = 
        let (dir, val) = cur
            (horizontal, depth, aim) = acc
            result = case dir of
                Up -> (horizontal, depth, aim - val)
                Down -> (horizontal, depth, aim + val)
                Forward -> (horizontal + val, depth + (aim * val), aim)

        in result

