import Test.Tasty
import Test.Tasty.HUnit
import Challenge3 (filterByMostCommonDigit)
import OrdListHelper (mostCommon)
import MatrixHelper (getColumnByIndex)

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests" [testAddition, testGetColumnByIndex, testMostCommon, testFilterByMostCommonDigit1,testFilterByMostCommonDigit2 ])

testAddition :: TestTree
testAddition = testCase "test addition" 
  (assertEqual "for (+) 1 2," 3 ((+) 1 2))

{- OrdListHelper-}
testMostCommon :: TestTree
testMostCommon = testCase "test mostCommon" 
  (assertEqual "for mostCommon," '1' (mostCommon "110001101101001111111"))

{- MatrixHelper -}
testGetColumnByIndex :: TestTree
testGetColumnByIndex = testCase "test getColumnByIndex" 
  (assertEqual "for getColumnByIndex," "10000" (getColumnByIndex 1 ["110", "001", "101", "101", "001"]))

{- Challenge3 -}
testFilterByMostCommonDigit1 :: TestTree
testFilterByMostCommonDigit1 = testCase "test filterByMostCommonDigit 1" 
  (assertEqual "for filterByMostCommonDigit," "110" (filterByMostCommonDigit 0 ["110", "001", "101"]))

testFilterByMostCommonDigit2 :: TestTree
testFilterByMostCommonDigit2 = testCase "test filterByMostCommonDigit 2" 
  (assertEqual "for filterByMostCommonDigit," "1011" (filterByMostCommonDigit 0 ["1100", "0010", "1010", "1011"]))
  


