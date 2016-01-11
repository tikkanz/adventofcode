
require 'format/printf'
Tmplfname=: '~Proj/adventofcode/advent%d.ijs' 
solns=: Tmplfname&sprintf each >: i. 17

load every 3 {. solns