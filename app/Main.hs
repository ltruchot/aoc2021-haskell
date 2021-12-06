module Main where

import TextFileHelper(fileLinesToList)
import Challenge1 (calculateIncreasedCount, calculateCumulatedIncreasedCount)

main :: IO ()
main = do 
        let data1 = fileLinesToList $ "./data/input1"
        let challenge1 = fmap calculateIncreasedCount $ data1
        challenge1 >>= putStrLn
        let challenge1' = fmap calculateCumulatedIncreasedCount $ data1
        challenge1' >>= putStrLn
