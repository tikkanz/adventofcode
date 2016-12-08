NB. =========================================================
NB. 8a
test=: noun define
rect 3 2
column rotate 1 1
row rotate 0 4
column rotate 1 1
)

check=: ];._2 noun define
.#..#.#
#.#....
.#.....
)

initScreen=: $&'.'
parseInput=: (([: <"1 (,. |.)&.;:)&> 'rotate column';'rotate row') rplc~ 'x ' charsub -.&'=by'

rect=: ('#'"_)`([: < [: i.&.> |.@[)`]}~
row=: (-@{:@[ |. {.@[ { ])`({.@[)`]}
column=: ({.@[ {"1 -@{:@[ |. ])`([: < a: ; {.@[)`]}
rotate=:~
countOn=: +/@('#' = ,)

Input=: freads '~temp/aoc_08_input.txt'

Screen=: initScreen 3 7
0!:100 ;<@('Screen=: Screen '&,);.2 parseInput test
assert check -: Screen

Screen=: initScreen 6 50
0!:100 ;<@('Screen=: Screen '&,);.2 parseInput Input
echo countOn Screen

NB. =========================================================
NB. 8b

echo <"2 }:"1"2 |:"2 ] _5]\ |: '. ' charsub Screen