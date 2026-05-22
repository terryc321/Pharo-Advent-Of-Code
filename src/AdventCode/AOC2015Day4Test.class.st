Class {
	#name : 'AOC2015Day4Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day4Test >> testMD5 [

	self
		assert:
		(MD5 hashMessage: 'The quick brown fox jumps over the lazy dog.')
			hex
		equals: 'e4d909c290d0fb1ca068ffaddf22cbd0'
]

{ #category : 'tests' }
AOC2015Day4Test >> testSolution1Part1 [
| output expected |
output := AOC2015Day4 new solution1Part1 .
expected := 609043 .
	self assert: (output = expected)  description: 'part1'
	
]

{ #category : 'tests' }
AOC2015Day4Test >> testSolution1Part2 [
	self assert: (AOC2015Day1 new solution1Part2 = 1797)  description: 'expect 1797 answer'
]
