Class {
	#name : 'AOC2015Day7NotNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7NotNode >> compute [ 
 "NOT node left "
 (self left ready) ifTrue:[ 
	 self val: (0 - (self left val) - 1) ]


]

{ #category : 'initialization' }
AOC2015Day7NotNode >> isNotNode [ 
 ^ true


]
