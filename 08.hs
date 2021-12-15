import Data.List (sort)

-- Composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g <=> \x -> f (g x)

descSort :: (Ord a) => [a] -> [a]
descSort = reverse . sort

map2d :: (a -> b) -> [[a]] -> [[b]]
map2d = map . map

-- Dollar sign ($)
-- ($) :: (a -> b) -> a -> b
-- f $ x <=> f x

f xs = map (+ 1) (filter (> 1) xs)

f' xs = map (+ 1) $ filter (> 1) xs
