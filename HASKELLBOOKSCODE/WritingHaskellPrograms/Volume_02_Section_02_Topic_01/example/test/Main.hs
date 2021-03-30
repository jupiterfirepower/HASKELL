------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import QuaternionSpec as QS
import Test.Hspec
import TripletSpec as TS

main :: IO ()
main = hspec $ QS.spec >> TS.spec
