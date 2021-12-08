module TupleHelper (
  showIntTuple,
  tuplify,
  tupleProduct
) where

---- public ----
showIntTuple :: (Int, Int) -> String
showIntTuple = format
  where
    format (a, b) = show a ++ " : " ++ show b ++ "\n"

tuplify :: [a] -> (a,a)
tuplify [x,y] = (x,y)

tupleProduct :: (Int, Int) -> Int 
tupleProduct tuple = 
  let (a, b) = tuple
  in a * b