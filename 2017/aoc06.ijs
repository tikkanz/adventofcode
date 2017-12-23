Note 'Day 6: Memory Reallocation'
For example, imagine a scenario with only four memory banks:

    The banks start with 0, 2, 7, and 0 blocks. The third bank has the most blocks, so it is chosen for redistribution.
    Starting with the next bank (the fourth bank) and then continuing to the first bank, the second bank, and so on, the 7 blocks are spread out over the memory banks. The fourth, first, and second banks get two blocks each, and the third bank gets one back. The final result looks like this: 2 4 1 2.
    Next, the second bank is chosen because it contains the most blocks (four). Because there are four memory banks, each gets one block. The result is: 3 1 2 3.
    Now, there is a tie between the first and fourth memory banks, both of which have three blocks. The first bank wins the tie, and its three blocks are distributed evenly over the other three banks, leaving it with none: 0 2 3 4.
    The fourth bank is chosen, and its four blocks are distributed such that each of the four banks receives one: 1 3 4 1.
    The third bank is chosen, and the same thing happens: 2 4 1 2.

At this point, we've reached a state we've seen before: 2 4 1 2 was already seen. The infinite loop is detected after the fifth block redistribution cycle, and so the answer in this example is 5.
)

Test=: ,: _999 ". '0 2 7 0'

TestSoln=: 5

MyInput=: _999 ". ];._2 freads '~AoC/2017/aoc06_input.txt'

countCycles=: 3 :0
 Cycles=. y
  while. ({: -.@e. }:) Cycles do.
    Redistrib=. +/ (-@# ]\ ] (] $~ >.&#) 0 1 #~ >:@(i. >./) , >./) {:Cycles
    Cycles=. Cycles , Redistrib + 0 [`(] i. >./@])`]} {:Cycles
  end.
  # }. Cycles
)

assert TestSoln -: countCycles Test

echo 'Day 6 Part 1:'
echo countCycles MyInput

Note 'Day 6: Part 2'
)

Test=: ,: _999 ". '0 2 7 0'

TestSoln=: 4

countCycles=: 3 :0
 Cycles=. y
  while. ({: -.@e. }:) Cycles do.
    Redistrib=. +/ (-@# ]\ ] (] $~ >.&#) 0 1 #~ >:@(i. >./) , >./) {:Cycles
    Cycles=. Cycles , Redistrib + 0 [`(] i. >./@])`]} {:Cycles
  end.
  (#@}: - ] i. {:) Cycles
)

assert TestSoln -: countCycles Test

echo 'Day 6 Part 2:'
echo countCycles MyInput
