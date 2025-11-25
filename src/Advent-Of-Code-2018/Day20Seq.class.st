Class {
	#name : 'Day20Seq',
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
Day20Seq >> compute: aSet [
 | pts result |
 pts := aSet copy. 
 Transcript show: 'SEQ : at node ' ; show: (self id) ; cr . 
 "may be a sequence of ALT nodes in which case there will be alternative paths taken"
 "hence alternative end points reached"
 computed ifNil:[
	| pts2 |
	pts2 := { 0@0 } asSet. 
	Processor yield.
	elems do: [ :e | 
		pts2 := e compute: pts2.
	 ].
  computed := pts2.
	].
	
	"computed defined now - a set of points where we end up. "	
	"for each point in pts do . for each point in pts2 do "
	result := Set new . 
	pts do: [ :aPoint | 
		| xy |
		computed do: [ :aPoint2 | 
			xy := aPoint + aPoint2 .
			result add: xy . 
			 ].
		 ].
 ^ result .
 
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
