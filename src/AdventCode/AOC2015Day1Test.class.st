Class {
	#name : 'AOC2015Day1Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day1Test >> testSolution1Part1 [
	self assert: (AOC2015Day1 new solution1Part1 = 280)  description: 'expect 280 answer'
]

{ #category : 'tests' }
AOC2015Day1Test >> testSolution1Part2 [
	self assert: (AOC2015Day1 new solution1Part2 = 1797)  description: 'expect 1797 answer'
]
