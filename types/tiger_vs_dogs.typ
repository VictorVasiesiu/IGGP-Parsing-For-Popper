true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

d, t :: agent.

agent :> mark.
b :: mark.

1, 2, 3, 4, 5 :: mypos.

0, 100 :: score.

cell :: mypos -> mypos -> mark -> prop.

control :: agent -> prop.

move :: mypos -> mypos -> mypos -> mypos -> action.

noop :: action.

distinctCell :: mypos -> mypos -> mypos -> mypos -> bool.

x1, x2, y1, y2 :: obj.

downleft, downright, upright, upleft :: obj -> obj -> obj -> obj -> bool.

plusplus :: mypos -> mypos -> bool.

index :: mypos -> bool.




