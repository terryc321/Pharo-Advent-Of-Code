Class {
	#name : 'AOC2015Day9',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day9 class >> inputFile [
^ (AdventRepository repoDir / '2015' / 'day9'  / 'input.txt') readStreamDo: [:stream | stream contents].
]

{ #category : 'accessing' }
AOC2015Day9 class >> inputLines [
^ self inputFile splitOn: (String lf)
]

{ #category : 'accessing' }
AOC2015Day9 >> puzzleInput [ 
^ ''.

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzleInputParsed [
	"parsed input goes here"
	^ self notYetImplemented 
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzlePart1 [	
^ ' 
'

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzlePart2 [	
^ ' 

'

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> solution1Part1 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> solution1Part2 [

	^ self notYetImplemented
]
