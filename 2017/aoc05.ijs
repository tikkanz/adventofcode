Note 'Day 5: A Maze of Twisty Trampolines, All Alike'
)

Test=: _999 ". '0 3 0 1 -3'

TestSoln=: 5

MyInput=: _999 ". ];._2 freads '~AoC/2017/aoc05_input.txt'

countJumps=: 3 :0
 count=. idx=. 0
 offsets=. y
 while. (0 <: idx) *. (idx < #offsets) do.
   count=. count + 1
   idx_new=. idx ([ + {) offsets
   offsets=. idx (1 + {)`[`]} offsets
   idx=. idx_new
 end.
 count
)

assert TestSoln -: countJumps Test

echo 'Day 5 Part 1:'
echo countJumps MyInput

Note 'Day 5: Part 2'
)

Test=: _999 ". '0 3 0 1 -3'

TestSoln=: 10

countJumps=: 3 :0
 count=. idx=. 0
 offsets=. y
 while. (0 <: idx) *. (idx < #offsets) do.
   count=. count + 1
   idx_new=. idx ([ + {) offsets
   offsets=. idx ((1 _1 {~ 3 <: {) + {)`[`]} offsets
   idx=. idx_new
 end.
 count
)

assert TestSoln -: countJumps Test

echo 'Day 5 Part 2:'
echo countJumps MyInput
