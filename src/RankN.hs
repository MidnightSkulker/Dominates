
{-#LANGUAGE GADTs, EmptyDataDecls #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeFamilies #-}

module RankN where

type IdFunc = forall a. a -> a
id' :: IdFunc
id' x = x

someInt :: IdFunc -> Integer
someInt id' = id' 3
