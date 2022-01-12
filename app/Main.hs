module Main where

import TextFileHelper(fileLinesToList)
import Challenge1 (toIncreasedCount, toCumulatedIncreasedCount)
import Challenge2 (toDirectionsProduct, toEnhancedDirectionsProduct)
import Challenge3 (toPowerConsumptionProduct, toLifeSupportRating)


main :: IO ()
main = do 
        let data1 = fileLinesToList "./data/input1"
        let challenge1 = toIncreasedCount <$> data1
        challenge1 >>= putStrLn
        let challenge1' = toCumulatedIncreasedCount <$> data1
        challenge1' >>= putStrLn

        let data2 = fileLinesToList "./data/input2"
        let challenge2 = toDirectionsProduct <$> data2
        challenge2 >>= putStrLn
        let challenge2' = toEnhancedDirectionsProduct <$> data2
        challenge2' >>= putStrLn

        let data3 = fileLinesToList "./data/input3"
        let challenge3 = toPowerConsumptionProduct <$> data3
        challenge3 >>= putStrLn
        let challenge3' = toLifeSupportRating <$> data3
        challenge3' >>= putStrLn
