Class {
	#name : 'Day20Seq',
	#superclass : 'Object',
	#instVars : [
		'elems',
		'id'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialize' }
Day20Seq >> compute: aSet [
 | pts |
 pts := aSet copy. 
 Transcript show: 'SEQ : at node ' ; show: (self id) ; cr . 
 elems do: [ :e | 
		
		Processor yield.
	pts := e compute: pts .
	 ].
 ^pts .
 
]

{ #category : 'instance creation' }
Day20Seq >> from: aCollection [
 elems := OrderedCollection new: (aCollection size) .
 aCollection do: [ :e | elems add: e ].

]

{ #category : 'accessing' }
Day20Seq >> id [ 
 ^ id 
]

{ #category : 'accessing' }
Day20Seq >> id: n [ 
 id := n .
 
]
