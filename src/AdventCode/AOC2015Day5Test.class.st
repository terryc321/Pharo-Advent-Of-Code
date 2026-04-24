Class {
	#name : 'AOC2015Day5Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day5Test >> testContainsThreeVowels [

	self assert: (AOC2015Day5 new containsThreeVowels: 'aei').
	self assert: (AOC2015Day5 new containsThreeVowels: 'xazegov').
	self assert: (AOC2015Day5 new containsThreeVowels: 'aeiouaeiouaeiou').
	
	
	

]

{ #category : 'tests' }
AOC2015Day5Test >> testOneLetterTwiceInARow [

	| aoc |
	aoc := AOC2015Day5 new.
	self assert: (aoc oneLetterTwiceInARow: 'aei')
]

{ #category : 'tests' }
AOC2015Day5Test >> testSolution1Part1 [
	self assert: false.
	

]

{ #category : 'tests' }
AOC2015Day5Test >> testSolution1Part2 [
	self assert: false.
	

]
