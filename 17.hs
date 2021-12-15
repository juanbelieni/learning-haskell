-- Monads

-- >>= (bind)
-- >>= :: Monad m => m a -> (a -> m b) -> m b

maybeAdd :: Num a => Maybe a -> a -> Maybe a
maybeAdd mx y = mx >>= \x -> Just $ x + y

maybeAdd' :: Num a => Maybe a -> Maybe a -> Maybe a
maybeAdd' mx my = mx >>= \x -> my >>= \y -> Just $ x + y

monAdd :: (Monad m, Num a) => m a -> m a -> m a
monAdd mx my = mx >>= \x -> my >>= \y -> return $ x + y

monAdd' :: (Monad m, Num a) => m a -> m a -> m a
monAdd' mx my = do
  x <- mx
  y <- my
  return $ x + y

-- Maybe monad

-- instance Monad Maybe where
--   return x = Just x
--   Nothing >>= _ = Nothing
--   Just x >>= f = f x

-- >>
-- >> :: Monad m => m a -> m b -> m b
-- m >> n = m >>= \_ -> n

-- Monad laws

-- Left identity: return a >>= f = f a
-- Right identity: m >>= return = m
-- Associativity: (m >>= f) >>= g = m >>= (\x -> f x >>= g)

-- Main

main :: IO ()
main = do
  putStrLn $ "maybeAdd Nothing 1 = " ++ show (maybeAdd Nothing 1)
  putStrLn $ "maybeAdd (Just 1) 1 = " ++ show (maybeAdd (Just 1) 1)
  putStrLn $ "maybeAdd' Nothing (Just 1) = " ++ show (maybeAdd' Nothing (Just 1))
  putStrLn $ "maybeAdd' (Just 1) (Just 1) = " ++ show (maybeAdd' (Just 1) (Just 1))
  putStrLn $ "Nothing >> Just 1 = " ++ show (Nothing >> Just 1)
  putStrLn $ "Just 1 >> Just 2 = " ++ show (Just 1 >> Just 2)
  putStrLn "Just 1 >> Nothing = (error)"
