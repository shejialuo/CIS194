module Homework1.Ans
  ( toDigits,
  )
where

toDigits :: Integer -> [Integer]
toDigits x
  | x <= 0 = []
  | otherwise = value : toDigits nextX
  where
    nextX = div x 10
    value = mod x 10
