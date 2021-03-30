------------------------------------------------------------
--
-- Internal.hs
-- Code sample accompanying topic 2.2.2 "Creating modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Internal
    ( MyBool (..)
    , Port ()
    , Truthy (..)
    , myAdd
    , mkPort
    , printTruthiness
    ) where

-- TCP/IP socket port
newtype Port = Port { unPort :: Int } deriving Show

mkPort :: Int -> Maybe Port
{-
mkPort x
    | x < 0 || x > 65535 = Nothing
    | otherwise = Just (Port x)
-}
mkPort x =
    if x < 0 || x > 65535
        then Nothing
        else Just (Port x)

data MyBool = MyTrue | MyFalse deriving (Eq, Show)

class Truthy a where
    isTruthy :: a -> Bool

instance Truthy MyBool where
    isTruthy MyTrue = True
    isTruthy _ = False

instance Truthy Bool where
    isTruthy True = True
    isTruthy _ = False

printTruthiness :: Truthy a => a -> IO ()
printTruthiness x = do
    let xIsTruthy = isTruthy x
    putStrLn $ "isTruthy=" ++ (show xIsTruthy)

myAdd :: Int -> Int -> Int
myAdd x y = x + y
