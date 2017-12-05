require 'format/printf'
Tmplfname=: '~AoC/2017/aoc%02d.ijs'
solns=: Tmplfname&sprintf each >: i. 4

load every 5 {. solns
