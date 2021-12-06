module Main where

import TextFile (rowsToIntList)
import Challenge1 (calculateIncreasedCount)

main :: IO ()
main = do 
        let entries = rowsToIntList "./data/input0"
        let results = fmap calculateIncreasedCount $ entries
        results >>= putStrLn
