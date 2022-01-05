-- Reductions

-- Innermost reduction
-- fst :: (a, b) -> a

-- fst (square 3, square 4)
-- fst (3 * 3, square 4)
-- fst (9, square 4)
-- fst (9, 4 * 4)
-- fst (9, 16)
-- 9

-- Outermost reduction
-- fst :: (a, b) -> a

-- fst (square 3, square 4)
-- square 3
-- 3 * 3
-- 9

-- Lazy evaluation: outermost reduction + sharing

-- Normal form: an expression is in normal form
-- if and only if it is fully evaluated

-- Weak head normal form: an expression fully evaluated
-- up to at least the first data constructor.
-- To be in weak head normal form, the expression must have
-- one of the following forms:
-- 1. A data constructor
-- 2. A built-in function applied to too few arguments ((+) 2)
-- 3. A lambda expression (\x -> <expression>)


main :: IO ()
main = do
  let x = 1 + 2
  let y = x + 19
  -- :sprint x => x = _
  -- :sprint y => y = _
  print y
  -- :sprint y => y = 22
  -- :sprint x => x = 3

  let x'  = 1 + 2
  -- :sprint x' => x' = _
  let _   = seq x' ()
  -- :sprint x' => x' = 3
  let x'' = 1 + 2
  let a = (x'', x'' + 1)
  -- :sprint a => a = (_, _)
  let _ = seq a ()
  -- :sprint a => a = (_, _)
  let b = fst a
  -- :sprint a => a = (_, _)
  -- :sprint b => b = _
  let _ = seq b ()
  -- :sprint b => b = 3
  -- :sprint a => a = (3, _)
  return ()
