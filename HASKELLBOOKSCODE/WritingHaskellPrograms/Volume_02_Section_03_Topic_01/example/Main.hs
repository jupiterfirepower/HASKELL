------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 2.3.1 "Package repositories"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import Data.Blockhash
import qualified Data.Vector.Unboxed as Vector
import LocalPackage

hash0 :: Hash
hash0 = Hash $ Vector.fromList "01234"

hash1 :: Hash
hash1 = Hash $ Vector.fromList "01235"

main :: IO ()
main = do
    localPackageFunc
    let d = hammingDistance hash0 hash1
    print d
