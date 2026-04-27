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
		'dict',
		'ready',
		'val'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7Node >> addDependent: x [
 dict add: x .

 

]

{ #category : 'initialization' }
AOC2015Day7Node >> compute [
 ^ self subclassResponsibility 

]

{ #category : 'initialization' }
AOC2015Day7Node >> dependents [ 
 ^ dict



 

]

{ #category : 'initialization' }
AOC2015Day7Node >> initialize [ 
 dict := Dictionary new.
 ready := false.
 val := nil .



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
