true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> decad -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

agent :> cell_type.

blank :: cell_type.

cell :: mypos -> mypos -> cell_type -> prop.

index :: mypos -> bool.

mark :: cell_type -> bool.

score :: agent -> decad -> prop.

incr :: decad -> decad -> bool.

succ :: int -> int -> bool.

nex :: mypos -> mypos -> bool.

control :: agent -> prop.

step :: int -> prop.

move :: mypos -> mypos -> mypos -> mypos -> action.

jump :: mypos -> mypos -> mypos -> mypos -> mypos -> mypos -> action.

noop :: action.

doublet :: mypos -> mypos -> mypos -> mypos -> bool.

triplet :: mypos -> mypos -> mypos -> mypos -> mypos -> mypos -> bool.

distinctcell :: mypos -> mypos -> mypos -> mypos -> bool.

distinct, new :: mypos -> mypos -> bool.

horizontal, vertical, backslash, slash :: mypos -> mypos -> mypos -> mypos -> bool.

0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 :: decad.

1, 2, 3, 4, 5 :: mypos.

decad :> int.

mypos :> int.

6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29 :: int.

