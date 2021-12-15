-- Data types
-- data Name = Constructor1 <args1> | Constructor2 <args2> | ...

data Color
  = Red
  | Green
  | Blue

data Calculation
  = Add Int Int
  | Sub Int Int
  | Mul Int Int
  | Div Int Int

calc :: Calculation -> Int
calc (Add x y) = x + y
calc (Sub x y) = x - y
calc (Mul x y) = x * y
calc (Div x y) = x `div` y

data Natural
  = Zero
  | Succ Natural

four :: Natural
four = Succ $ Succ $ Succ $ Succ Zero

incr :: Natural -> Natural
incr = Succ

decr :: Natural -> Natural
decr Zero = Zero
decr (Succ n) = n

add :: Natural -> Natural -> Natural
add Zero n = n
add (Succ n) m = Succ $ add n m

sum :: [Natural] -> Natural
sum [] = Zero
sum (n:ns) = foldr add n ns

toInt :: Natural -> Int
toInt Zero = 0
toInt (Succ n) = 1 + toInt n

data Tree a
  = Leaf
  | Node (Tree a) a (Tree a)

tree :: Tree Int
tree = Node (Node Leaf 1 Leaf) 2 (Node (Node Leaf 3 Leaf) 4 Leaf)
