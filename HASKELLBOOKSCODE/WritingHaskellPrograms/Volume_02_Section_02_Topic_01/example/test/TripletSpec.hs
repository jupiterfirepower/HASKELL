------------------------------------------------------------
--
-- TripletSpec.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module TripletSpec (spec) where

import Test.Hspec
import Triplet

spec :: Spec
spec = do
    describe "Triplet components" $ do
        let t = Triplet 1 2 3
        it "tR should be first component" $ do
            tR t `shouldBe` 1
        it "tI should be second component" $ do
            tI t `shouldBe` 2
        it "tJ should be third component" $ do
            tJ t `shouldBe` 3

    describe "tAdd" $ do
        let t0 = Triplet 10 20 30
            t1 = Triplet 100 200 300
        it "should return sum" $ do
            t0 `tAdd` t1 `shouldBe` Triplet 110 220 330

    describe "tNeg" $ do
        let t = Triplet 1 2 3
        it "should return componentwise negation" $ do
            tNeg t `shouldBe` Triplet (-1) (-2) (-3)
