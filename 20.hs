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

-- Main

main :: IO ()
main = do
  checkEx1
