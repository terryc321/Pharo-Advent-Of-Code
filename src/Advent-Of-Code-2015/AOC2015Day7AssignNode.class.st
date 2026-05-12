Class {
	#name : 'AOC2015Day7AssignNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day7AssignNode >> compute [ 
 "ASSIGN node left "
	self ready ifTrue: [ ^ self val ].
		Processor yield.
	self left compute .
	self val: (self left val).
	Transcript show: 'computed ' , val printString , 'for Assign node ' , self printString.
	Processor yield.
	^ self val 




]

{ #category : 'initialization' }
AOC2015Day7AssignNode >> isAssignNode [ 
 ^ true

]

{ #category : 'printing' }
AOC2015Day7AssignNode >> printOn: aStream [
	aStream nextPutAll: 'AssignNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.

]
