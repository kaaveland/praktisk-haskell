thing :: Int
thing = 9

-- Funksjoner er verdier med typer som alt annet
addInts :: Int -> (Int -> Int)
addInts x y = x + y
-- Trenger ikke angi parametre, "point-free"
add2 :: Int -> Int
add2 = addInts 2 -- Funksjonskall

eleven :: Int
eleven = add2 thing
