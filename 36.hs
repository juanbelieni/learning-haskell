-- Category theory (functor, applicative, monad)

-- obj(C) := class of objects
-- hom(C) := class of morphisms
-- C(a, b) := all morphisms from a to b
-- Composition of morphisms:
-- - h ◯ f ◯ g = h ◯ (f ◯ g) = (h ◯ f) ◯ g
-- - f ◯ 1 = 1 ◯ f = f

-- Set, the category of sets
-- obj(Set) := all sets
-- hom(Set) := total functions
-- Set(a, b) := every total function from a to b

-- Functors: mapping morphisms from one category to another

-- class Functor (f :: * -> *) where
--   fmap :: (a -> b) -> f a -> f b
--   (<$) :: a -> f b -> f a
--   {-# MINIMAL fmap #-}

-- Example: Maybe Int -> Maybe Float

toFloat :: Int -> Float
toFloat = fromIntegral

maybeFloat = fmap toFloat (Just 10)

-- Example: [Int] -> [Float]
-- List map is a functor

mapToFloat :: [Int] -> [Float]
mapToFloat = fmap toFloat

-- Monoidal category
-- Category C, Functor ⊕

-- ⊕: C × C -> C (tensor product)
-- I: Identity object of obj(C)

-- Coherence conditions:
-- - α_{A, B, C} := (A ⊕ B) ⊕ C = A ⊕ (B ⊕ C)
-- - λ_A         := I ⊕ A = A
-- - ρ_A         := A ⊕ I = A

-- Set is a monoidal category: (Set, {1}, ✕)

cross :: a -> b -> (a, b)
cross = (,)

-- class Functor f => Monoidal f where
--   unit :: f ()
--   (**) :: f a -> f b -> f (a, b)

-- instance Monoidal [] where
--     unit = [()]
--     (**) as bs = [ (a, b) | a <- as, b <- bs ]

-- (<**>) :: Monoidal f => f (a -> b) -> f a -> f b
-- (<**>) mf mx = fmap (\(f, x) -> f x) (mf ** mx)

-- Applicatives: equivalent to lax monoidal functors

-- Example: get line and print

getLineAndPrint :: IO (IO ())
getLineAndPrint = do
  line <- getLine
  return (putStrLn line)

getLineAndPrint' :: IO (IO ())
getLineAndPrint' = fmap putStrLn getLine

getLineAndPrint'' :: IO (IO ())
getLineAndPrint'' = putStrLn <$> getLine

getTwoLinesAndPrint :: IO (IO ())
getTwoLinesAndPrint = putStrLn <$> ((++) <$> getLine <*> getLine)

-- Monad: a monoid in the category of endofunctors

data Maybe' a = Nothing' | Just' a

unit :: a -> Maybe' a
unit = Just'

join :: Maybe' (Maybe' a) -> Maybe' a
join Nothing'  = Nothing'
join (Just' m) = m

-- LAWS

-- Functors:
-- - fmap id = id (identity)
-- - fmap (f . g) = fmap f . fmap g (composition)

-- Applicatives:
-- - pure id <*> v = v (identity)
-- - pure f <*> pure x = pure (f x) (homomorphism)
-- - u <*> pure y = pure ($ y) <*> u (interchange)
-- - pure (.) <*> u <*> v = u <*> (pure ($ y) <*> v) (composition)

-- Monads:
-- - return a >>= f = f a (left identity)
-- - m >>= return = m (right identity)
-- - (m >>= f) >>= g = m >>= (\x -> f x >>= g) (associativity)
