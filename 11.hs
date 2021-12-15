-- Exercise 1
-- Create a function rev that reverses a list.

rev :: [a] -> [a]
rev = foldl (flip (:)) [] -- flip (:) <=> \acc elem <- elem : acc

-- Exercise 2
-- Create a function prefixes that returns all
-- the prefixes of a given list.

prefixes :: [a] -> [[a]]
prefixes [] = []
prefixes (x : xs) = rev $ foldl (\acc elem -> let (p : ps) = acc in rev (elem : rev p) : acc) [[x]] xs

prefixes' xs = foldr (\x acc -> [x] : map (x :) acc) [] xs

-- Exercise 3

l :: [(Float, Float)] -> Float -> Float -> Float
l ps xj x = foldr (\xm m -> m * (x - xm) / (xj - xm)) 1 [xm | (xm, _) <- ps, xm /= xj]

lagrange :: [(Float, Float)] -> Float -> Float
lagrange ps x = foldr (\(xj, yj) s -> yj * l ps xj x + s) 0 ps

-- Main

main :: IO ()
main = do
  putStrLn $ "e1: rev [1, 2, 3] = " ++ show (rev [1, 2, 3])
  putStrLn $ "e2: prefixes [1, 2, 3] = " ++ show (prefixes [1, 2, 3])
  putStrLn $ "e2: lagrange [(1, 1), (2, 4), (3, 9)] 3 = " ++ show (lagrange [(1, 1), (2, 4), (3, 9)] 3)
