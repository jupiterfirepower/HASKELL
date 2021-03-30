------------------------------------------------------------
--
-- Triplet.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Triplet
    ( Triplet (..)
    , tAdd
    , tNeg
    ) where

data Triplet = Triplet
    { tR :: Double
    , tI :: Double
    , tJ :: Double
    } deriving (Eq, Show)

tAdd :: Triplet -> Triplet -> Triplet
(Triplet a1 b1 c1) `tAdd` (Triplet a2 b2 c2) = Triplet (a1 + a2) (b1 + b2) (c1 + c2)

tNeg :: Triplet -> Triplet
tNeg (Triplet a b c ) = Triplet (-a) (-b) (-c)
