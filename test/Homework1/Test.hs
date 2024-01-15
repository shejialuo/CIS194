module Homework1.Test (testSuite) where

import Homework1.Ans (toDigits)
import Test.HUnit

testToDigits1 :: Test
testToDigits1 = TestCase (assertEqual "toDigits 0 should be []" [] $ toDigits 0)

testToDigits2 :: Test
testToDigits2 = TestCase (assertEqual "toDigits -17 should be []" [] $ toDigits (-17))

testSuite :: Test
testSuite =
  TestList
    [testToDigits1, testToDigits2]
