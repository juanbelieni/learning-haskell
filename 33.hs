-- Parallelism

import           Control.Parallel.Strategies
import           Data.List                      ( foldl' )

-- Eval monad:
-- - a computational unit
-- - can be parallel or sequential
-- - evaluation managed by the RTS

-- type Strategy a = a -> Eval a
-- rpar :: Strategy a
-- rseq :: Strategy a
-- rdeepseq :: NFData a => Strategy a
-- runEval :: Eval a -> a

-- Fibonacci

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

n1 = 30
n2 = 35

main1 :: IO ()
main1 = do
  let a = fib n1
      b = fib n2
  print (a, b)

main2 :: IO ()
main2 = do
  let (a, b) = runEval $ do
        a <- rpar $ fib n1
        b <- rpar $ fib n2
        rseq a
        rseq b
        return (a, b)
  print (a, b)

-- Numerical integration

integral :: (Ord a, Floating a) => (a -> a) -> a -> a -> a -> a
integral f step start end = if start >= end then 0 else quad + rint
 where
  a    = start
  b    = min (start + step) end
  quad = (b - a) * f ((a + b) / 2)
  rint = integral f step b end

f x = sin x + cos x + sinh x + cosh x

main3 :: IO ()
main3 = do
  print $ integral f 0.000001 0 (2 * pi)

integral' :: (Ord a, Floating a) => (a -> a) -> a -> a -> a -> a
integral' f step start end = foldl' (+) 0 quads
 where
  steps = stepList step start end
  quads = map (\(a, b) -> (b - a) * f ((a + b) / 2)) steps

stepList :: (Ord a, Floating a) => a -> a -> a -> [(a, a)]
stepList stepLength start end | start >= end = []
                              | otherwise    = step : rest
 where
  a    = start
  b    = min (start + stepLength) end
  step = (a, b)
  rest = stepList stepLength b end

main4 :: IO ()
main4 = do
  print $ integral' f 0.000001 0 (2 * pi)

integral'' :: (Ord a, Floating a) => (a -> a) -> a -> a -> a -> a
integral'' f step start end = foldl' (+) 0 quads
 where
  steps = stepList step start end
  quads =
    map (\(a, b) -> (b - a) * f ((a + b) / 2)) steps `using` parBuffer 100 rseq

main5 :: IO ()
main5 = do
  print $ integral'' f 0.000001 0 (2 * pi)

main :: IO ()
main = do
  main1
  main2
  main3
  main4
  main5
