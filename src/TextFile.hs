module TextFile
    ( rowsToIntList
    ) where

---- public ----
rowsToIntList :: String -> IO [Int]
rowsToIntList filepath =  do
    contents <- readFile filepath
    let list = map readInt . words $ contents
    return list

---- private ----
readInt :: String -> Int
readInt = read

