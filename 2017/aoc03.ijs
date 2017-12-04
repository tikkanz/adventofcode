Note 'Day 3: Spiral Memory'
For example, the first few squares are allocated like this:

17  16  15  14  13
18   5   4   3  12
19   6   1   2  11
20   7   8   9  10
21  22  23---> ...

For example:

    Data from square 1 is carried 0 steps, since it's at the access port.
    Data from square 12 is carried 3 steps, such as: down, left, left.
    Data from square 23 is carried only 2 steps: up twice.
    Data from square 1024 must be carried 31 steps.
)

Test=: 1 12 23 1024

TestSoln=: 0 3 2 31

MyInput=: 325489
   getIdx=: 4 $. $.
   evJKT1=:<:@+: $ _1: , ] , 1: , -
   evJKT0=:}:@(2: # >:@i.)
   evJKT2=:_1&|.@(evJKT0 # evJKT1)
   evJKT=:(,~ $ /: @ (+/\) @ evJKT2) f.

makeSpiral=: 1 + evJKT@>.@%:
calcMDist=: +/@:|@([: -/@getIdx makeSpiral e. 1&,)

assert TestSoln -: calcMDist&> Test

echo 'Day 3 Part 1:'
echo calcMDist MyInput

Note 'Day 3: Part 2'
147  142  133  122   59
304    5    4    2   57
330   10    1    1   54
351   11   23   25   26
362  747  806--->   ...

What is the first value written that is larger than your puzzle input?
)

echo 'Day 3 Part 2:'
echo 'Look up OEIS for Sequence 1 1 2 4 5 10 11 23 25 26 54 57'
echo 'Answer is in table https://oeis.org/A141481/b141481.txt'
echo 330785
