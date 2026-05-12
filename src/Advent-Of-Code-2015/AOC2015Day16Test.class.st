Class {
	#name : 'AOC2015Day16Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'accessing' }
AOC2015Day16Test >> testPart1 [
| aoc d |
aoc := AOC2015Day16 new.
d := ((aoc part1) at: 1) at: 1 .
self assert: d isDictionary.
self assert: ((d at: #sue) = 373)
]
