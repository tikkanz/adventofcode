Note 'Day 1: Inverse Captcha'
For example:

    1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
    1111 produces 4 because each digit (all 1) matches the next.
    1234 produces 0 because no digit matches the next.
    91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
)

Test=: '1122';'1111';'1234';'91212129'
TestSoln=: 3 4 0 9

MyInput=: -.&LF freads '~AoC/2017/aoc01_input.txt'

solveCaptcha=: (+/)@:(#~ ] = 1 |. ])@:("."0)

assert TestSoln -: solveCaptcha&> Test

echo 'Day 1 Part 1:'
echo solveCaptcha MyInput

Note 'Day 1: Part 2'
For example:

    1212 produces 6: the list contains 4 items, and all four digits match the digit 2 items ahead.
    1221 produces 0, because every comparison is between a 1 and a 2.
    123425 produces 4, because both 2s match each other, but no other digit has a match.
    123123 produces 12.
    12131415 produces 4.
)

Test=: '1212';'1221';'123425';'123123';'12131415'
TestSoln=: 6 0 4 12 4

solveCaptcha=: (+/)@:(#~ ] = -:@# |. ])@:("."0)

assert TestSoln -: solveCaptcha&> Test

echo 'Day 1 Part 2:'
echo solveCaptcha MyInput
