Class {
	#name : 'AOC2015Day7NotNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7NotNode >> compute [ 
 "NOT node left "
	self ready ifTrue: [ ^ self val ].
		Processor yield.
	self left compute .
	self val: (self left val bitInvert).
		Transcript show: 'computed ' , val printString , 'for NOT node ' , self printString.
		Processor yield.
	^ self val 
	
	

]

{ #category : 'initialization' }
AOC2015Day7NotNode >> isNotNode [ 
 ^ true


]
