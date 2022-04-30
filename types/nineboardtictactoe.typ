true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> int -> bool.

terminal :: bool.

role :: agent -> bool.

xplayer, oplayer :: agent.

1, 2, 3 :: mypos.

0, 50, 100 :: int.

mark :: mypos -> mypos -> mypos -> mypos -> symbol -> prop.

currentboard :: mypos -> mypos -> prop.

control :: agent -> prop.

noop :: action.

index :: mypos -> bool.

x, o :: symbol.

play :: mypos -> mypos -> mypos -> mypos -> symbol -> action.

