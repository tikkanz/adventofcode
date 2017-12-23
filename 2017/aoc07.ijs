Note 'Day 7: Recursive Circus'
For example, if your list is the following:

pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)

...then you would be able to recreate the structure of the towers that looks like this:

                gyxo
              /     
         ugml - ebii
       /      \     
      |         jptl
      |        
      |         pbga
     /        /
tknk --- padx - havc
     \        \
      |         goyq
      |             
      |         ktlj
       \      /     
         fwft - cntj
              \     
                xhth

... and the bottom program is tknk.
)

Test=: noun define
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
)

TestSoln=: 'tknk'

MyInput=: freads '~AoC/2017/aoc07_input.txt'

allProgs=: <@(' '&taketo);._2
NB. supportedProgs=: [: (',' splitstring '>'&takeafter);._2 -.&' '
supportedProgs=: [: <@(a: -.~ ',' splitstring '>'&takeafter);._2 -.&' '
NB. supportingProgs=: allProgs #~ [: +./"1 a: ~: supportedProgs
supportingProgs=: allProgs #~ [: (0 < #)&> supportedProgs
bottomProg=: supportingProgs -. ;@supportedProgs

assert TestSoln -: bottomProg Test

echo 'Day 7 Part 1:'
echo bottomProg MyInput

Note 'Day 7: Part 2'
However, for tknk to be balanced, each of the programs standing on its disc and all programs above it must each match. This means that the following sums must all be the same:

    ugml + (gyxo + ebii + jptl) = 68 + (61 + 61 + 61) = 251
    padx + (pbga + havc + qoyq) = 45 + (66 + 66 + 66) = 243
    fwft + (ktlj + cntj + xhth) = 72 + (57 + 57 + 57) = 243

As you can see, tknk's disc is unbalanced: ugml's stack is heavier than the other two. Even though the nodes above ugml are balanced, ugml itself is too heavy: it needs to be 8 units lighter for its stack to weigh 243 and keep the towers balanced. If this change were made, its weight would be 60.
)

Test=: Test

TestSoln=: 60

weights=: _99 ". ('(' takeafter ')'&taketo);._2
NB. topProgs=: supportingProgs -.~ [: -.&a:@, supportedProgs
topProgs=: allProgs -. supportingProgs
NB. ((0 ,~ weights) {~ allProgs i. depProgs)

(((0 ,~ weights) {~ allProgs i. supportedProgs) MyInput) #~ (supportedProgs +./"1@:e. topProgs) MyInput

rightWeight=: 3 :0
]
)

assert TestSoln -: findBottom Test

echo 'Day 7 Part 2:'
echo findBottom MyInput
