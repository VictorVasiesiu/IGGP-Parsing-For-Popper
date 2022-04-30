true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

black, white :: agent.

agent :> cell_type.

blank :: cell_type.

a, b, c, d, e, f, g, h :: x_mypos.

1, 2, 3, 4, 5, 6, 7, 8 :: y_mypos.

0, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 50, 62, 75, 87, 100 :: int.

y_mypos :> int.

oddcell, evencell :: x_mypos -> y_mypos -> agent -> prop.

oddscore, evenscore :: agent -> int -> prop.

oddcontrol, evencontrol :: agent -> prop.

oddstep, evenstep :: int -> prop.

oddmove, evenmove :: x_mypos -> y_mypos -> x_mypos -> y_mypos -> action.

oddjump, evenjump :: x_mypos -> y_mypos -> x_mypos -> y_mypos -> x_mypos -> y_mypos -> action.

oddnoop, evennoop :: action.



