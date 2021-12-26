-- Exercise 1

data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Show, Eq)

infTree :: Tree (Int, Int)
infTree = go (0, 0)
  where
    go (x, y) = Node (go (x + 1, y)) (x, y) (go (x, y + 1))

cut :: Int -> Tree a -> Tree a
cut 0 t = Leaf
cut n Leaf = Leaf
cut n (Node l x r) = Node (cut (n - 1) l) x (cut (n - 1) r)

checkEx1 = do
  putStrLn "-- Exercise 1 --"
  putStrLn $ "cut 0 infTree = " ++ show (cut 0 infTree)
  putStrLn $ "cut 1 infTree = " ++ show (cut 1 infTree)
  putStrLn $ "cut 2 infTree = " ++ show (cut 2 infTree)
  putStrLn $ "cut 3 infTree = " ++ show (cut 3 infTree)

-- Exercise 2

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Leaf = Node Leaf x Leaf
insert x (Node l y r)
  | x <= y = Node (insert x l) y r
  | otherwise = Node l y (insert x r)

inOrder :: Tree a -> [a]
inOrder Leaf = []
inOrder (Node l x r) = inOrder l ++ [x] ++ inOrder r

checkEx2 = do
  putStrLn "\n-- Exercise 2 --"
  putStrLn $ "insert 1 Leaf = " ++ show (insert 1 Leaf)
  let tree1 = Node (Node (Node Leaf 1 Leaf) 2 Leaf) 4 Leaf
  putStrLn $ "insert 3 tree1 = " ++ show (insert 3 tree1)
  let tree2 = Node (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)) 4 (Node Leaf 5 (Node Leaf 6 Leaf))
  putStrLn $ "inOrder tree2 = " ++ show (inOrder tree2)

-- Main

main :: IO ()
main = do
  checkEx1
  checkEx2
