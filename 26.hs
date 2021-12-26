import Data.List (foldl')
-- Thunks

f a b = if even a then a else b

-- f (1 + 1) (2 + 1)
-- if even (1 + 1) then (1 + 1) else (2 + 1)
-- if even (2) then (2) else (2 + 1)
-- if True then (2) else (2 + 1)
-- 2

factors n = [x | x <- [2 .. n -1], n `mod` x == 0]
isPrime n = n > 1 && null (factors n)

-- Here, if the number isn't prime, then `factors n` will
-- not be entirely calculated.

sumOneToThree = foldl (+) 0 [1, 2, 3]

-- sumOneToThree
-- foldl (+) 0 [1, 2, 3]
-- foldl (+) (0 + 1) [2, 3]
-- foldl (+) ((0 + 1) + 2) [3]
-- foldl (+) (((0 + 1) + 2) + 3) []
-- (((0 + 1) + 2) + 3)
-- (1 + 2) + 3
-- 3 + 3
-- 6

sumOneToThree' = foldl' (+) 0 [1, 2, 3]

-- sumOneToThree'
-- foldl' (+) 0 [1, 2, 3]
-- foldl' (+) (1) [2, 3]
-- foldl' (+) (3) [3]
-- foldl' (+) (6) []
-- 6

-- Strictness
-- seq :: a -> b -> b
-- seq a b = b
-- seq is strict in its first argument.

-- ($!) :: (a -> b) -> a -> b
-- f $! x = x `seq` f x

