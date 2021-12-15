-- Infinite lists

ones = 1 : ones

naturals = 1 : map (+ 1) naturals -- Same as [1..]

squares = map (^ 2) [1..]

-- Fibonacci sequence

f 0 = 0
f 1 = 1
f n = f (n - 1) + f (n - 2)

fibs = map f [0..] -- Bad implementation

fibs' = 0 : 1 : zipWith (+) fibs' (tail fibs')

-- Main

main :: IO ()
main = do
  putStrLn $ "ones = " ++ show (take 10 ones)
  putStrLn $ "naturals = " ++ show (take 10 naturals)
  putStrLn $ "squares = " ++ show (take 10 squares)
  putStrLn $ "fibs = " ++ show (take 10 fibs')
