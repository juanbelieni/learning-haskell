-- Either

import Data.Either

data SomeData = Left Int | Right String

data Either' a b = Left' a | Right' b

type SomeData' = Either' Int String

-- lefts :: [Either a b] -> [a]
-- rights :: [Either a b] -> [b]
-- isLeft :: Either a b -> Bool
-- isRight :: Either a b -> Bool
-- fromLeft :: a -> Either a b
-- fromRight :: b -> Either a b
-- either :: (a -> c) -> (b -> c) -> Either a b -> c

f = either (\l -> "Number") (\r -> r) -- <=> fromRight "Number"

-- partitionEithers :: [Either a b] -> ([a], [b])

-- Error handling with Either
