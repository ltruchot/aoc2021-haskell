module Main where

import TextFile (rowsToIntList)
import Challenge1 (calculateIncreasedCount, calculateCumulatedIncreasedCount)

main :: IO ()
main = do 
        let entries = rowsToIntList "./data/input0"
        let challenge1 = fmap calculateIncreasedCount $ entries
        challenge1 >>= putStrLn
        let challenge1' = fmap calculateCumulatedIncreasedCount $ entries
        challenge1' >>= putStrLn


