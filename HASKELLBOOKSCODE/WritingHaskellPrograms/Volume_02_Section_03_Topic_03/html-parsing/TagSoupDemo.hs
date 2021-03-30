------------------------------------------------------------
--
-- TagSoupDemo.hs
-- Code sample accompanying topic 2.3.3 "Navigating packages"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module TagSoupDemo (colours) where

import           Data.Maybe
import           Data.String.Utils
import           Text.HTML.TagSoup

colours :: String -> [String]
colours h =
    let tags = parseTags h
    in filter (not . null) $
        map strip $
        catMaybes $
        map maybeTagText $
        takeWhile (~/= "</ul>") $
        dropWhile (~/= "<ul>") tags
