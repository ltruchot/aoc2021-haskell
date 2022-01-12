module MatrixHelper (
  getColumnByIndex,
  mostCommonByColumns
  ) where

import OrdListHelper (mostCommon)
import Data.List(transpose, map)

getColumnByIndex :: Int -> [[a]] -> [a]
getColumnByIndex idx = map (!! idx) 

mostCommonByColumns :: Ord a =>[[a]] -> [a]
mostCommonByColumns = map mostCommon . transpose
