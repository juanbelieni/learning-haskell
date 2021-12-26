-- Environment

import System.Environment (getArgs, getProgName, lookupEnv)
import System.Exit (exitFailure, exitSuccess)

-- getProgName :: IO String
-- getArgs :: IO [String]
-- getEnvironment :: IO [(String, String)]
-- lookupEnv :: String -> IO (Maybe String)
-- withArgs :: [String] -> IO a -> IO a
-- withProgName :: String -> IO a -> IO a
-- data ExitCode = ExitSuccess | ExitFailure Int
-- exitWith :: ExitCode -> IO a
-- exitFailure :: IO a
-- exitSuccess :: IO a
-- die :: String -> IO a

printHelp = do
  progName <- getProgName
  putStrLn $ "Usage: " ++ progName ++ " [-h | --help | -v | --version] <greeting>"

printVersion = putStrLn "v1"

mainAct [] = do
  putStrLn "Need a greeting!"
  printHelp >> exitFailure
mainAct args = do
  let greeting = unwords args
  name <- lookupEnv "USER"
  putStrLn $ maybe "No user to greet!" (\n -> greeting ++ " " ++ n) name

main = do
  args <- getArgs
  case args of
    ["-h"] -> printHelp >> exitSuccess
    ["--help"] -> printHelp >> exitSuccess
    ["-v"] -> printVersion >> exitSuccess
    ["--version"] -> printVersion >> exitSuccess
    _ -> mainAct args
