-- QuickCheck

import Test.QuickCheck

prop :: Integer -> Integer -> Bool
prop a b = a + b == b + a

propQuickCheck = quickCheck prop

prop2 :: [Integer] -> Bool
prop2 xs = length (tail xs) == length xs - 1

prop2QuickCheck = quickCheck prop2

prop3 :: [Integer] -> Property
prop3 xs =
  not (null xs)
    ==> length (tail xs) == length xs - 1

prop3QuickCheck = quickCheck prop3

rev xs = go [] xs
  where
    go acc [] = acc
    go acc (x : xs) = go (x : acc) xs

propRev :: [Integer] -> Property
propRev xs = classify (null xs) "empty" $ rev xs === reverse xs

propRevQuickCheck = quickCheck (withMaxSuccess 1000 propRev)

prop4 k v m = lookup k ((k, v) : m) == Just v
  where types = (k :: Integer, v :: Integer)

prop4QuickCheck = quickCheck prop4

-- Main

main :: IO ()
main = do
  putStrLn "Running tests for prop"
  propQuickCheck
  putStrLn "Running tests for prop2"
  prop2QuickCheck
  putStrLn "Running tests for prop3"
  prop3QuickCheck
  putStrLn "Running tests for propRev"
  propRevQuickCheck
  putStrLn "Running tests for prop4"
  prop4QuickCheck
