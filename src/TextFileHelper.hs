module TextFileHelper
    ( 
        fileLinesToList
    ) where

---- public ----
fileLinesToList :: String -> IO [Int]
fileLinesToList filepath =  do
    contents <- readFile filepath
    let list = map read . lines $ contents
    return list
