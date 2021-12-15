-- High order functions

app :: (a -> b) -> a -> b
app f x = f x

addOne :: Int -> Int
addOne x = x + 1

-- Anonymous functions
-- (\<args> -> <expr>)

addOne' :: Int -> Int
addOne' = \x -> x + 1

-- Higher order functions + anonymous functions

threeSquared = app (\x -> x * x) 3

-- Map
-- map :: (a -> b) -> [a] -> [b]

squares = map (\x -> x * x) [1..5]

-- Filter
-- filter :: (a -> Bool) -> [a] -> [a]

oddNumbers = filter odd [1..10]

nameVowels = filter (\x -> x `elem` "aeiou") "juan"

-- Main

main :: IO ()
main = do
  putStrLn $ "app addOne 3 = " ++ show (app addOne 3)
  putStrLn $ "app (\\x -> x * x) 3 = " ++ show threeSquared
  putStrLn $ "map (\\x -> x * x) [1..5] = " ++ show squares
  putStrLn $ "filter odd [1..10] = " ++ show oddNumbers
  putStrLn $ "filter (\\x -> x `elem` \"aeiou\") \"juan\" = " ++ show nameVowels
