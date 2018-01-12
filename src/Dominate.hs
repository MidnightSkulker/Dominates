{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleInstances #-}

module Dominate where

data Unclassified = Unclassified
data Confidential = Confidential
data Secret       = Secret
data TopSecret    = TopSecret

class Dominates a b where
  type Lattice a
  dominates :: Lattice a -> Lattice b -> Bool

instance Dominates Unclassified a where
  type Lattice Unclassified = Unclassified
  dominates Unclassified _ = True

instance Dominates TopSecret a where
  -- | TopSecret dominates everything
  type Lattice TopSecret = TopSecret
  dominates TopSecret _ = False
