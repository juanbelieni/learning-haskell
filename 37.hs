-- Arrows

import           Control.Arrow
import           Data.Char                      ( toUpper )

-- arr :: (b -> c) -> a b c
-- first :: a b c -> a (b, d) (c, d)
-- second :: a b c -> a (d, b) (d, c)
-- (***) :: a b c -> a b' c' -> a (b, b') (c, c')
-- (&&&) :: a b c -> a b c' -> a b (c, c')

a :: (Arrow a, Num c) => a c c
a = arr (+ 1)

b :: (Arrow a, Num c) => a c c
b = arr (* 2)

comb :: (Arrow a, Num c) => a (c, c) c
comb = arr $ uncurry (+)

c :: (Arrow cat, Num c) => cat c c
c = a &&& b >>> comb

printInput = putStrLn <$> getLine

newtype Kleisli' m a b = Kleisli' {runKleisli' :: a -> m b}

printInput' = runKleisli ka ()
  where ka = Kleisli (const getLine) >>> arr (map toUpper) >>> Kleisli putStrLn

---

listCase :: [a] -> Either () (a, [a])
listCase []       = Left ()
listCase (x : xs) = Right (x, xs)

mapA :: ArrowChoice a => a a1 a2 -> a [a1] [a2]
mapA f =
  arr listCase >>> arr (const []) ||| (f *** mapA f >>> arr (uncurry (:)))
