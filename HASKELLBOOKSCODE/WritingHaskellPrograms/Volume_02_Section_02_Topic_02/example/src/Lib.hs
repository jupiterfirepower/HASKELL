------------------------------------------------------------
--
-- Lib.hs
-- Code sample accompanying topic 2.2.2 "Creating modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Lib where

import Internal

data OtherBool = OtherTrue | OtherFalse

instance Truthy OtherBool where
    isTruthy OtherTrue = True
    isTruthy _ = False

someFunc :: IO ()
someFunc = do
    putStrLn $ "someFunc=" ++ show (myAdd 123 456)
    putStrLn $ "MyTrue=" ++ show MyTrue

    printTruthiness MyTrue
    printTruthiness True
    printTruthiness OtherFalse

    let p0 = mkPort 1234
        p1 = mkPort 12345678
    print p0
    print p1
