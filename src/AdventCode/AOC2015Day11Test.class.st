Class {
	#name : 'AOC2015Day11Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day11Test >> testPart1 [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc part1) = 'cqjxxyzz'.
]

{ #category : 'as yet unclassified' }
AOC2015Day11Test >> testPart2 [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc part2) = 'cqkaabcc'.
]

{ #category : 'accessing' }
AOC2015Day11Test >> testPassword [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc run: 'abcdefgh') = 'abcdffaa'.
]

{ #category : 'accessing' }
AOC2015Day11Test >> testPassword2 [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc run: 'ghijklmn') = 'ghjaabcc'.
]
