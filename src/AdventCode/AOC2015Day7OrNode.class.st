Class {
	#name : 'AOC2015Day7OrNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7OrNode >> compute [ 
 "OR node left / right "
 ((self left ready) and: (self right ready)) ifTrue: [ 
	self val: ((self left val) bitOr: (self right val)) ]


]

{ #category : 'initialization' }
AOC2015Day7OrNode >> isOrNode [ 
 ^ true


]
