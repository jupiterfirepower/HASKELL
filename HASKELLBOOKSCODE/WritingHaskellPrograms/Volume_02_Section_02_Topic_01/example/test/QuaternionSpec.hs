------------------------------------------------------------
--
-- QuaternionSpec.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module QuaternionSpec (spec) where

import Quaternion
import Test.Hspec

spec :: Spec
spec = do
    describe "Quaternion components" $ do
        let q = Quaternion 1 2 3 4
        it "qR should be first component" $ do
            qR q `shouldBe` 1
        it "qI should be second component" $ do
            qI q `shouldBe` 2
        it "qJ should be third component" $ do
            qJ q `shouldBe` 3
        it "qK should be fourth component" $ do
            qK q `shouldBe` 4

    describe "qAdd" $ do
        let q0 = Quaternion 10 20 30 40
            q1 = Quaternion 100 200 300 400
        it "should return sum" $ do
            q0 `qAdd` q1 `shouldBe` Quaternion 110 220 330 440

    describe "qMult" $ do
        let q0 = Quaternion 1 2 3 4
            q1 = Quaternion 2 3 4 5
        it "should return Hamiltonian product" $ do
            q0 `qMult` q1 `shouldBe` Quaternion (-36) 6 12 12

    describe "qNeg" $ do
        let q = Quaternion 1 2 3 4
        it "should return componentwise negation" $ do
            qNeg q `shouldBe` Quaternion (-1) (-2) (-3) (-4)
