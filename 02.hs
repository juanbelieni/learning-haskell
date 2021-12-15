-- Functions
-- name arg1 arg2 ... argN = <expression>

inRange min max x =
  min <= x && x <= max

-- Types
-- name :: <type>

-- Types for variables

x :: Int
x = 1

y :: Bool
y = True

z :: Float
z = 3.14159

-- Types for functions

inRangeTyped :: Int -> Int -> Int -> Bool
inRangeTyped min max x =
  min <= x && x <= max

-- Let binding

inRangeLet min max x =
  let in_lower_bound = x >= min
      in_upper_bound = x <= max
   in in_lower_bound && in_upper_bound

-- If .. then .. else

inRangeIf min max x =
  if ilb then iub else False
  where
    ilb = x >= min
    iub = x <= max

-- Infix notation
-- a `add` b <=> add a b

add a b = a + b

-- Main

main :: IO ()
main = do
  putStrLn $ "inRange 0 5 3 = " ++ show (inRange 0 5 3)
  putStrLn $ "inRange 4 5 3 = " ++ show (inRange 4 5 3)
  putStrLn $ "add 10 20 = " ++ show (add 10 20)
  putStrLn $ "10 `add` 20 = " ++ show (10 `add` 20)
