------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.1.3 "Stack in detail"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Lib

main :: IO ()
main = print $ myAdd 5 6
