data Perhaps a = Really a | Nope
               deriving (Show, Eq, Ord)

instance Monad Perhaps where
  return = Really
  (>>=) Nope _ = Nope
  (>>=) (Really x) f = f x

instance Functor Perhaps where
  fmap _ Nope = Nope
  fmap f (Really x) = Really (f x)
