-- Exercise 1
-- Create a function elem that returns
-- True if an element is in a given list
-- and returns False otherwise.

e1Elem :: (Eq a) => a -> [a] -> Bool
e1Elem _ [] = False
e1Elem e (x : xs)
  | e == x = True
  | otherwise = e1Elem e xs

-- Exercise 2
-- Create a function nub that removes all duplicates
-- from a given list.

e2Nub :: (Eq a) => [a] -> [a]
e2Nub [] = []
e2Nub (x : xs)
  | x `elem` xs = e2Nub xs
  | otherwise = x : e2Nub xs

-- Exercise 3
-- Create a function isAsc that returns True if
-- the list given to it is a list of ascending order.

e3IsAsc :: [Int] -> Bool
e3IsAsc [] = True
e3IsAsc [_] = True
e3IsAsc (x : y : xs)
  | x <= y = e3IsAsc $ y : xs
  | otherwise = False

-- Exercise 4
-- Create a function hasPath that determines
-- if a path from one node to another exists
-- within a directed graph.

e4HasPath :: [(Int, Int)] -> Int -> Int -> Bool
e4HasPath [] a b = a == b
e4HasPath graph a b
  | a == b = True
  | otherwise =
    let graph' = [(x, y) | (x, y) <- graph, x == a]
    in or [e4HasPath graph y b | (x, y) <- graph']

-- Main

main :: IO ()
main = do
  putStrLn $ "e1: elem 1 [1, 2, 3] = " ++ show (e1Elem 1 [1, 2, 3])
  putStrLn $ "e1: elem 4 [1, 2, 3] = " ++ show (e1Elem 4 [1, 2, 3])
  putStrLn $ "e2: nub [1, 2, 3, 1, 2, 3] = " ++ show (e2Nub [1, 2, 3, 1, 2, 3])
  putStrLn $ "e2: nub [1, 2, 3] = " ++ show (e2Nub [1, 2, 3])
  putStrLn $ "e3: isAsc [1, 2, 3] = " ++ show (e3IsAsc [1, 2, 3])
  putStrLn $ "e3: isAsc [1, 2, 4, 3] = " ++ show (e3IsAsc [1, 2, 4, 3])
  putStrLn $ "e4: hasPath [(1, 2), (2, 3), (3, 4)] 1 4 = " ++ show (e4HasPath [(1, 2), (2, 3), (3, 4)] 1 4)
  putStrLn $ "e4: hasPath [(1, 2), (2, 3), (2, 4)] 3 4 = " ++ show (e4HasPath [(1, 2), (2, 3), (2, 4)] 3 4)
