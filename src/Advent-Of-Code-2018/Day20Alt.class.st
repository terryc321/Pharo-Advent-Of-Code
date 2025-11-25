Class {
	#name : 'Day20Alt',
	#superclass : 'Object',
	#instVars : [
		'elems',
		'id',
		'computed'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialize' }
Day20Alt >> compute: pts [
 | union |
 union := Set new. 
Transcript show: 'ALT at node ' ; show: (self id asString) ; cr . 
 elems do: [ :e | 	 
	 Processor yield.
	 (e compute: pts) collect: [ :pt | union add: pt ].
	 ].
 ^ union .

 
]

{ #category : 'instance creation' }
Day20Alt >> from: aCollection [
 elems := OrderedCollection new: (aCollection size) .
 aCollection do: [ :e | elems add: e ].

]

{ #category : 'accessing' }
Day20Alt >> id [ 
 ^ id 
]

{ #category : 'accessing' }
Day20Alt >> id: n [ 
 id := n .
 
]
