true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, black :: agent.

1, 2, 3, 4, 5, 6 :: mypos.

0, 50, 100 :: int.

cellholds :: mypos -> mypos -> mypos -> agent -> prop.

placecontrol, rotatecontrol :: agent -> prop.

clockwise, counterclockwise :: dir.

place :: mypos -> mypos -> mypos -> action.

rotate :: mypos -> dir -> action.

noop :: action.

add, cell :: mypos -> mypos -> mypos -> bool.

direction :: dir -> bool.

globalindex :: mypos -> mypos -> mypos -> mypos -> mypos -> bool.

horizontalflip, verticalflip :: mypos -> mypos -> mypos -> mypos -> bool.

index, quadrant :: mypos -> bool.

rotation :: dir -> mypos -> mypos -> mypos -> mypos -> bool.

succ :: mypos -> mypos -> bool.

