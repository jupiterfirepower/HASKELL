------------------------------------------------------------
--
-- TaggyDemo.hs
-- Code sample accompanying topic 2.3.3 "Navigating packages"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

{-# LANGUAGE OverloadedStrings #-}

module TaggyDemo (colours) where

import           Data.Maybe
import qualified Data.Text.Lazy as Lazy
import           Data.Text (Text, unpack)
import           Text.Taggy

colours :: String -> [String]
colours h =
    let tags = taggyWith True (Lazy.pack h)
    in map unpack $
        catMaybes $
        map maybeTagText $
        takeWhile (not . isTagClose2 "ul") $
        dropWhile (not . isTagOpen2 "ul") tags

isTagClose2 :: Text -> Tag -> Bool
isTagClose2 name tag = isTagClose tag && tname tag == name

isTagOpen2 :: Text -> Tag -> Bool
isTagOpen2 name tag = isTagOpen tag && tname tag == name

maybeTagText :: Tag -> Maybe Text
maybeTagText (TagText s) = Just s
maybeTagText _ = Nothing
