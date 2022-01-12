module OrdListHelper
    (
        mostCommon,
        lessCommon
    ) where

import Data.List(group, sort, maximumBy, minimumBy, length)
import Data.Ord (comparing)

mostCommon :: Ord a => [a] -> a
mostCommon = maximum . maximumBy (comparing length) . group . sort

lessCommon :: Ord a => [a] -> a
lessCommon = minimum . minimumBy (comparing length) . group . sort