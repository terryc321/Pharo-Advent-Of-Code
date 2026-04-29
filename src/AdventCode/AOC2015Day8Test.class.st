Class {
	#name : 'AOC2015Day8Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> example1 [
| s |
s := '""' .
self assert: (AOC2015Day8 countChars: s) = 2 .
self assert: (AOC2015Day8 countCharsInMemory: s) = 0 .
self assert: (AOC2015Day8 countDifference: s) = 2 .
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> example2 [
| s |
s := '"abc"' .
self assert: (AOC2015Day8 countChars: s) = 5 .
self assert: (AOC2015Day8 countCharsInMemory: s) = 3 .
self assert: (AOC2015Day8 countDifference: s) = 2 .
]
