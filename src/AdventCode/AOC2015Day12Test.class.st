Class {
	#name : 'AOC2015Day12Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day12Test >> testPart1 [
| aoc parse |
aoc := AOC2015Day12 new .
parse := aoc parse: (aoc input).
self assert: (aoc part1: parse) = 191164.
]

{ #category : 'accessing' }
AOC2015Day12Test >> testPart2 [
| aoc parse |
aoc := AOC2015Day12 new .
parse := aoc parse: (aoc input).
self assert: (aoc part2: parse) = 87842.
]
