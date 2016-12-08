NB. =========================================================
NB. 1a
tests=: 'R2, L3';'R2, R2, R2,';'R5, L5, R5, R3'
chks=: 5 2 12

Input=: freads '~Proj/adventofcode/2016/aoc_01_input.txt'
parseInput=: [: <;._1 ',' , ',RL0123456789'&(-.~ -.~ ])
Directions=: 1 0 , 0 1 , _1 0 ,: 0 _1  NB. NESW
getDirections=: Directions {~ 4 | 'L R' +/\@:<:@i. {.&>
getDistances=: 0 ". }.&>
getMoves=: (getDistances * getDirections)@parseInput
calcBlocks=: +/@:|
getBlocks=: calcBlocks@(+/)@getMoves

assert chks -: getBlocks&> tests

echo '1a is: ',": getBlocks Input

NB. =========================================================
NB. 1b
tests=: <'R8, R4, R4, R8'
chks=: 4

getMoves=: (getDistances # getDirections)@parseInput  NB. represent moves as multiple 1 block moves
getCoords=: 0 0 , +/\@getMoves
getIntermediateCoords=: ;@:(|:&.>)@(2 <@({. + ([: (* * i.@|) -~/))\ ])
getFirstDuplicate=: {.@(#~ i.~ ~: i:~)
getBlockstoFirstIntersect=: calcBlocks@getFirstDuplicate@getIntermediateCoords@getCoords

assert chks -: getBlockstoFirstIntersect &> tests

echo '1b is: ',": getBlockstoFirstIntersect Input

require 'plot'
plot ;/|: getCoords Input


NB. Using Henry Rich's idea to represent moves as multiple 1 block moves
getMoves=: (getDistances # getDirections)@parseInput  NB. represent moves as multiple 1 block moves
getCoords=: 0 0 , +/\@getMoves
getBlockstoFirstIntersect=: calcBlocks@getFirstDuplicate@getCoords
