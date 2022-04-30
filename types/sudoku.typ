true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3 :: mypos.

mypos :> mark.

4, 5, 6, 7, 8, 9, b :: mark.

0, 100 :: score.

cell :: mypos -> mypos -> mypos -> mypos -> mark -> prop.

mark :: mypos -> mypos -> mypos -> mypos -> mark -> action.

digit, filler :: mark -> bool.

index :: mypos -> bool.