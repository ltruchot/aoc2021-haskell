module TextFileHelper
    (
        fileLinesToList
    ) where

---- public ----
fileLinesToList :: String -> IO [String]
fileLinesToList filepath =  do
    fmap lines . readFile $ filepath
