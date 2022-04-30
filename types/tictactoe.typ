true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

white, black :: agent.

x, o, b :: mark.

1, 2, 3 :: mypos.

0, 50, 100 :: score.

cell :: mypos -> mypos -> mark -> prop.

control :: agent -> prop.

mark :: mypos -> mypos -> action.

noop :: action.

index :: mypos -> bool.