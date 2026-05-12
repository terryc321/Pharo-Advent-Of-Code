Class {
	#name : 'AOC2015Day7NotNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
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

{ #category : 'printing' }
AOC2015Day7NotNode >> printOn: aStream [
	aStream nextPutAll: 'NotNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
]
