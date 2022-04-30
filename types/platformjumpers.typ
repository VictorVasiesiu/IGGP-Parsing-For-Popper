true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6, 7, 8, 9, 10 :: mypos.

0, 50, 100 :: int.

cell, jumper :: agent -> mypos -> mypos -> prop.

rowed, coled :: mypos -> prop.

control :: agent -> prop.

jump :: mypos -> mypos -> mypos -> mypos -> action.

row, col :: mypos -> action.

noop :: action.

board_succ, board_succ_two :: mypos -> mypos -> bool.

goal_row :: agent -> mypos -> bool.

index :: mypos -> bool.

knights_move_down, knights_move_up, slow_move_down, slow_move_up :: mypos -> mypos -> mypos -> mypos -> bool.

valid_move :: agent -> mypos -> mypos -> mypos -> mypos -> bool.

