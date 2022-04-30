true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

1, 2, 3, 4, 5, 6, 7 :: mypos.

mypos :> score.

0, 50, 100 :: score.

score :> int.

8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91 :: int.

whitedisk, whitepawn, whitechecker, whiteknight, blackdisk, blackpawn, blackchecker, blackknight :: piece.

cell :: mypos -> mypos -> piece -> prop.

control :: agent -> prop.

step :: int -> prop.

drop :: mypos -> action.

pawnmove, knightmove, checkermove :: mypos -> mypos -> mypos -> mypos -> action.

jump :: mypos -> mypos -> mypos -> mypos -> mypos -> mypos -> action.

noop :: action.

active :: piece -> mypos -> mypos -> bool.

chute :: mypos -> bool.

diagonal, distinctcell, ell, orthogonal :: mypos -> mypos -> mypos -> mypos -> bool.

evenidx, oddidx, index :: mypos -> bool.

oddsquare, onboard :: mypos -> mypos -> bool.

jumpable :: mypos -> mypos -> mypos -> mypos -> mypos -> mypos -> bool.

plus1, plus2, succ :: int -> int -> bool.

checker, disk, knight, pawn :: piece_type.

piece :: piece -> piece_type -> agent -> bool.

rotation :: agent -> agent -> bool.

start :: piece -> mypos -> mypos -> bool.

