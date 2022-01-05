-- DeepSeq

-- seq: evaluate to WHNF
-- deepseq: evaluate to NF

import           Control.DeepSeq

main1 :: IO ()
main1 = do
  let a = [1 .. 10] :: [Int]
  -- :sprint a => a = _
  let _ = seq a ()
  -- :sprint a => a = 1 : _
  let _ = deepseq a ()
  -- :sprint a => a = [1,2,3,4,5,6,7,8,9,10]

  return ()

-- Defining NFData for custom types

-- Peano

data Peano = Zero | Succ Peano deriving Show

add :: Peano -> Peano -> Peano
add Zero     a = a
add (Succ a) b = Succ (add a b)

five :: Peano
five = Succ $ Succ $ Succ $ Succ $ Succ Zero

instance NFData Peano where
  rnf Zero     = ()
  rnf (Succ a) = rnf a

-- Tree

data Tree a = Leaf | Node (Tree a) a (Tree a) deriving Show

insert :: Ord a => Tree a -> a -> Tree a
insert Leaf x = Node Leaf x Leaf
insert (Node l y r) x | x <= y    = Node (insert l x) y r
                      | otherwise = Node l y (insert r x)

t = foldl insert Leaf [1 .. 5]

instance NFData a => NFData (Tree a) where
  rnf Leaf         = ()
  rnf (Node l x r) = rnf l `seq` rnf r `seq` rnf x

main :: IO ()
main = do
  main1
