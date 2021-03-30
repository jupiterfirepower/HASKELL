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

defaultDataPath :: FilePath
defaultDataPath = "~/.to-do.yaml"

dataPathParser :: Parser FilePath
dataPathParser =  strOption $
    value defaultDataPath
    <> long "data-path"
    <> short 'p'
    <> metavar "DATAPATH"
    <> help ("path to data file (default " ++ defaultDataPath ++ ")")

itemIndexParser :: Parser ItemIndex
itemIndexParser = argument auto (metavar "ITEMINDEX" <> help "index of item")

main :: IO ()
main = do
    dataPath <- execParser (info (dataPathParser) (progDesc "To-do list manager"))
    putStrLn $ "dataPath=" ++ show dataPath

    --itemIndex <- execParser (info (itemIndexParser) (progDesc "To-do list manager"))
    --putStrLn $ "itemIndex=" ++ show itemIndex
