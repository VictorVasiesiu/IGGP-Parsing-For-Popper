true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

wolf, sheep :: agent.

0, 100 :: int.

c1, c2, c3, c4, c5, c6, c7, c8 :: mypos.

b, s, w :: mark.

cell :: mypos -> mypos -> mark -> prop.

control :: agent -> prop.

move :: mypos -> mypos -> mypos -> mypos -> action.

noop :: action.

does_move :: agent -> mypos -> mypos -> mypos -> mypos -> bool.

adjacent :: agent -> mypos -> mypos -> mypos -> mypos -> bool.

smaller, succ :: mypos -> mypos -> bool.
