Note 'Day6, Part 1'
Because your neighbors keep defeating you in the holiday house decorating 
contest year after year, you've decided to deploy one million lights in a 
1000x1000 grid.

Furthermore, because you've been especially nice this year, Santa has mailed 
you instructions on how to display the ideal lighting configuration.

Lights in your grid are numbered from 0 to 999 in each direction; the lights 
at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions 
include whether to turn on, turn off, or toggle various inclusive ranges given 
as coordinate pairs. Each coordinate pair represents opposite corners of a 
rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers 
to 9 lights in a 3x3 square. The lights all start turned off.

To defeat your neighbors this year, all you have to do is set up your lights 
by doing the instructions Santa sent you in order.

For example:

    turn on 0,0 through 999,999 would turn on (or leave on) every light.
    toggle 0,0 through 999,0 would toggle the first line of 1000 lights, 
      turning off the ones that were on, and turning on the ones that were off.
    turn off 499,499 through 500,500 would turn off (or leave off) the middle 
      four lights.

After following the instructions, how many lights are lit?
)


parseInstructs=: 3 :0
  tmp=. y rplc 'turn ';'';'through ';''
  action=. <@(' '&taketo);._2 tmp
  coords=. ". ' '&takeafter;._2 tmp
  action=. ('off';'on';'toggle') i. action
  action ,. coords
)

getIdx=: [: < ([ + i.@>:@-~)&.>/@(_2 ]\ ])
on=: 1:`(getIdx@[)`]}
off=: 0:`(getIdx@[)`]}
toggle=: ([: -. getIdx@[ { ])`(getIdx@[)`]}

applyActions=: 4 :0
  actions=. {."1 x
  coords=. }."1 x
  for_action. actions do.
    coord=. action_index { coords
    y=. coord off`on`toggle@.action"_ y
  end.
)

Lights=: 1000 1000 $ 0
Instructions=: parseInstructs freads '~Proj/adventofcode/advent06_input.txt'
Lights=: Instructions applyActions Lights
echo 'Day6 Part1: ',": +/ , Lights

Note 'Part 2'
You just finish implementing your winning light pattern when you realize 
you mistranslated Santa's message from Ancient Nordic Elvish.

The light grid you bought actually has individual brightness controls; 
each light can have a brightness of zero or more. The lights all start at zero.

The phrase turn on actually means that you should increase the brightness of 
those lights by 1.

The phrase turn off actually means that you should decrease the brightness of 
those lights by 1, to a minimum of zero.

The phrase toggle actually means that you should increase the brightness of 
those lights by 2.

What is the total brightness of all lights combined after following Santa's 
instructions?

For example:

    turn on 0,0 through 0,0 would increase the total brightness by 1.
    toggle 0,0 through 999,999 would increase the total brightness by 2000000.
)

on=: (1 + getIdx@[ { ])`(getIdx@[)`]}
off=: (0 >. _1 + getIdx@[ { ])`(getIdx@[)`]}
toggle=: (2 + getIdx@[ { ])`(getIdx@[)`]}

Lights=: 1000 1000 $ 0
Lights=: Instructions applyActions Lights
echo 'Day6 Part2: ',": +/ , Lights
