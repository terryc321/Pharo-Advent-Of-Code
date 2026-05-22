Class {
	#name : 'AOC2015Day15Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day15Test >> testBrute [
| aoc |
aoc := AOC2015Day15 new.
aoc brute: [ self assert:(((aoc bestCol) at: 1) at: 8) = 13882464 ].
self assert: true = false.
]
