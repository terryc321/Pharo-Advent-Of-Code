Class {
	#name : 'AOC2015Day7NotNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7NotNode >> compute [ 
 "NOT node left "
 (self left ready) ifFalse:[ self left compute ].
 self val: (0 - (self left val) - 1).
 ^ val 

]

{ #category : 'initialization' }
AOC2015Day7NotNode >> isNotNode [ 
 ^ true


]
