{-# LANGUAGE InstanceSigs #-}

module Ch23 where

-- state is appropriate when you want to express your program in term so of
-- values that can potentially vary each evaluation step

import           Control.Applicative            (liftA3)
import           Control.Exception              (catch)
import           Control.Monad                  (replicateM)
import           Control.Monad.Trans.State.Lazy (State (..))
import qualified Control.Monad.Trans.State.Lazy as S
import qualified Data.DList                     as DL
import           System.Random

data Die =
    DieOne | DieTwo | DieThree | DieFour | DieFive | DieSix deriving (Eq, Show, Enum)

intToDie :: Int -> Die
intToDie n  | n > 0 && n <= 6   = [DieOne .. DieSix]!!(n-1) -- i didn't feel like typing all those cases, I admit the perf is shit here probably
            | otherwise         = error "got a non 1-6 integer"

rollDieThreeTimes :: (Die, Die, Die)
rollDieThreeTimes = do
    let s = mkStdGen 0
        (d1,s1) = randomR (1,6) s
        (d2,s2) = randomR (1,6) s1
        (d3,_) = randomR (1,6) s2
    (intToDie d1, intToDie d2, intToDie d3)

-- those code is deterministic, produces same results
-- round 2

-- newtype State s a = State { runState :: s -> (a, s) }

rollDie :: State StdGen Die
rollDie = S.state $ do
    (n, s) <- randomR (1, 6)
    return (intToDie n, s)

-- or less verbosely,
rollDie' :: State StdGen Die
rollDie' = intToDie <$> S.state (randomR (1,6))

rollDieThrice :: State StdGen (Die, Die, Die)
rollDieThrice = liftA3 (,,) rollDie rollDie rollDie

-- evalState rollDieThrice (mkStdGen 0)

-- list of die   use repeat :: a -> [a]

infDie :: State StdGen [Die]
infDie = repeat <$> rollDie' -- repeats the same die value, instead of producing a new one

-- we need replicateM :: Monad m => Int -> m a -> m [a]
nDie :: Int -> State StdGen [Die]
nDie n = replicateM n rollDie'

rollsToGetTwenty :: StdGen -> Int
rollsToGetTwenty g = go 0 0 20 g

-- instead of feeding it a constant value, we can give it a value from randomIO

-- randomIO :: Random a => IO a
-- rollsToGetTwenty $ mkStdGen 0 :: Int
-- so we need to lift the Int into the IO context to get a value

-- (\x -> rollsToGetTwenty $ mkStdGen x) <$> randomIO
-- (rollsToGetTwenty . mkStdGen) <$> randomIO

rollsToGetN :: Int -> StdGen -> Int
rollsToGetN limit g = go 0 0 limit g

-- rollsCountLogged :: Int -> StdGen -> (Int, [Die])
-- rollsCountLogged limit g = giggity 0 0 g
--     where giggity :: Int -> Int -> StdGen -> (Int, [Die])
--           giggity sum count gen
--             | sum >= limit = count
--             | otherwise =
--                 let (die, nextGen) = randomR (1,6) gen
--                 in giggity (sum+die) (count+1) nextGen

go :: Int -> Int -> Int -> StdGen -> Int
go sum count lim gen
    | sum >= lim = count
    | otherwise =
        let (die, nextGen) = randomR (1,6) gen
        in go (sum+die) (count+1) lim nextGen

newtype Moi s a = Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
    fmap :: (a -> b) -> Moi s a -> Moi s b
    fmap f (Moi g) = Moi (\s -> let (a, b) = g s in (f a, b))

instance Applicative (Moi s) where
    pure :: a -> Moi s a
    pure a = Moi $ \s -> (a, s)

    (<*>) :: Moi s (a -> b) -> Moi s a -> Moi s b
    Moi f <*> Moi g = Moi (\s ->
        let (fab, s') = f s
            (a, s'') = g s'
        in  (fab a, s''))

instance Monad (Moi s) where
    return = pure

    (>>=) :: Moi s a -> (a -> Moi s b) -> Moi s b
    Moi f >>= g = Moi (\s ->
        let (a, s') = f s
            Moi a' = g a
        in a' s')


fizzbuzz :: Integer -> String
fizzbuzz n  | n `mod` 15 == 0   = "Fizzbuzz"
            | n `mod` 5 == 0    = "Buzz"
            | n `mod` 3 == 0    = "Fizz"
            | otherwise         = show n

runfizz :: IO ()
runfizz = mapM_ (\x -> putStrLn $ fizzbuzz x) [1..100] -- traverse

fizzbuzzlist :: [Integer] -> [String]
fizzbuzzlist list = S.execState (mapM_ addResult list) []

addResult :: Integer -> State [String] () -- note State is an alias of StateT that we imported earlier
addResult n = do
    xs <- S.get
    let result = fizzbuzz n
    S.put (result : xs)

runrev :: IO ()
runrev = mapM_ putStrLn $ reverse $ fizzbuzzlist [1..100]


-- with DList

fizzbuzzdlist :: [Integer] -> DL.DList String
fizzbuzzdlist list = S.execState (mapM_ addDResult list) DL.empty

addDResult :: Integer -> State (DL.DList String) () -- note State is an alias of StateT that we imported earlier
addDResult n = do
    xs <- S.get
    let result = fizzbuzz n
    S.put (DL.snoc xs result) -- snoc adds to end

runDL = mapM_ putStrLn $ fizzbuzzdlist [1..100]
