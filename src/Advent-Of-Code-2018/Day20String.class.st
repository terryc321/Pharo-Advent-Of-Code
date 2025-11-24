Class {
	#name : 'Day20String',
	#superclass : 'Object',
	#instVars : [
		'elems',
		'id'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'instance creation' }
Day20String >> compute: aSet [
 | pts |
 pts := aSet copy. 
 Transcript show: 'STR : at node ' ; show: self id ; cr . 
 Processor yield.
 "because string not too long - dont envision need processor yield "
 elems do: [ :e | 
	e = $N ifTrue:[pts := pts collect: [ :pt | ((pt x)+0)@((pt y)+1) ]].
	e = $S ifTrue:[pts := pts collect: [ :pt | ((pt x)+0)@((pt y)-1) ]].
	e = $W ifTrue:[pts := pts collect: [ :pt | ((pt x)-1)@((pt y)-0) ]].
	e = $E ifTrue:[pts := pts collect: [ :pt | ((pt x)+1)@((pt y)-0) ]].
	e = $? ifTrue:[].	
	 ].
 ^pts .
 

]

{ #category : 'instance creation' }
Day20String >> from: aString [
 elems := OrderedCollection new: (aString size) .
 aString do: [ :e | elems add: e ].


]

{ #category : 'accessing' }
Day20String >> id [ 
 ^ id 
]

{ #category : 'accessing' }
Day20String >> id: n [  
 id := n .
 
]
