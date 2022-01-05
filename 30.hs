-- Software Transactional Memory (STM)

-- Can we synchronize concurrent processes without blocking?
-- Goal: atomicity of transactions of a shared resource without locks

import           Control.Concurrent
import           Control.Concurrent.STM
import           System.IO

-- (<Sum>, <Number of finished transactions>)
type Result = TVar (Int, Int)

-- Adds x to result and increments the number of finished transactions
addToResult :: Result -> Int -> STM ()
addToResult result x = do
  (sum, endCtr) <- readTVar result
  writeTVar result (sum + x, endCtr + 1)

-- Waits for the number of finished transactions to reach a limit
-- Then returns the sum of the result
waitForCounter :: Result -> Int -> STM Int
waitForCounter result limit = do
  (sum, endCtr) <- readTVar result
  if endCtr < limit then retry else return sum

main :: IO ()
main = do
  -- Number of threads to spawn
  let n = 100
  -- Set up TVar
  result <- newTVarIO (0, 0)
  -- Spawn threads
  mapM_ (forkIO . atomically . addToResult result) [1 .. n]
  -- Wait for threads to finish and get sum
  sum <- atomically $ waitForCounter result n
  -- Print sum
  putStrLn $ "Sum [1..n] = " ++ show sum
