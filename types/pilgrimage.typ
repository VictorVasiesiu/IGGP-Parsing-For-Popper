true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6 :: mypos.

mypos :> int.

0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,20,30,40,50,100 :: int.

cell :: mypos -> mypos -> mypos -> prop.

builder, pilgrim :: agent -> mypos -> mypos -> prop.

control :: agent -> prop.

phase :: agent -> phase_list -> prop.

build_terrain, place_pilgrim, pilgrimage :: phase_list.

moves :: agent -> int -> prop.

move :: mypos -> mypos -> mypos -> mypos -> action.

raise, place_pilgrim :: mypos -> mypos -> action.

noop :: action.

adjacent :: mypos -> mypos -> mypos -> mypos -> bool.

board_succ :: mypos -> mypos -> bool.

height, height_end :: mypos -> bool.

height_score :: int -> int -> bool.

index :: mypos -> bool.

phase_list :: phase_list -> bool.

succ, height_succ :: int -> int -> bool.

moves :: agent -> int -> prop.

phase :: agent -> phase_list -> prop.

