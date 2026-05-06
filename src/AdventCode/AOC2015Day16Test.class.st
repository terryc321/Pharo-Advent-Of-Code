Class {
	#name : 'AOC2015Day16Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day16Test class >> testPart1 [
| aoc |
aoc := AOC2015Day16 new.
self assert: (((aoc part1) at: 1) at: #sue) = 373
]
