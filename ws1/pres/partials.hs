-- a kan vare alt som er et tall
double :: Num a => a -> a
double = (* 2) -- partial applikasjon av *

-- Med lister
doubleAll :: Num a => [a] -> [a]
doubleAll = map double
-- eller doubleAll xs = map double xs

-- elementvis minste element av to lister av elementer
smallestItems :: Ord a => [a] -> [a] -> [a]
smallestItems = zipWith (<)

-- Kan legge flere restriksjoner
silly :: (Num a, Ord a, Show a) -> a ->  IO a
-- Num a impliserer Ord a og Show a...
