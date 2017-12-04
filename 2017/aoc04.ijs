Note 'Day 4: High-Entropy Passphrases'
For example:

    aa bb cc dd ee is valid.
    aa bb cc dd aa is not valid - the word aa appears more than once.
    aa bb cc dd aaa is valid - aa and aaa count as different words.
)

Test=: <;._2 noun define
aa bb cc dd ee
aa bb cc dd aa
aa bb cc dd aaa
)

TestSoln=: 1 0 1

MyInput=: <;._2 freads '~AoC/2017/aoc04_input.txt'

isValidPassPhrase=: (#@~. = #)@;:

assert TestSoln -: isValidPassPhrase&> Test

echo 'Day 4 Part 1:'
echo +/ isValidPassPhrase&> MyInput

Note 'Day 4: Part 2'
For example:

    abcde fghij is a valid passphrase.
    abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
    a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
    iiii oiii ooii oooi oooo is valid.
    oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
)

Test=: <;._2 noun define
abcde fghij
abcde xyz ecdab
a ab abc abd abf abj
iiii oiii ooii oooi oooo
oiii ioii iioi iiio
) 

TestSoln=: 1 0 1 1 0

isValidPassPhrase=: (#@~. = #)@:(/:~&.>)@;:

assert TestSoln -: isValidPassPhrase&> Test

echo 'Day 4 Part 2:'
echo +/ isValidPassPhrase&> MyInput
