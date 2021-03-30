------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.3.3 "Navigating packages"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import qualified TagSoupDemo
import qualified TaggyDemo

main :: IO ()
main = do
    h <- readFile "colours.html"
    print $ TagSoupDemo.colours h
    print $ TaggyDemo.colours h
