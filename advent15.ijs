Note 'Day 15, Part 1'
Today, you set out on the task of perfecting your milk-dunking cookie recipe. All 
you have to do is find the right balance of ingredients.

Your recipe leaves room for exactly 100 teaspoons of ingredients. You make a list 
of the remaining ingredients you could use to finish the recipe (your puzzle input) 
and their properties per teaspoon:

    capacity (how well it helps the cookie absorb milk)
    durability (how well it keeps the cookie intact when full of milk)
    flavor (how tasty it makes the cookie)
    texture (how it improves the feel of the cookie)
    calories (how many calories it adds to the cookie)

You can only measure ingredients in whole-teaspoon amounts accurately, and you have 
to be accurate so you can reproduce your results in the future. The total score of 
a cookie can be found by adding up each of the properties (negative totals become 
0) and then multiplying together everything except calories.

For instance, suppose you have these two ingredients:

Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3

Then, choosing to use 44 teaspoons of butterscotch and 56 teaspoons of cinnamon 
(because the amounts of each ingredient must add up to 100) would result in a 
cookie with the following properties:

    A capacity of 44*-1 + 56*2 = 68
    A durability of 44*-2 + 56*3 = 80
    A flavor of 44*6 + 56*-2 = 152
    A texture of 44*3 + 56*-1 = 76

Multiplying these together (68 * 80 * 152 * 76, ignoring calories for now) 
results in a total score of 62842880, which happens to be the best score 
possible given these ingredients. If any properties had produced a negative 
total, it would have instead become zero, causing the whole score to multiply 
to zero.

Given the ingredients in your kitchen and their properties, what is the total 
score of the highest-scoring cookie you can make?
)

tst=: 0 :0
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
)

input=: freads '~Proj/adventofcode/advent15_input.txt'

parseInput=: _99 -.~"1 (_99) ". [: ];._2 ',' -.~ ]
Vals=: parseInput tst
Vals=: parseInput input

score=: ([: (*/"1) 0 >. [ +/ .*"1 _ }:"1@])&Vals
NB. score 40 60 , 44 56 ,: 80 20

NB. Parts from http://code.jsoftware.com/wiki/Essays/AllPartitions
Parts=: (1: + - ;@(<@$:"0 >:@i.) ])`(< }. ] ,:@# 1:)@.<:
allPerms=: i.@!@# A. ]
echo 'Day15 Part1: ',":  >./ score ; <@~.@allPerms"1  ] 100 Parts # Vals

Note 'Part 2'
Your cookie recipe becomes wildly popular! Someone asks if you can make another recipe 
that has exactly 500 calories per cookie (so they can use it as a meal replacement). 
Keep the rest of your award-winning process the same (100 teaspoons, same ingredients, 
same scoring system).

For example, given the ingredients above, if you had instead selected 40 teaspoons of 
butterscotch and 60 teaspoons of cinnamon (which still adds to 100), the total calorie 
count would be 40*8 + 60*3 = 500. The total score would go down, though: only 57600000, 
the best you can do in such trying circumstances.

Given the ingredients in your kitchen and their properties, what is the total score of 
the highest-scoring cookie you can make with a calorie total of 500?
)

cals=: ([ +/ .*"1 {:"1@])&Vals
NB. cals 40 60 , 44 56 ,: 80 20

echo 'Day15 Part2: ',":  >./ score  (#~ 500 = cals) ; <@~.@allPerms"1  ] 100 Parts # Vals


Note 'wrong track'
Pop=: 5 sampleTsp Vals

sampleTsp=: 10&$: : (|:@(2 -~/\ 0 , 100 ,~ [: |:@:(/:~"1) 100 ?@$~ (, <:@#)))
sampleTsp=: 10&$: : ((2 -~/\ 0 , ,&100)&.|:@([: (/:~"1) 100 ?@$~ (, <:@#)))
sampleTsp=: 10&$: : ((2 -~/\ 0 , ,&100)&.|:@(100 /:~"1@:?@$~ (, <:@#)))

>./ */"1 ] 0 >. (|:@:(44 56 ,. sampleTsp) +/ .*"1 _  ]) }:"1 parseInput tst
>./ */"1 ] 0 >. (|:@sampleTsp +/ .*"1 _ ]) }:"1 parseInput tst

*/"1 ] 0 >. (|:b) +/ .*"1 _ }:"1 parseInput tst
)
