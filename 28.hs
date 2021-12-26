-- Concurrency & Threads

import Control.Concurrent
import System.IO

-- forkIO :: IO () -> IO ThreadId

forkingPrint :: IO ()
forkingPrint = do
  forkIO $ print "Hello"
  print "World"

-- MVar: mutable locations that can be shared between threads.
-- Actions on MVars are atomic.

-- newEmptyMVar :: IO (MVar a)
-- newMVar :: a -> IO (MVar a)
-- takeMVar :: MVar a -> IO a -- blocks until there is a value
-- putMVar :: MVar a -> a -> IO () -- blocks until there is a place to put a value

putAPlusB :: Int -> Int -> MVar Int -> IO ()
putAPlusB a b mv = do
  putMVar mv $! a + b

main1 :: IO ()
main1 = do
  mv <- newEmptyMVar
  forkIO $ putAPlusB 1 2 mv
  result <- takeMVar mv
  print result

-- Chan: are shared FIFO queues implemented with MVars.

-- newChan :: IO (Chan a)
-- writeChan :: Chan a -> a -> IO ()
-- readChan :: Chan a -> IO a

getGreeting :: IO String
getGreeting = do
  tid <- myThreadId
  let greeting = "Hello from " ++ show tid
  return $! greeting

threadHello :: MVar () -> Chan () -> IO ()
threadHello mut endFlags = do
  greeting <- getGreeting
  takeMVar mut
  putStrLn greeting
  putMVar mut ()
  writeChan endFlags ()

main2 :: IO ()
main2 = do
  endFlags <- newChan
  mut <- newEmptyMVar
  forkIO $ threadHello mut endFlags
  forkIO $ threadHello mut endFlags
  forkIO $ threadHello mut endFlags
  forkIO $ threadHello mut endFlags
  forkIO $ threadHello mut endFlags
  putMVar mut ()
  mapM_ (\_ -> readChan endFlags) [1 .. 5]

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  main1
  main2
