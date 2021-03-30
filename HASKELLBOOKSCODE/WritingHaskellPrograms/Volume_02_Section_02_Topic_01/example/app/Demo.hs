------------------------------------------------------------
--
-- Demo.hs
-- Code sample accompanying topic 2.2.1 "Introduction to modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Demo (demo) where

import Quaternion
import Triplet

demo :: IO ()
demo = do
    let q0 = Quaternion 1 2 3 4
        q1 = Quaternion 2 3 4 5
        q2 = q0 `qAdd` q1
        t0 = Triplet 1 2 3
        t1 = Triplet 2 3 4
        t2 = t0 `tAdd` t1
    print q0
    print q1
    print q2
    print t0
    print t1
    print t2
