module Challenge1
    ( 
      toIncreasedCount,
      toCumulatedIncreasedCount
    ) where

import Data.List (length, filter, take, tail)
import ListHelper (strListToInt)

---- public ---- 
toIncreasedCount :: [String] -> String
toIncreasedCount =  calculateIncreasedCount . strListToInt

toCumulatedIncreasedCount :: [String] -> String
toCumulatedIncreasedCount = calculateIncreasedCount . (makeCumulativeList []) . strListToInt

---- private ----
data Status = Increased | NotIncreased | NoChange | NA | None deriving (Enum, Show, Eq)

calculateIncreasedCount :: [Int] -> String
calculateIncreasedCount = show . length . keepIncreased . makeIncreasingList 

keepIncreased :: [(Int, Status)] -> [(Int, Status)] 
keepIncreased = filter (\x -> (snd x) == Increased)

makeMesurementPair :: (Int, Status) -> Int -> (Int, Status)
makeMesurementPair prev current =  
  let prevValue = fst prev
      status =
        if prevValue == -1 then NA 
        else if prevValue < current then Increased 
        else if prevValue == current then NoChange
        else NotIncreased
  in (current, status)


safeTake3 :: [Int] -> Maybe [Int]
safeTake3 list = 
  let taken = take 3 list
      result = 
        if length taken == 3 then Just taken
        else Nothing
  in result

makeCumulativeList :: [Int] -> [Int] -> [Int]
makeCumulativeList accumulator list = case safeTake3 list of
  Just values -> makeCumulativeList (accumulator ++ [sum values]) (tail list)
  Nothing -> accumulator

makeIncreasingList :: [Int] -> [(Int, Status)]
makeIncreasingList = tail . enhanceWithMesurement
  where enhanceWithMesurement = scanl makeMesurementPair (-1 :: Int, None)

