true, next :: prop -> bool.

legal, input, does :: agent -> action -> bool.

goal :: agent -> score -> bool.

terminal :: bool.

role :: agent -> bool.

you :: agent.

1, 2, 3, 4, 5, 6, 7, 8 :: mypos.

0, 100 :: score.

zerocoins, onecoin, twocoins :: cell_value.

cell :: mypos -> cell_value -> prop.

jump :: mypos -> mypos -> action.

step :: mypos -> prop.

zerobetween, onebetween, twobetween, succ :: mypos -> mypos -> prop.