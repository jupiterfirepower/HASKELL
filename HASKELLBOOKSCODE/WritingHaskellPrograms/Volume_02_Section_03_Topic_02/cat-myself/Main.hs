------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.3.2 "Searching"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

main :: IO ()
main = do
    putStrLn "BEGIN"
    x <- readFile "Main.hs"
    putStrLn x
    putStrLn "END"

{-
main :: IO ()
main =
    putStrLn "BEGIN" >>
    readFile "Main.hs" >>= \x ->
    putStrLn x >>
    putStrLn "END"
-}
