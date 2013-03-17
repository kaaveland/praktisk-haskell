-- Dette er en kommentar
module Main -- module Main blir en executable
       (main) -- eksporterte symboler her
where -- Definisjoner
  main :: IO () -- Frivillig type-deklarasjon
  main = putStrLn "Hello, World!"
