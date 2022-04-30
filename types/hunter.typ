true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3, 4, 5 :: mypos.

mypos :> int.

0, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 37, 40, 45, 50, 54, 60, 64, 70, 75, 80, 87, 90, 100 :: int.

knight, pawn, blank :: mark.

cell :: mypos -> mypos -> mark -> prop.

captures, step :: int -> prop.

move :: mypos -> mypos -> mypos -> mypos -> action.

add1col :: mypos -> mypos -> bool.

col, row :: mypos -> bool.

knightmove :: mypos -> mypos -> mypos -> mypos -> bool.

piece :: mark -> bool.

scoremap, succ, addrow, add1row, add2row, add2col :: int -> int -> bool.