true, next :: prop -> bool.

at :: mypos -> obj -> prop.

target :: mypos -> prop.

does :: agent -> action -> bool.

player_obj, is_box, object :: obj -> bool.

controls :: agent -> obj -> bool.

wall_at :: mypos -> bool.

is_noop :: action -> bool.

role :: agent -> bool.

left, right, up, down, noop :: action.

dir :: mypos -> action -> mypos -> bool.

bounds :: mypos -> bool.

mypos11, mypos21, mypos31, mypos41, mypos51 :: mypos.
mypos12, mypos22, mypos32, mypos42, mypos52 :: mypos.
mypos13, mypos23, mypos33, mypos43, mypos53 :: mypos.
mypos14, mypos24, mypos34, mypos44, mypos54 :: mypos.
mypos15, mypos25, mypos35, mypos45, mypos55 :: mypos.

x, obj1, obj2 :: obj.

black :: agent.

