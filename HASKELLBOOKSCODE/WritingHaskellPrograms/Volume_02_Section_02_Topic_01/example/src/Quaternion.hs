------------------------------------------------------------
--
-- Quaternion.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Quaternion
    ( Quaternion (..)
    , qAdd
    , qMult
    , qNeg
    ) where

data Quaternion = Quaternion
    { qR :: Double
    , qI :: Double
    , qJ :: Double
    , qK :: Double
    } deriving (Eq, Show)

qAdd :: Quaternion -> Quaternion -> Quaternion
(Quaternion a1 b1 c1 d1) `qAdd` (Quaternion a2 b2 c2 d2) = Quaternion (a1 + a2) (b1 + b2) (c1 + c2) (d1 + d2)

qMult :: Quaternion -> Quaternion -> Quaternion
(Quaternion a1 b1 c1 d1) `qMult` (Quaternion a2 b2 c2 d2) = Quaternion
    (a1 * a2 - b1 * b2 - c1 * c2 - d1 * d2)
    (a1 * b2 + b1 * a2 + c1 * d2 - d1 * c2)
    (a1 * c2 - b1 * d2 + c1 * a2 + d1 * b2)
    (a1 * d2 + b1 * c2 - c1 * b2 + d1 * a2)

qNeg :: Quaternion -> Quaternion
qNeg (Quaternion a b c d) = Quaternion (-a) (-b) (-c) (-d)
