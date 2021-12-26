import Data.Char (toLower)
import Data.List (isInfixOf)
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

getWords :: [String] -> IO [String]
getWords words = do
  putStr "> "
  word <- getLine
  if word == ""
    then return words
    else getWords (words ++ [word])

findWords :: [String] -> String -> ([String], [String])
findWords words text = go words text [] []
  where
    go [] _ found notFound = (found, notFound)
    go (word : words) text found notFound
      | map toLower word `isInfixOf` map toLower text = go words text (found ++ [word]) notFound
      | otherwise = go words text found (notFound ++ [word])

main = do
  hSetBuffering stdout NoBuffering
  putStrLn "Specify the words to search: "
  words <- getWords []
  putStr "File to search: "
  filePath <- getLine
  contents <- readFile filePath
  let (found, notFound) = findWords words contents
  mapM_ (putStrLn . (\w -> "\"" ++ w ++ "\" found")) found
  mapM_ (putStrLn . (\w -> "\"" ++ w ++ "\" NOT found")) notFound
