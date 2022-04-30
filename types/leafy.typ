true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: mypos.

0, 50, 100 :: int.

leaf :: mypos -> mypos -> prop.

isplayer :: mypos -> mypos -> agent -> prop.

move :: mypos -> mypos -> action.

close :: mypos -> mypos -> bool.

index :: mypos -> bool.

