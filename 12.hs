-- Records

data Person = Person
  { name :: String,
    age :: Int
  }

greet :: Person -> String
greet person = "Hello, " ++ name person ++ "!"

greet' :: Person -> String
greet' (Person name _) = "Hello, " ++ name ++ "!"

data Point
  = D2 {x :: Double, y :: Double}
  | D3 {x :: Double, y :: Double, z :: Double}


-- Main

main :: IO ()
main = do
  putStrLn $ "greet (Person \"John\" 21) = " ++ greet (Person "John" 21)
  putStrLn $ "x (D2 1 2) = " ++ show (x (D2 1 2))
  putStrLn $ "x (D3 1 2 3) = " ++ show (x (D3 1 2 3))
