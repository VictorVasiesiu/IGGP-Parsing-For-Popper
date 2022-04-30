true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: mypos.

x, o, b :: cell_type.

0, 50, 100 :: score.

cell :: mypos -> mypos -> cell_type -> prop.

index :: mypos -> bool.

mark :: mypos -> mypos -> action.

noop :: action.

control :: agent -> prop.

succ :: mypos -> mypos -> bool.

