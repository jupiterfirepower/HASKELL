------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.3.5 "A brief tour of popular packages"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Control.Monad
import Control.Monad.ST
import Data.Vector.Unboxed (Vector, unsafeFreeze)
import Data.Vector.Unboxed.Mutable (unsafeNew, unsafeWrite)

vectorOfSquares :: Int -> Vector Int
vectorOfSquares n = runST $ do
    xs <- unsafeNew n
    forM_ [0..n - 1] $
        \i -> unsafeWrite xs i (i * i)
    unsafeFreeze xs

main :: IO ()
main = let xs = vectorOfSquares 10 in print xs
