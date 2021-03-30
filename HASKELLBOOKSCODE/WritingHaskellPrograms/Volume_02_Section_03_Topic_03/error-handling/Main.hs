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

import Control.Error

safeHead1 :: [a] -> Either String a
safeHead1 [] = Left "empty list"
safeHead1 (x : _) = Right x

safeHead2 :: [a] -> Maybe a
safeHead2 [] = Nothing
safeHead2 (x : _) = Just x

main :: IO ()
main = do
    print $ safeHead1 ([] :: [Int])
    print $ safeHead1 [1..]
    print $ safeHead2 ([] :: [Int])
    print $ safeHead2 [1..]

    print $ hush (safeHead1 ([] :: [Int]))
    print $ hush (safeHead1 [1..])
    print $ note "empty list" (safeHead2 ([] :: [Int]))
    print $ note "empty list" (safeHead2 [1..])
