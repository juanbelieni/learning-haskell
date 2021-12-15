-- Recursion
-- name <args> = ... name <args'>

fac n =
  if n <= 1
    then 1
    else n * fac (n - 1)

-- Guards

fac2 n
  | n <= 1 = 1
  | otherwise = n * fac2 (n - 1)

-- Pattern matching

fac3 0 = 1
fac3 n = n * fac3 (n - 1)

isZero 0 = True
isZero _ = False

-- Accumulators

fac4 n = aux n 1
  where
    aux 0 acc = acc
    aux n acc = aux (n - 1) (n * acc)
