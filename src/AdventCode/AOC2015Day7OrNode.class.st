Class {
	#name : 'AOC2015Day7OrNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7OrNode >> compute [ 
 "OR node left / right "
 (self left ready) ifFalse:[ self left compute ].
 (self right ready) ifFalse:[ self right compute ]. 
 self val: ((self left val) bitOr: (self right val)).
 ^ val 

]

{ #category : 'initialization' }
AOC2015Day7OrNode >> isOrNode [ 
 ^ true


]
