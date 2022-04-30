true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black :: agent.

x, wall, obj1, d1 :: obj.

1, 2, 3, 4, 5 :: mypos.

100 :: score.

at :: mypos -> mypos -> obj -> prop.

target :: mypos -> mypos -> prop.

open :: obj -> mypos -> prop.

switch :: mypos -> mypos -> obj -> prop.

noop, up, down, left, right :: action.

bounds :: mypos -> bool.

controls :: agent -> obj -> bool.

dir :: action -> bool.

door, is_box :: obj -> bool.

object, player_obj :: obj -> bool.

succ :: mypos -> mypos -> bool.