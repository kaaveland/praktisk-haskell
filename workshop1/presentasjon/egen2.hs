data Tree a =
  Leaf |
  Node { value :: a, left :: Tree a, right :: Tree a}
  deriving (Show, Eq)

-- Haskell genererer 'accessors' value, left, right
collect :: Tree a -> [a]
collect Leaf = []
collect t = [value t] ++
            collect (left t) ++
            collect (right t)

-- Sett verdi for node
setValue :: Tree a -> a -> Tree a
setValue Leaf v = Node v Leaf Leaf
setValue t v = t {value = v}
-- Oops, returnerer helt nytt tre
