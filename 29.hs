-- Semaphores (QSem, QSemN)

import           Control.Concurrent
import           Control.Monad
import           GHC.IO
import           System.IO

getGreeting :: IO String
getGreeting = do
  tid <- myThreadId
  let greeting = "Hello from " ++ show tid
  return $! greeting

threadHello :: QSem -> QSemN -> IO ()
threadHello mut endFlags = do
  greeting <- getGreeting
  waitQSem mut
  putStrLn greeting
  signalQSem mut
  signalQSemN endFlags 1

main1 :: IO ()
main1 = do
  hSetBuffering stdout NoBuffering
  let n = 10
  mut      <- newQSem 0
  endFlags <- newQSemN 0
  replicateM_ n $ forkIO $ threadHello mut endFlags
  signalQSem mut
  waitQSemN endFlags n

main :: IO ()
main = do
  main1
