-- Folding
-- foldr :: (a -> b -> b) -> b -> [a] -> b

foldSum :: [Int] -> Int
foldSum xs = foldr (+) 0 xs

foldAnd :: [Bool] -> Bool
foldAnd xs = foldr (&&) True xs

foldOr :: [Bool] -> Bool
foldOr xs = foldr (||) False xs

-- foldr (\elem acc -> <expr>) <init> <list>

foldCount :: (Eq a) => a -> [a] -> Int
foldCount x = foldr (\elem acc -> if elem == x then acc + 1 else acc) 0

isAll :: (Eq a) => a -> [a] -> Bool
isAll e = foldr (\elem acc -> elem == e && acc) True

foldMap :: (a -> b) -> [a] -> [b]
foldMap f = foldr ((:) . f) []

-- foldl (\acc elem -> <expr>) <init> <list>
