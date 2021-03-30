------------------------------------------------------------
--
-- ListeningAddress.hs
-- Code sample accompanying topic 2.2.2 "Creating modules"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

module Lib.ListeningAddress
    ( ListeningAddress (..)
    ) where

import Data.Word
import Lib.Port

data ListeningAddress = ListeningAddress Word8 Word8 Word8 Word8 Port deriving Show
