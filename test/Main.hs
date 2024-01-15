module Main (main) where

import Control.Monad
import Homework1.Test
import System.Exit
import Test.HUnit

allTests :: Test
allTests = TestList [Homework1.Test.testSuite]

main :: IO ()
main = do
  counts <- runTestTT allTests
  Control.Monad.when (failures counts > 0) exitFailure
