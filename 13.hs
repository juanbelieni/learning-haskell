-- Type classes
-- (+) :: Num a => a -> a -> a
-- a has to have an instance of Num type classes

data Temperature = C Float | F Float

instance Eq Temperature where
  (==) (C m) (C n) = m == n
  (==) (F m) (F n) = m == n
  (==) (C c) (F f) = c * 1.8 + 32 == f
  (==) (F f) (C c) = c * 1.8 + 32 == f

-- Deriving type classes

data Temperature' = C' Float | F' Float
  deriving (Eq, Show)

-- Derived equality
-- (==) (C' m) (C' n) = m == n
-- (==) (F' m) (F' n) = m == n
-- (==) _ _ = False
