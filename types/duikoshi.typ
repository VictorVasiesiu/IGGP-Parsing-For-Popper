true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

red, green :: agent.

0, 50, 100 :: score.

1, 2, 3, 4 :: mypos.

mypos :> cell_type.

b :: cell_type.

cell :: mypos -> mypos -> cell_type -> prop.

control :: agent -> prop.

mark :: mypos -> mypos -> mypos -> action.

noop :: action.

filler :: cell_type -> bool.

index :: mypos -> bool.



