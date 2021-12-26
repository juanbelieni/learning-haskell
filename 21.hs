-- Defining data types

-- data

data RGB = Red | Green | Blue

-- type

type Color = (Int, Int, Int)

type Palette = [Color]

-- newtype: like data, but with a single constructor and a single field
-- The new type and the type of the field are in direct correspondence (isomorphic)
-- New types is checked at compile time, yet ignored at runtime
-- (no work done when pattern matching)

newtype Name = Name String
