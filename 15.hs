import Control.Monad (when)
import Data.Char (toUpper)

-- IO

helloWorld = putStrLn "Hello, world!"

-- getLine :: IO String

greet :: IO ()
greet = do
  putStrLn "What is your name?"
  name <- getLine
  let uname = map toUpper name
  putStrLn $ "Hello, " ++ uname ++ "!"

-- Main

main :: IO ()
main = do
  helloWorld
  greet
  i <- getLine
  when (i /= "quit") $ do
    putStrLn $ "Input: " ++ i
    main
  putStrLn "Bye!"
  return ()
