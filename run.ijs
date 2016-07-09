
require 'format/printf'
Tmplfname=: '~Proj/adventofcode/advent%02d.ijs'
solns=: Tmplfname&sprintf each >: i. 17

load every 17 {. solns
