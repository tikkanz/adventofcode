test=: 0 :0
ULL
RRDDD
LURDL
UUUUD
)

check=: '1985'
Input=: freads '~Proj/adventofcode/2016/aoc_02_input.txt'

parseInput=: <;._2
Directions=: 1 0 , _1 0 , 0 1 ,: 0 _1  NB. DURL
DMap=: 'DURL'
Keypad=: >: i. 3 3

StartKey=: 1 1
add=: 0 >. 2 <. +
getKeySteps=: (Directions {~ DMap&i.)&.>
getKeyIdx=: [: +/\ #&>
cumpos=: ([: <"1 [: add/@|.\ 1 1 , ])@;
compress=: ' ' -.~ ":

assert check -: ' ' -.~ ": ((Keypad {~ [: <"1 [: add/@|.\ 1 1 , ])@; {~ [: +/\ #&>)(Directions {~ DMap&i.)&.> parseInput test
assert check -: compress@((Keypad {~ cumpos) {~ getKeyIdx)@:getKeySteps@parseInput test

echo compress ((Keypad {~ cumpos) {~ getKeyIdx)getKeySteps parseInput Input

NB. =========================================================
NB. 1b
Keypad2=: ({.~ 1 + $) ];._2 noun define
  1
 234
56789
 ABC
  D
)

IsKey=: Keypad2 ~: ' '
check=: '5DB3'

Steps=: getKeySteps@parseInput Input
NumSteps=: +/\ #&> Steps

getKeys=: 4 :0
  keys=. ,: x
  steps=. ;y
  for_step. steps do.
    newkey=. step + {:keys
    if. -. IsKey {~ <newkey do. newkey=. {:keys end.
    keys=. keys, newkey
  end.
)

assert check -: (Keypad2 {~ 2 0&getKeys <"1@{~ getKeyIdx)@:getKeySteps@parseInput test
echo (Keypad2 {~ 2 0&getKeys <"1@{~ getKeyIdx)@:getKeySteps@parseInput  Input