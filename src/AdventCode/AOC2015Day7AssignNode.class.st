Class {
	#name : 'AOC2015Day7AssignNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7AssignNode >> compute [ 
 "ASSIGN node left "
 (self left ready) ifFalse:[ self left compute ].
 self val: (self left val).
 ^ val 



]

{ #category : 'initialization' }
AOC2015Day7AssignNode >> isAssignNode [ 
 ^ true

]
