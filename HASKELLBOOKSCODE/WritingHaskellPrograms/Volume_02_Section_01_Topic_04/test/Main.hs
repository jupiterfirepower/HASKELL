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
import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "myAdd" $ do
        it "should return 11 when I pass 5 and 6" $ do
            myAdd 5 6 `shouldBe` 11
