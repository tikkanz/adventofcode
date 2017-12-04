
require 'format/printf'
Tmplfname=: '~AoC/2015/aoc%02d.ijs'
solns=: Tmplfname&sprintf each >: i. 17

load every 17 {. solns
