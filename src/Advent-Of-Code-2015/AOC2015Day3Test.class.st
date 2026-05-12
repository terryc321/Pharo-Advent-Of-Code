Class {
	#name : 'AOC2015Day3Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'tests' }
AOC2015Day3Test >> testSolution1Part1 [
	"reify class -- AOC2015Day3Test becomes AOC2015Day3.  
	bit more fancy way of doing things , does it give us anything really , quite complex"

	| classString originalClassString dayClass s1 s2 |
	classString := self className.
	s1 := classString.
	s2 := s1 copyFrom: 1 to: s1 size - 'Test' size.
	dayClass := Smalltalk at: s2 asSymbol.
	self
		assert: dayClass new solution1Part1 = 2565
		description: 'expect 2565 answer'
]

{ #category : 'tests' }
AOC2015Day3Test >> testSolution1Part2 [

	self
		assert: AOC2015Day3 new solution1Part2 = 2639
		description: 'expect 2639 answer'
]

{ #category : 'tests' }
AOC2015Day3Test >> testSolution2Part1 [
	self
		assert: AOC2015Day3 new solution2Part1 = 2565
		description: 'expect 2565 answer'
		
	
]

{ #category : 'tests' }
AOC2015Day3Test >> testSolution2Part2 [
	self
		assert: AOC2015Day3 new solution2Part2 = 2639
		description: 'expect 2639 answer'
		
		
		
		
	
]
