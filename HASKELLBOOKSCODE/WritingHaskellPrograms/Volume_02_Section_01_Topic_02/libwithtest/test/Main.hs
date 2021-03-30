------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.1.2 "Cabal files"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Test.Hspec

myAdd :: Int -> Int -> Int
myAdd x y = x + y

main :: IO ()
main = hspec spec

spec :: Spec
spec =
    describe "myAdd" $ do
        it "should return 11 when I pass 5 and 6" $ do
            myAdd 5 6 `shouldBe` 11
