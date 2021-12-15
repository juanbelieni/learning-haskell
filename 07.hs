-- Currying
-- f :: a -> b -> c -> d <=> f :: a -> (b -> (c -> (d)))

add x y = x + y

add' x = \y -> x + y

add'' = \x -> \y -> x + y

-- Partial function application

partialAdd = \x -> \y -> x + y

partialAddOne = partialAdd 1 -- new function

doubleList = map (\x -> x * 2)
