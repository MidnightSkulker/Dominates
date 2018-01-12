{-#LANGUAGE GADTs, EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
module Main where

import RankN
import Dominate

-- Experiment with GADT
data Expr a where
  I :: Int -> Expr Int
  B :: Bool -> Expr Bool
  Add :: Expr Int -> Expr Int -> Expr Int
  Mul :: Expr Int -> Expr Int -> Expr Int
  Eq  :: Expr Int -> Expr Int -> Expr Bool

eval :: Expr a -> a
-- Your implementation here.
eval (I n) = n
eval (B b) = b
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2
eval (Eq  e1 e2) = eval e1 == eval e2

data Empty
data NonEmpty

data SafeList a b where
     Nil :: SafeList a Empty
     Cons:: a -> SafeList a b -> SafeList a NonEmpty

safeHead :: SafeList a NonEmpty -> a
safeHead (Cons x _) = x

greet :: String -> String
greet name = "Hello " ++ name ++ "!"

main :: IO ()
main = do
  putStrLn "hello world"
