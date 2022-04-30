true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

red, blue, orange, cyan :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: mypos.

0, 50, 100 :: score.

hot, cold :: temp.

cell :: mypos -> mypos -> agent -> prop.

control :: agent -> prop.

drop :: mypos -> action.

noop :: action.

succ :: mypos -> mypos -> bool.

team :: temp -> agent -> bool. 

x, y :: mypos -> bool.


