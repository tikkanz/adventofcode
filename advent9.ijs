
2 <\ (i.@!@# A. ])

input=: (0 2 4 { ;:);._2 freads '~temp/advent9_input.txt'
Locs=: ~. , 2{."1 input

Trips=: <"1 Locs i. 2 {."1 input
Distances=: _99 ". > {:"1 input
Routes=: 2 <@/:~\"1 (i.@!@# A. ]) i.#Locs


<./ +/"1 Distances {~ Trips i. Routes


Note 'Part 2'
The next year, just to show off, Santa decides to take the route with the 
longest distance instead.

He can still start and end at any two (different) locations he wants, and 
he still must visit each location exactly once.

For example, given the distances above, the longest route would be 982 via 
(for example) Dublin -> London -> Belfast.

What is the distance of the longest route?
)

>./ +/"1 Distances {~ Trips i. Routes
