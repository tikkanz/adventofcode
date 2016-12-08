NB. =========================================================
NB. 4a

test=: 0 :0
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
)

check=: 1514

Input=: freads '~Proj/adventofcode/2016/aoc_04_input.txt'

parseRooms=: <@(}:);._2
getChkSum=: '[' takeafter ]
getSectorId=: _99 ". '[' taketo >:@i:&'-' }. ]
getName=: i:&'-' {. ]
calcChkSum=: (5 {. ~. \: #/.~)@:/:~@:(-.&'-')

assert check -: +/@(getSectorId&> #~ getChkSum&.> = calcChkSum@getName&.>)@parseRooms test

echo +/@(getSectorId&> #~ getChkSum&.> = calcChkSum@getName&.>)@parseRooms Input

NB. =========================================================
NB. 4b

test=: 'qzmt-zixmtkozy-ivhz-343[33333]'
check=: 'very encrypted name'

Alpha=: ($~ 999 * #) 'abcdefghijklmnopqrstuvwxyz'
decryptName=: (Alpha,' ') {~ (#Alpha) <. getSectorId + Alpha i. getName

assert check -: decryptName test
idx=: I. ([: +./ 'north'&E.)&> decryptName&.> parseRooms Input
echo getSectorId idx {:: parseRooms Input