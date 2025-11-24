Class {
	#name : 'Day20Seq',
	#superclass : 'Object',
	#instVars : [
		'elems'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialize' }
Day20Seq >> compute: aSet [
 | pts |
 pts := aSet copy. 
 elems do: [ :e | 
	pts := e compute: pts .
	 ].
 ^pts .
 
]

{ #category : 'instance creation' }
Day20Seq >> from: aCollection [
 elems := OrderedCollection new: (aCollection size) .
 aCollection do: [ :e | elems add: e ].

]
