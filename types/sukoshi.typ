true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

robot :: agent.

1, 2, 3 :: mypos.

mypos :> mark.

b :: mark.

0, 100 :: score.

cell :: mypos -> mypos -> mark -> prop.

mark :: mypos -> mypos -> mark -> action.

digit, index, filler :: mark -> bool.

