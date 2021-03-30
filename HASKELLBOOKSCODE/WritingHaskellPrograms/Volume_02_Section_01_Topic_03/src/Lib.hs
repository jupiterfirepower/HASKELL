------------------------------------------------------------
--
-- Lib.hs
-- Code sample accompanying topic 2.1.3 "Stack in detail"
-- See README.md for details
--
-- Fundamentals of Practical Haskell Programming
-- By Richard Cook
--
------------------------------------------------------------

{-|
Module     : Lib
Description: An example of a documented library module
Copyright  : Copyright (C) 2017, Richard Cook
License    : MIT
Maintainer : rcook@rcook.org
Stability  : experimental
Portability: portable

Here is a longer description of this module containing some commentary with
@some markup@.
-}

module Lib
    (
    -- * Some functions
    myAdd
    ) where

-- * This heading appears before @myAdd@

-- | Evaluate sum of two @Int@ values
myAdd :: Int -- ^ the first value
      -> Int -- ^ the second value
      -> Int -- ^ the return value
myAdd x y = x + y
