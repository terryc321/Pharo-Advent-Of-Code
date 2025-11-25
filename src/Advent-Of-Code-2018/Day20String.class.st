Class {
	#name : 'Day20String',
	#superclass : 'Object',
	#instVars : [
		'elems',
		'id',
		'computed'
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
 computed ifNil:[
	| pt from to|
	pt := 0@0. 
	"for each letter in string apply corresponding "
 elems do: [ :e | 
	from := pt .
	e = $N ifTrue:[pt := ((pt x)+0)@((pt y)+1) ].
	e = $S ifTrue:[pt := ((pt x)+0)@((pt y)-1) ].
	e = $W ifTrue:[pt := ((pt x)-1)@((pt y)-0) ].
	e = $E ifTrue:[pt := ((pt x)+1)@((pt y)-0) ].
	e = $? ifTrue:[].	
	to := pt . 
	"record path taken if wish - for now just record where point ended up"
	 ]. computed := pt . ].

 "computed now defined"
 "for each point add where it ends up given transformation we have seen"  
   ^ pts collect: [ :aPoint | 
	      | x y | 
	      x := (aPoint x) + (computed x).
		    y := (aPoint y) + (computed y).
		    x @ y .
	].

  
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
