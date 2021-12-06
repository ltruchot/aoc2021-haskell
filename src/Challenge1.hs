module Challenge1
    ( 
      calculateIncreasedCount,
      calculateCumulatedIncreasedCount
    ) where

---- public ---- 
calculateIncreasedCount :: [Int] -> String
calculateIncreasedCount = show . length . keepIncreased . makeIncreasingList

calculateCumulatedIncreasedCount :: [Int] -> String
calculateCumulatedIncreasedCount = calculateIncreasedCount . (makeCumulativeList [])

---- private ----
data Status = Increased | NotIncreased | NoChange | NA | None deriving (Enum, Show, Eq)

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
makeIncreasingList list = tail . enhanceWithMesurement $ list
  where enhanceWithMesurement = scanl makeMesurementPair (-1 :: Int, None)

---- debug only ----
showTuples :: [(Int, Status)] -> String
showTuples xs = concatMap format xs
  where
    format (a, b) = (show a) ++ " : " ++ (show b) ++ "\n"

display :: [(Int, Status)] -> IO ()
display tuples = putStr (showTuples tuples)

