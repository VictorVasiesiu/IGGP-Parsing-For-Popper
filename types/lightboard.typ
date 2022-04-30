true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: mypos.

mypos :> int.

0, 9, 100 :: int.

on :: mypos -> mypos -> prop.

step :: int -> prop.

toggle :: mypos -> mypos -> action.

index :: mypos -> bool.

successor :: int -> int -> bool.
