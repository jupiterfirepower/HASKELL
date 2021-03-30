------------------------------------------------------------
--
-- Main.hs
-- Code sample accompanying topic 3.2.2 "ADTs for command-line options"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Main (main) where

import           Options.Applicative

type ItemIndex = Int

data Options = Options FilePath ItemIndex deriving Show

defaultDataPath :: FilePath
defaultDataPath = "~/.to-do.yaml"

optionsParser :: Parser Options
optionsParser = Options
    <$> dataPathParser
    <*> itemIndexParser

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
    options <- execParser (info (optionsParser) (progDesc "To-do list manager"))
    putStrLn $ "options=" ++ show options
