module Main where

import TextFileHelper(fileLinesToList)
import Challenge1 (toIncreasedCount, toCumulatedIncreasedCount)
import Challenge2 (toDirectionsProduct)

main :: IO ()
main = do 
        let data1 = fileLinesToList $ "./data/input1"
        let challenge1 = fmap toIncreasedCount $ data1
        challenge1 >>= putStrLn
        let challenge1' = fmap toCumulatedIncreasedCount $ data1
        challenge1' >>= putStrLn

        let data2 = fileLinesToList $ "./data/input2"
        let challenge2 = fmap toDirectionsProduct $ data2
        challenge2 >>= putStrLn
