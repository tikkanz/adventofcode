Note 'Day 8: I Heard You Like Registers'
The instructions look like this:

b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10

These instructions would be processed as follows:

    Because a starts at 0, it is not greater than 1, and so b is not modified.
    a is increased by 1 (to 1) because b is less than 5 (it is 0).
    c is decreased by -10 (to 10) because a is now greater than or equal to 1 (it is 1).
    c is increased by -20 (to -10) because c is equal to 10.

After this process, the largest value in any register is 1.
)

Test=: noun define
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
)

TestSoln=: 1

MyInput=: freads '~AoC/2017/aoc08_input.txt'

getRegisters=: ~.@([: {."1 cut;._2)
inc=: +
dec=: -
if=: *
translateBooleanOps=: rplc&('>=';'>:';'<=';'<:';'==';'=';'!=';'~:')

findLargestRegister=: 3 :0
  Registers=. getRegisters y
  (Registers)=. 0
  Instructs=. translateBooleanOps y
  ". (] ,~ '=.' ,~ ' ' taketo ]);._2 Instructs
  >./ , ".&> Registers
)

assert TestSoln -: findLargestRegister Test

echo 'Day 8 Part 1:'
echo findLargestRegister  MyInput

Note 'Day 8: Part 2'
To be safe, the CPU also needs to know the highest value held in any 
register during this process so that it can decide how much memory to 
allocate to these operations. 
For example, in the above instructions, the highest value ever held was 10 
(in register c after the third instruction was evaluated).
)

Test=: Test

TestSoln=: 10

getCurrentVals=: [: , ".&>

findLargestRegister=: 3 :0
  Registers=. getRegisters y
  (Registers)=. 0
  Instructs=. translateBooleanOps y
  >./ ". (] ,~ '=.' ,~ ' ' taketo ]);._2 Instructs
)

assert TestSoln -: findLargestRegister Test

echo 'Day 7 Part 2:'
echo findLargestRegister MyInput
