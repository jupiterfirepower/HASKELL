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

-- This is now an "umbrella" module
module Lib
    ( module Lib.Port
    , module Lib.ListeningAddress
    ) where

import Lib.Port
import Lib.ListeningAddress
