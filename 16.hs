-- Type inference

add x y z = (x + y) : z

-- 1. Assign every variable a unique type variable

-- x :: a
-- y :: b
-- z :: c

-- 2. Assign every function its type with new unique type variables

-- (+) :: (Num d) => d -> d -> d
-- (:) :: e -> [e] -> [e]

--- 3. For each sub-expression of the expression, generate equations of types.

-- from (x + y) derive a = d and b = d
-- from (x : y) : z derive c = [e] and e = d

-- 4. Resolve the equations until no further simplifications can be done.
-- Conflicting types imply a type error otherwise the type has been inferred.

-- x ::  d
-- y ::  d
-- z :: [d]

add :: Num d => d -> d -> [d] -> [d]
