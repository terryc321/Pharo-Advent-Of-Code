Class {
	#name : 'AOC2015Day2Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day2Test >> testSolution1Part1 [

	| aoc |
	aoc := AOC2015Day2 new.
	self
		assert: aoc solution1Part1 = 1606483
		description: 'expect 1606483 answer'
]

{ #category : 'tests' }
AOC2015Day2Test >> testSolution1Part2 [

	self
		assert: AOC2015Day2 new solution1Part2 = 3842356
		description: 'expect 3842356 answer'
		
	
]

{ #category : 'tests' }
AOC2015Day2Test >> testcalcTriple [

	| aoc |
	aoc := AOC2015Day2 new.
	self
		assert: (aoc calcTriple: { 2. 3. 4 }) = 58
		description: 'expect 2x3x4 answers 58'.
	self
		assert: (aoc calcTriple: { 1. 1. 10 }) = 43
		description: 'expect 1x1x10 answers 43'
]

{ #category : 'tests' }
AOC2015Day2Test >> testcalcTriple2 [

	| aoc |
	aoc := AOC2015Day2 new.
	self
		assert: (aoc calcTriple2: { 2. 3. 4 }) = 34
		description: 'expect 2x3x4 answers 34'.
	self
		assert: (aoc calcTriple2: { 1. 1. 10 }) = 14
		description: 'expect 1x1x10 answers 14'
]
