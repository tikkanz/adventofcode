Note 'Day 1: Chronal Calibration'
After feeling like you've been falling for a few minutes, you look at the device's tiny screen. 
"Error: Device must be calibrated before first use. Frequency drift detected. Cannot maintain 
destination lock." Below the message, the device shows a sequence of changes in frequency (your puzzle input). 
A value like +6 means the current frequency increases by 6; a value like -3 means the current 
frequency decreases by 3.

For example, if the device displays frequency changes of +1, -2, +3, +1, then starting from a 
frequency of zero, the following changes would occur:

    Current frequency  0, change of +1; resulting frequency  1.
    Current frequency  1, change of -2; resulting frequency -1.
    Current frequency -1, change of +3; resulting frequency  2.
    Current frequency  2, change of +1; resulting frequency  3.

In this example, the resulting frequency is 3.

Here are other example situations:

    +1, +1, +1 results in  3
    +1, +1, -2 results in  0
    -1, -2, -3 results in -6

Starting with a frequency of zero, what is the resulting frequency after all of the changes in 
frequency have been applied?
)
load 'format/printf'

lastFreq=: +/

test_inputs=: 1 _2 3 1 ; 1 1 1 ;  1 1 _2 ; _1 _2 _3
test_outputs=: 3 3 0 _6
assert test_outputs = lastFreq&> test_inputs 

input=: 0 ". ];._2 freads '2018/aoc01_input.txt'
'Day 1, Part 1 answer: %d' printf lastFreq input

Note 'Day 1, Part 2'
You notice that the device repeats the same frequency change list over and over. To calibrate 
the device, you need to find the first frequency it reaches twice.

For example, using the same list of changes above, the device would loop as follows:

    Current frequency  0, change of +1; resulting frequency  1.
    Current frequency  1, change of -2; resulting frequency -1.
    Current frequency -1, change of +3; resulting frequency  2.
    Current frequency  2, change of +1; resulting frequency  3.
    (At this point, the device continues from the start of the list.)
    Current frequency  3, change of +1; resulting frequency  4.
    Current frequency  4, change of -2; resulting frequency  2, which has already been seen.

In this example, the first frequency reached twice is 2. Note that your device might need to repeat 
its list of frequency changes many times before a duplicate frequency is found, and that duplicates 
might be found while in the middle of processing the list.

Here are other examples:

    +1, -1 first reaches 0 twice.
    +3, +3, +4, -2, -4 first reaches 10 twice.
    -6, +3, +8, +5, -6 first reaches 5 twice.
    +7, +7, -2, -7, -4 first reaches 14 twice.

What is the first frequency your device reaches twice?
)

getFirstRepeatFreq=: [: {.@(#~ -.@~:)@(0 , +/\) ,~^:((0 -.@e. ~:)@(0 , +/\))^:_

test_inputs=: 1 _2 3 1 ; 1 _1 ; 3 3 4 _2 _4 ; _6 3 8 5 _6 ; 7 7 _2 _7 _4
test_outputs=: 2 0 10 5 14 
assert test_outputs = getFirstRepeatFreq&> test_inputs

'Day 1, Part 2 answer: %d' printf getFirstRepeatFreq input

NB. Developing a more "readable" version
freqs=: 0 , +/\              NB. need to pre-pend starting freq to running sum
noRepeat=: 0 -.@e. ~:        NB. returns 1 (true) if no repeating value
firstRepeat=: {.^:#@(#~ -.@~:)  NB. returns the first repeated value

getFirstRepeatFreq=: firstRepeat@freqs ,~^:(noRepeat@freqs)^:_ input

NB. Taking it further ...
while=: 2 :'u ^: v ^:_'
extend=: ,~                  NB. input grows exponentially
noRepeatFreq=: noRepeat@freqs
firstRepeatFreq=: firstRepeat@freqs

getFirstRepeatFreq=: firstRepeatFreq@(extend while noRepeatFreq)

NB. using more efficient algorithm
NB. first repeat has to be one of the first set of freqs
NB. sets of freqs after the first are offset by multiples of the answeer to part 1
getFirstRepeatFreq=: verb define
  fqs=. +/\ y
  diff=. {: fqs
  t=. 1
  while. 1 > # res=. firstRepeat 0 , fqs ([ , +) diff * t
    do. t=. t+1
  end.
  res
)
