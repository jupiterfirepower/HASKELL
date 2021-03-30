------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.1.4 "Stack hints and tips"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Lib

main :: IO ()
main = do
    putStrLn "Hello from application code"
    print $ myAdd 5 6
