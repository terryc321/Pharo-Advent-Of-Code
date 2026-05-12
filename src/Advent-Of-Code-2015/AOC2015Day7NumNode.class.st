Class {
	#name : 'AOC2015Day7NumNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day7NumNode >> compute [ 
 ^ val 



]

{ #category : 'initialization' }
AOC2015Day7NumNode >> isNumNode [ 
 ^ true 

]

{ #category : 'printing' }
AOC2015Day7NumNode >> printOn: aStream [
	aStream nextPutAll: 'NumNode{';
	        nextPutAll: (self val printString);
		     nextPutAll: '}'.
		
]
