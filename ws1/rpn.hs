module Main (main) where

import System.Environment

data Calculator a = Stack {stack :: [a]} deriving (Show, Read)

emptyStack :: Calculator a
emptyStack = Stack []

top :: Calculator a -> a
top c = head $ stack c

bot :: Calculator a -> [a]
bot c = tail $ stack c

push :: a -> Calculator a -> Calculator a
push e c = c { stack = e : stack c}

pop :: Calculator a -> (a, Calculator a)
pop c = (top c, Stack $ bot c)

runBinary :: (a -> a -> a) -> Calculator a -> Calculator a
runBinary op c = let (l, s) = pop c
                     (r, s') = pop s
                 in push (l `op` r) s'

runUnary :: (a -> a) -> Calculator a -> Calculator a
runUnary op c = let (n, s) = pop c
                in push (op n) s

logb :: Floating a => a -> a -> a
logb n b = (log n ) / (log b)

execute :: String -> Calculator Double -> Calculator Double
execute "+" = runBinary (+)
execute "-" = runBinary (-)
execute "*" = runBinary (*)
execute "/" = runBinary (/)
execute "^" = runBinary (**)
execute "sqrt" = runUnary sqrt
execute "ln" = runUnary log
execute "lg" = runUnary (flip logb 2)
execute "log" = runUnary (flip logb 10)
execute x = push (read x :: Double)

calc :: [String] -> Calculator Double -> IO ()
calc [] c = print $ top c
calc (x:xs) c = calc xs (execute x c)

main = do
  args <- getArgs
  calc args emptyStack
