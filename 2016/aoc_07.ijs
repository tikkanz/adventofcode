NB. =========================================================
NB. 7a
tests=: <;._2 noun define
abba[mnop]qrst
abcd[bddb]xyyx
aaaa[qwer]tyui
ioxxoj[asdfgh]zxcvbn
rklvlmyqqxbttuhuzos[bihsvfaluvhdwqwcz]gbrlkbxpivsdykcjx[qoudfwhqcnbrmru]npquvyoxliacxpr[txyzvzsdzqedximgecr]srcqshisakuwljrulf
rklvlmxqqxbttuhuzos[bihsvfaluvhdwqwcz]gbrlkbxpivsdykcjx[qoudfwhqcnbrmru]npquvyoxliacxpr[txyzvzsdzqedximgecr]srcqshisakuwljrulf
rklvlmxqqxbttuhuzos[bihsvfaluvhdwqwcz]gbrlkbxpivsdykcjx[qoudfwhqcnbrmru]npquvyoxliacxpr[txyzvzsszqedximgecr]srcqshisakuwljrulf
)

checks=: 1 0 0 1 0 1 0

Input=: <;._2 freads '~temp/aoc_07_input.txt'

maskHypernet=: ~:/\@('[' e.~ ])
getHypernet=: (#~ maskHypernet)@(']['&charsub)
noHypernet=: (#~ -.@maskHypernet)@(']['&charsub)
is2Uniq=: 2 = #@~.
isStartRevEnd=: 2&{. -: |.@(2&}.)
hasABBA=: +./@(4 (is2Uniq *. isStartRevEnd)\ ])
supportsTLS=: hasABBA@noHypernet *. -.@hasABBA@getHypernet

assert checks -: supportsTLS&> tests

echo +/ supportsTLS&> Input

NB. =========================================================
NB. 7b
tests=: <;._2 noun define
aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb
)

checks=: 1 0 1 1

isFirstLast=: {. = {:
noDelim=: '[' -.@e. ]
getABA=: (3&(]\) #~ (3 (noDelim *. is2Uniq *. isFirstLast)\ ]))
supportsSSL=: +./@(getABA@getHypernet e. 1 0 1&{"1@getABA@noHypernet)

assert checks -: supportsSSL&> tests

echo +/ supportsSSL&> Input