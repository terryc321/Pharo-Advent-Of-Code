Class {
	#name : 'AOC2015Day8Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'testing' }
AOC2015Day8Test >> testExample1 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '""')= #(2 0  2).
]

{ #category : 'testing' }
AOC2015Day8Test >> testExample2 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '"abc"')= #(5  3  2).
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> testExample3 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '"aaa\"aaa"')= #(10  7  3).
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> testExample4 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check:  '"\x27"')= #(6  1  5).
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> testSolve1 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc solve1)= 1333.
]
