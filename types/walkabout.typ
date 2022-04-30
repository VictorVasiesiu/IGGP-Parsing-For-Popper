true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

0, 100 :: score.

1, 2, 3, 4, 5 :: mypos.

x, o :: obj.

at :: mypos -> mypos -> obj -> prop.

left, right, up, down, noop :: action.

bounds :: mypos -> bool.

controls :: agent -> obj -> bool.

distinct :: agent -> agent -> bool.

object :: obj -> bool.

succ :: mypos -> mypos -> bool.
