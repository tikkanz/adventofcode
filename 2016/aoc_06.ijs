NB. =========================================================
NB. 6a
test=: 0 :0
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
)
check=: 'easter'

Input=: freads '~Proj/adventofcode/2016/aoc_06_input.txt'

assert check -: (~. {~ [: (i. >./) #/.~)"1  |: ];._2 test
echo (~. {~ [: (i. >./) #/.~)"1  |: ];._2 Input

NB. =========================================================
NB. 6b
check=: 'advent'
assert check -: (~. {~ [: (i. <./) #/.~)"1  |: ];._2 test
echo (~. {~ [: (i. <./) #/.~)"1  |: ];._2 Input
