Class {
	#name : 'AOC2015Day7Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day7Test >> testInterAnd [
 |aoc|
aoc := AOC2015Day7 new.
aoc reset.
aoc parseAssign: 'lf -> 32'.
aoc parseAssign: 'hs -> 54'.
aoc parseAnd: 'lf AND hs -> gf'.
aoc lookup: #gf.

	

]

{ #category : 'tests' }
AOC2015Day7Test >> testParseAnd [
 |aoc|
aoc := AOC2015Day7 new.
aoc parseAnd: 'lf AND hs -> gf'.



	

]

{ #category : 'tests' }
AOC2015Day7Test >> testSolution1Part1 [
	self assert: (AOC2015Day5 new solution1Part1 = 280)  description: 'expect 280 answer'
	

]

{ #category : 'tests' }
AOC2015Day7Test >> testSolution1Part2 [
	self assert: (AOC2015Day5 new solution1Part2 = 1797)  description: 'expect 1797 answer'
	

]
