module Homework1.Ans
  ( toDigits,
    toDigitsRev,
    doubleEveryOther,
    sumDigits,
    validate,
    hanoi,
  )
where

toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

toDigitsRev :: Integer -> [Integer]
toDigitsRev x
  | x <= 0 = []
  | otherwise = value : toDigitsRev nextX
  where
    nextX = div x 10
    value = mod x 10

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther l@(x : xs)
  | even $ length l = (x * 2) : doubleEveryOther xs
  | otherwise = x : doubleEveryOther xs
doubleEveryOther [] = []

sumDigits :: [Integer] -> Integer
sumDigits = foldr ((+) . sum . toDigitsRev) 0

validate :: Integer -> Bool
validate cardNumber = (sumDigits . doubleEveryOther . toDigits) cardNumber `mod` 10 == 0

type Peg = String

type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 source target _ = [(source, target)]
hanoi n source target auxiliary =
  hanoi (n - 1) source auxiliary target
    ++ [(source, target)]
    ++ hanoi (n - 1) auxiliary target source