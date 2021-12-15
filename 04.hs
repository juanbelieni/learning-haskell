-- Lists
-- [val1, val2, ...] :: [<type>]
-- val1 : val2 : ... : []

emptyList = []

oneToFive = [1, 2, 3, 4, 5]

oneToFive2 = 1 : 2 : 3 : 4 : 5 : []

oneToFive3 = [1 .. 5]

--- Generating a list

asc :: Int -> Int -> [Int]
asc a b
  | a > b = []
  | otherwise = a : asc (a + 1) b

-- Functions on lists

listHead = head oneToFive

listTail = tail oneToFive

listLength = length oneToFive

listInit = init oneToFive

listNull = null oneToFive

emptyListNull = null emptyList

-- List comprehension

doubleList = [x * 2 | x <- oneToFive]

doubleList2 = [x * 2 | x <- oneToFive, x > 2]

tupleList = [(x, y) | x <- [1, 2], y <- ['a', 'b']]

-- List patterns

getSum :: [Int] -> Int
getSum [] = 0
getSum (x : xs) = x + getSum xs

getEvens :: [Int] -> [Int]
getEvens [] = []
getEvens (x : xs)
  | even x = x : getEvens xs
  | otherwise = getEvens xs

-- Tuples
-- (val1, val2, ...) :: (<type1>, <type2>, ...)

xPos :: (Int, Int) -> Int
xPos (x, _) = x

yPos :: (Int, Int) -> Int
yPos (_, y) = y

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [x + y | (x, y) <- xs]

-- Main

main :: IO ()
main = do
  putStrLn $ "asc 1 3 = " ++ show (asc 1 3)
  putStrLn $ "head oneToFive = " ++ show listHead
  putStrLn $ "tail oneToFive = " ++ show listTail
  putStrLn $ "length oneToFive = " ++ show listLength
  putStrLn $ "init oneToFive = " ++ show listInit
  putStrLn $ "null oneToFive = " ++ show listNull
  putStrLn $ "null emptyList = " ++ show emptyListNull
  putStrLn $ "[x * 2 | x <- oneToFive] = " ++ show doubleList
  putStrLn $ "[x * 2 | x <- oneToFive, x > 2] = " ++ show doubleList2
  putStrLn $ "[(x, y) | x <- [1, 2], y <- ['a', 'b']] = " ++ show tupleList
  putStrLn $ "addTuples [(1, 2), (3, 4)] = " ++ show (addTuples [(1, 2), (3, 4)])
