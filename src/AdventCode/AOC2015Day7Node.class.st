"
parent node for all children 
```
{ and or not lshift rshift assign nodes }
```


"
Class {
	#name : 'AOC2015Day7Node',
	#superclass : 'Object',
	#instVars : [
		'children',
		'ready',
		'val'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7Node >> addChild: x [
 children add: x .

 

]

{ #category : 'initialization' }
AOC2015Day7Node >> children [
 ^ children




 

]

{ #category : 'initialization' }
AOC2015Day7Node >> children: aCollection [
 children := aCollection 





 

]

{ #category : 'initialization' }
AOC2015Day7Node >> compute [
 ^ self subclassResponsibility 

]

{ #category : 'initialization' }
AOC2015Day7Node >> initialize [ 
 children := OrderedCollection new.
 ready := false.
 val := nil .





]

{ #category : 'initialization' }
AOC2015Day7Node >> isNode [ 
 ^ true



]

{ #category : 'initialization' }
AOC2015Day7Node >> ready [
 ^ ready
]

{ #category : 'initialization' }
AOC2015Day7Node >> ready: x [
 ready := x 

]

{ #category : 'initialization' }
AOC2015Day7Node >> val [
 ^ val




]

{ #category : 'initialization' }
AOC2015Day7Node >> val: x [
 val := x 



]
