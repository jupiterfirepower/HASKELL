------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 3.2.1 "The applicative way"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import           Options.Applicative

type ItemIndex = Int

itemIndexParser :: Parser ItemIndex
itemIndexParser = argument auto (metavar "ITEMINDEX" <> help "index of item")

main :: IO ()
main = do
    itemIndex <- execParser (info (itemIndexParser) (progDesc "To-do list manager"))
    putStrLn $ "itemIndex=" ++ show itemIndex
