--   Type     Constructor         Constructor 
data Record = Statistics Int Int | Word String
            deriving (Show, Read, Eq)

isWord :: Record -> Bool
isWord (Word _) = True
isWord _ = False

leftNumber :: Record -> Int
leftNumber (Statistics left _) = left
-- Tryner med Word

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
