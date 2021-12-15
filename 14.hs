import Data.Maybe (fromJust, fromMaybe, isJust)

-- Maybe
-- data Maybe a = Nothing | Just a

safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x / y)

-- Maybe functions
-- isJust :: Maybe a -> Bool
-- isJust Nothing = False
-- fromJust :: Maybe a -> a

threeOverTwo :: Maybe Double
threeOverTwo = safeDiv 3 2

threeOverZero :: Maybe Double
threeOverZero = safeDiv 3 0

-- fromMaybe :: a -> Maybe a -> a

nothing = Nothing

justEuler = Just 2.71828

value1 = fromMaybe 3.1415 nothing

value2 = fromMaybe 3.1415 justEuler

-- Main

main :: IO ()
main = do
  putStrLn $ "isJust threeOverTwo: " ++ show (isJust threeOverTwo)
  putStrLn $ "isJust threeOverZero: " ++ show (isJust threeOverZero)
  putStrLn $ "fromJust threeOverTwo: " ++ show (fromJust threeOverTwo)
  putStrLn $ "fromMaybe 3.1415 nothing: " ++ show value1
  putStrLn $ "fromMaybe 3.1415 justEuler: " ++ show value2
