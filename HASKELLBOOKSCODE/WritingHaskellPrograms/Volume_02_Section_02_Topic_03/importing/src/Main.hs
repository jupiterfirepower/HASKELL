------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.2.3 "Consuming modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import           Data.HashMap (Map)
import qualified Data.HashMap as Map
import           Data.Vector (Vector)
import qualified Data.Vector as Vector

xs :: Vector Int
xs = Vector.fromList [1, 3, 5]

ys :: Map Int String
ys = Map.fromList
    [ (1, "one")
    , (2, "two")
    , (3, "three")
    , (4, "four")
    , (5, "five")
    ]

spellOut :: Map Int String -> Vector Int -> [String]
spellOut m = Vector.foldr
    (\a b -> Map.findWithDefault "(not found)" a m : b)
    []

main :: IO ()
main = print $ spellOut ys xs
