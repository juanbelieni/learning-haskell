-- Semigroup & Monoid

-- Addition arithmetic
-- Domain: natural numbers (N)
-- Operations: addition (+ :: N -> N -> N)
-- Properties: associativity ((a + b) + c = a + (b + c))

-- Magma: a set S with a closed binary operation (◯)
-- ◯ :: S -> S -> S

-- Semigroup: an associative magma
-- (a ◯ b) ◯ c = a ◯ (b ◯ c)

-- class Semigroup a where
--   (<>) :: a -> a -> a

diamondList = [1, 2, 3] <> [4, 5, 6] -- [1, 2, 3, 4, 5, 6]
diamondEither = Left 1 <> Left 2 -- Left 1

-- Monoid: a semigroup with an identity element (ε)
-- ε ◯ a = a = a ◯ ε

-- Class Semigroup a => Monoid a where
--   mempty :: a
--   mappend :: a -> a -> a
--   mconcat :: [a] -> a
--   {-# MINIMAL mempty #-}

-- Right identity: x <> mempty = x
-- Left identity: mempty <> x = x
-- Associativity: (x <> y) <> z = x <> (y <> z)
-- Concatenation: mconcat = foldr (<>) mempty

-- instance Monoid [a] where
--   mempty = []
--   mconcat xss = [x | xs <- xss, x <- xs]
