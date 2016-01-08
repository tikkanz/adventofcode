Note 'Day 12, Part 1'
Santa's Accounting-Elves need help balancing the books after a recent 
order. Unfortunately, their accounting software uses a peculiar storage 
format. That's where you come in.

They have a JSON document which contains a variety of things: 
arrays ([1,2,3]), objects ({"a":1, "b":2}), numbers, and strings. 
Your first job is to simply find all of the numbers throughout the 
document and add them together.

For example:

    [1,2,3] and {"a":2,"b":4} both have a sum of 6.
    [[[3]]] and {"a":{"b":4},"c":-1} both have a sum of 3.
    {"a":[-1,1]} and [-1,{"a":1}] both have a sum of 0.
    [] and {} both have a sum of 0.

You will not encounter any strings containing numbers.

What is the sum of all numbers in the document?
)

input=: }: freads '~Proj/adventofcode/advent12_input.txt'
echo 'Day12 Part1: ',":  +/ _99 ". ', ' rplc~ '[]{}"abcdefghijklmnopqrstuvwxyz:' -.~ input

Note 'Part 2'
Uh oh - the Accounting-Elves have realized that they double-counted 
everything red.

Ignore any object (and all of its children) which has any property 
with the value "red". Do this only for objects ({...}), not arrays 
([...]).

    * [1,2,3] still has a sum of 6.
    * [1,{"c":"red","b":2},3] now has a sum of 4, because the middle 
      object is ignored.
    * {"d":"red","e":[1,2,3,4],"f":5} now has a sum of 0, because 
      the entire structure is ignored.
    * [1,"red",5] has a sum of 6, because "red" in an array has no 
      effect.
)

tst1=: '[1,2,3]'
tst2=: '[1,{"c":"red","b":2},3]'
tst3=: '{"d":"red","e":[1,2,3,4],"f":5}'
tst4=: '[1,"red",5]'
tst5=: '[' , tst1 ,',', tst2 ,',', tst3 ,',', tst4 , ']' 

load 'convert/json validate'
isObject=: # *./&(2&=) #@$
isRed=: (<'red')&e.
isNumeric=: 3!:0 e. 1 4 8 16 64 128"_
isBoxed=: 32 = 3!:0
 
Note 'fiddle'
isObject (0 ; 1 0) {:: dec_json input
isRed (0 ; 1 0) {:: dec_json input
)

SUM=: 0 

sumNonRedNums=: 3 :0
for_item. y do.
  item=. > item
  if. isObject item do.
    props=. {: item
    if. -.@isRed props do.
      SUM=: SUM + +/ ; (#~ isNumeric&>) props
    else. empty'' continue.
    end.
  else.
    props=. item
    SUM=: SUM + +/@;@(#~ isNumeric&>) props
  end.
  sumNonRedNums (#~ isBoxed&>) props
end.
)

sumNonRedNums dec_json input

echo 'Day12 Part2: ',": SUM