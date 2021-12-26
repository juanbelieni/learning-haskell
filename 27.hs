-- Exceptions
-- Exceptions
import Control.Exception

-- Throwing
-- throw :: Exception e => e -> a

data MyException = ExceptionA | ExceptionB
  deriving (Show)

instance Exception MyException

throwExceptionA :: IO ()
throwExceptionA = throw ExceptionA

-- Catching
-- catch :: Exception e => IO a -> (e -> IO a) -> IO a

catchExceptionA :: IO ()
catchExceptionA = catch throwExceptionA handler
  where
    handler :: MyException -> IO ()
    handler ExceptionA = putStrLn "Caught ExceptionA"
    handler _ = putStrLn "Caught something else"

catchTwoExceptions :: IO ()
catchTwoExceptions =
  throwExceptionA
    `catch` handlerMyException
    `catch` handlerArithException
  where
    handlerMyException :: MyException -> IO ()
    handlerMyException ExceptionA = putStrLn "Caught ExceptionA"
    handlerMyException _ = putStrLn "Caught something else"

    handlerArithException :: ArithException -> IO ()
    handlerArithException _ = putStrLn "Caught ArithException"

catchTwoExceptions' :: IO ()
catchTwoExceptions' =
  throwExceptionA
    `catches` [ Handler handlerMyException,
                Handler handlerArithException
              ]
  where
    handlerMyException :: MyException -> IO ()
    handlerMyException ExceptionA = putStrLn "Caught ExceptionA"
    handlerMyException _ = putStrLn "Caught something else"

    handlerArithException :: ArithException -> IO ()
    handlerArithException _ = putStrLn "Caught ArithException"

-- try :: Exception e => IO a -> IO (Either e a)
-- tryJust :: Exception e => (e -> Maybe b) -> IO a -> IO (Either b a)
-- finally :: Exception e => IO a -> IO b -> IO a
