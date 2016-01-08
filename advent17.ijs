Note 'Day 17, Part 1'
The elves bought too much eggnog again - 150 liters this time. To fit it all into your 
refrigerator, you'll need to move it into smaller containers. You take an inventory of 
the capacities of the available containers.

For example, suppose you have containers of size 20, 15, 10, 5, and 5 liters. If you need 
to store 25 liters, there are four ways to do it:

    15 and 10
    20 and 5 (the first 5)
    20 and 5 (the second 5)
    15, 5, and 5

Filling all containers entirely, how many different combinations of containers can exactly 
fit all 150 liters of eggnog?
)

input=: _99 ". ];._2 freads '~Proj/adventofcode/advent17_input.txt'

require 'stats'
allidx=: 4 5 6 7 8 <@comb"0 ] 20  NB. by inspection have to be more than 3 and less than 9 containers

echo 'Day17 Part1: ',":  +/ 150 = ; allidx ([: +/"1 {)&.> <input

Note 'Part 2'
While playing with all the containers in the kitchen, another load of eggnog arrives! The 
shipping and receiving department is requesting as many containers as you can spare.

Find the minimum number of containers that can exactly fit all 150 liters of eggnog. How 
many different ways can you fill that number of containers and still hold exactly 150 
litres?

In the example above, the minimum number of containers was two. There were three ways to 
use that many containers, and so the answer there would be 3.
)

echo 'Day17 Part2: ',":  {. 0 -.~ ([: +/ 150&=)&> allidx ([: +/"1 {)&.> <input