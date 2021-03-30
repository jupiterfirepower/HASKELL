------------------------------------------------------------
--
-- Port.hs
-- Code sample accompanying topic 2.2.2 "Creating modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Lib.Port
    ( Port ()
    , mkPort
    ) where

newtype Port = Port { unPort :: Int } deriving Show

mkPort :: Int -> Maybe Port
mkPort x
    | x < 0 || x > 65535 = Nothing
    | otherwise = Just (Port x)
