true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

index :: mypos -> bool. 

1, 2, 3, 4, 5, 6, 7 :: mypos.

mypos :> int.

0, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 40, 50, 60, 70, 80, 90, 100 :: int.

cell :: mypos -> mypos -> agent -> prop. 

capture :: agent -> int -> prop.

control :: agent -> prop. 

step :: int -> prop. 

move :: mypos -> mypos -> mypos -> mypos -> action.

noop :: action.

onboard :: mypos -> mypos -> bool.

add :: mypos -> mypos -> mypos -> bool.

diagonal, ell, orthogonal :: mypos -> mypos -> mypos -> mypos -> bool.

captureadd, scoremap, stepcount :: int -> int -> bool.

rotation :: agent -> agent -> bool.

spawns :: mypos -> mypos -> agent -> bool.



