Class {
	#name : 'Day20Alt',
	#superclass : 'Object',
	#instVars : [
		'elems'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialize' }
Day20Alt >> compute: pts [
 | union |
 union := Set new. 
 elems do: [ :e | 
	 (e compute: pts) collect: [ :pt | union add: pt ].
	 ].
 ^ union .

 
]

{ #category : 'instance creation' }
Day20Alt >> from: aCollection [
 elems := OrderedCollection new: (aCollection size) .
 aCollection do: [ :e | elems add: e ].

]
