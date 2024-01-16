module Homework1.Test (testSuite) where

import Homework1.Ans (doubleEveryOther, hanoi, sumDigits, toDigits, toDigitsRev, validate)
import Test.HUnit

testToDigits :: Test
testToDigits =
  TestList
    [ TestCase $ do
        assertEqual "toDigits 0" [] $ toDigits 0
        assertEqual "toDigits -17" [] $ toDigits (-11)
        assertEqual "toDigits 1" [1] $ toDigits 1
        assertEqual "toDigits 1234" [1, 2, 3, 4] $ toDigits 1234
    ]

testToDigitsRev :: Test
testToDigitsRev =
  TestList
    [ TestCase $ do
        assertEqual "toDigits 0" [] $ toDigitsRev 0
        assertEqual "toDigits -17" [] $ toDigitsRev (-11)
        assertEqual "toDigits 1" [1] $ toDigitsRev 1
        assertEqual "toDigitsRev 1234" [4, 3, 2, 1] $ toDigitsRev 1234
    ]

testDoubleEveryOther :: Test
testDoubleEveryOther =
  TestList
    [ TestCase $ do
        assertEqual "doubleEveryOther [8, 7, 6, 5]" [16, 7, 12, 5] $ doubleEveryOther [8, 7, 6, 5]
        assertEqual "doubleEveryOther [1, 2, 3]" [1, 4, 3] $ doubleEveryOther [1, 2, 3]
    ]

testSumDigits :: Test
testSumDigits =
  TestList
    [ TestCase $ do
        assertEqual "sumDigits [16,7,12,5]" 22 $ sumDigits [16, 7, 12, 5]
    ]

testValidate :: Test
testValidate =
  TestList
    [ TestCase $ do
        assertEqual "validate 4012888888881881" True $ validate 4012888888881881
        assertEqual "validate 4012888888881882" False $ validate 4012888888881882
    ]

testHanoi :: Test
testHanoi =
  TestList
    [ TestCase $ do
        assertEqual "hanoi 2" [("a", "c"), ("a", "b"), ("c", "b")] $ hanoi 2 "a" "b" "c"
        assertEqual
          "hanoi 3"
          [("a", "b"), ("a", "c"), ("b", "c"), ("a", "b"), ("c", "a"), ("c", "b"), ("a", "b")]
          $ hanoi 3 "a" "b" "c"
    ]

testSuite :: Test
testSuite =
  TestList
    [testToDigits, testToDigitsRev, testDoubleEveryOther, testSumDigits, testValidate, testHanoi]
