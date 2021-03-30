------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.2.2 "Creating modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main where

import Lib

main :: IO ()
main = do
    let mbPort = mkPort 80
    case mbPort of
        Nothing -> error "Invalid port!"
        Just port -> do
            let a = ListeningAddress 127 0 0 1 port
            print a
