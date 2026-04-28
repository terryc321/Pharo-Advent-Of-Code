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

	| aoc p p2|
	aoc := AOC2015Day7 new.
	p := aoc parseAnd: 'lf AND hs -> gf'.
	self assert: (p at: 1) = #lf.
	self assert: (p at: 3) = #hs.
	self assert: (p at: 5) = #gf.
	
	p2 := aoc parseAnd: 'hs AND 3 -> ge'.
	self assert: (p2 at: 1) = #hs.
	self assert: (p2 at: 3) = 3.
	self assert: (p2 at: 5) = #ge.
]

{ #category : 'tests' }
AOC2015Day7Test >> testParseAssign [

	| aoc p |
	aoc := AOC2015Day7 new.
	p := aoc parseAssign: 'lf -> gf'.
	self assert: (p at: 1) = #lf.
	self assert: (p at: 3) = #gf.
	
	aoc parse: '3 -> ge'.
	self assert: (aoc dict at: #ge) isNode.
	

]

{ #category : 'tests' }
AOC2015Day7Test >> testParseLShift [

	| aoc p p2|
	aoc := AOC2015Day7 new.
	p := aoc parseLShift: 'lf LSHIFT hs -> gf'.
	self assert: (p at: 1) = #lf.
	self assert: (p at: 3) = #hs.
	self assert: (p at: 5) = #gf.
	
	p2 := aoc parseLShift: 'hs LSHIFT 3 -> ge'.
	self assert: (p2 at: 1) = #hs.
	self assert: (p2 at: 3) = 3.
	self assert: (p2 at: 5) = #ge.
	
]

{ #category : 'tests' }
AOC2015Day7Test >> testParseNot [

	| aoc p |
	aoc := AOC2015Day7 new.
	p := aoc parseNot: 'NOT hg -> ef'.
	self assert: (p at: 2) = #hg.
	self assert: (p at: 4) = #ef.
	
]

{ #category : 'tests' }
AOC2015Day7Test >> testParseOr [

	| aoc p p2|
	aoc := AOC2015Day7 new.
	p := aoc parseOr: 'lf OR hs -> gf'.
	self assert: (p at: 1) = #lf.
	self assert: (p at: 3) = #hs.
	self assert: (p at: 5) = #gf.
	
	p2 := aoc parseOr: 'hs OR 3 -> ge'.
	self assert: (p2 at: 1) = #hs.
	self assert: (p2 at: 3) = 3.
	self assert: (p2 at: 5) = #ge.
]

{ #category : 'tests' }
AOC2015Day7Test >> testParseRShift [

	| aoc p p2|
	aoc := AOC2015Day7 new.
	p := aoc parseRShift: 'lf RSHIFT hs -> gf'.
	self assert: (p at: 1) = #lf.
	self assert: (p at: 3) = #hs.
	self assert: (p at: 5) = #gf.
	
	p2 := aoc parseRShift: 'hs RSHIFT 3 -> ge'.
	self assert: (p2 at: 1) = #hs.
	self assert: (p2 at: 3) = 3.
	self assert: (p2 at: 5) = #ge.
	
]

{ #category : 'tests' }
AOC2015Day7Test >> testPart1 [

	| aoc lines |
	aoc := AOC2015Day7 new.
	lines := aoc puzzleInput.
	lines do: [ :aline | aoc parseLine: aline ].
	lines do: [ :aline | aoc parseLine2: aline ].
	aoc parseLine3.
	aoc dict at: #a.
	self assert: (aoc dict at: #a) compute = 16076
]

{ #category : 'tests' }
AOC2015Day7Test >> testPart2 [
"over=ride b with result from part1 "
	| aoc lines |
	aoc := AOC2015Day7 new.
	lines := aoc puzzleInput.
	lines do: [ :aline | aoc parseLine: aline ].
	lines do: [ :aline | aoc parseLine2: aline ].
	aoc parseLine3.
	(aoc dict at: #b) left val: 16076.
	self assert: ((aoc dict at: #a) compute) = 2797 .
	
]

{ #category : 'tests' }
AOC2015Day7Test >> testSolution1Part1 [
	self assert: (AOC2015Day5 new solution1Part1 = 280)  description: 'expect 280 answer'
	

]

{ #category : 'tests' }
AOC2015Day7Test >> testSolution1Part2 [
	self assert: (AOC2015Day5 new solution1Part2 = 1797)  description: 'expect 1797 answer'
	

]
