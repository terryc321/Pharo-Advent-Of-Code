Class {
	#name : 'Day17Morph',
	#superclass : 'Morph',
	#instVars : [
		'dat'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
Day17Morph >> click: anEvent [
Transcript show: 'mouse click ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> containsPoint: aPoint [ 
 | position rect0 midpoint extent farCorner|
  "if morph contains point - ask its rectangle if it knows "
 position := self position.
 extent := self extent .
 midpoint := self position + (extent / 2).
 farCorner := position + extent . 
 rect0 := (position corner: farCorner).
 ^ rect0 containsPoint: aPoint . 

]

{ #category : 'initialization' }
Day17Morph >> doubleClick: anEvent [
Transcript show: 'mouse double click ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> drawOn: aCanvas [ 
  | position rect0 rect1 rect2 midpoint extent farCorner|
 position := self position.
 extent := self extent .
 midpoint := self position + (extent / 2).
 farCorner := position + extent . 
 rect0 := (position corner: farCorner).
 rect1 := (position corner: midpoint). 
 rect2 := (midpoint corner: farCorner).
 aCanvas fillRectangle: rect0 color: (Color black). 
 aCanvas fillRectangle: rect1 color: (Color green).
 aCanvas fillRectangle: rect2 color: (Color red).

" for all points in diagram starting from top left (dat minX , dat minY) to (dat maxX , dat maxY)"
dat ifNotNil: [ 

dat points do: [ :pt | 
		| xy local_xy local_xy2 okX okY |
		xy := ((pt - ((dat minX)@(dat minY))) * 10) .
		okX := (xy x) < 400 and: [ (xy x) >= 0 ].
		okY := (xy y) < 400 and: [ (xy y) >= 0 ].
		(okX and:[ okY ifTrue: [
				local_xy := xy + position. 
				local_xy2 := local_xy + (10@10).
             aCanvas fillRectangle: (local_xy @ local_xy2) color: (Color brown ).				
				]])      
		 ] 
	]
	 


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseClick: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseDoubleClick: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseDown: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseEnter: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseLeave: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseOver: anEvent [
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> initialize [ 
 super initialize.
 self extent: (200@200).


]

{ #category : 'initialization' }
Day17Morph >> keyStroke: anEvent [
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseDown: anEvent [
"also handleMouseDown: anEvent "
"which is about system framework level code "
Transcript show: 'mouse down ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseEnter: anEvent [
 anEvent hand newKeyboardFocus: self .
Transcript show: 'mouse entered ' ; show: anEvent ; cr . 



]

{ #category : 'initialization' }
Day17Morph >> mouseEnterDragging: anEvent [
Transcript show: 'mouse entered dragging ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseLeave: anEvent [
 anEvent hand newKeyboardFocus: nil .
Transcript show: 'mouse leave ' ; show: anEvent ; cr . 


]

{ #category : 'initialization' }
Day17Morph >> mouseLeaveDragging: anEvent [
Transcript show: 'mouse leave dragging ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseMove: anEvent [
Transcript show: 'mouse move ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseOver: anEvent [
Transcript show: 'mouse over ' ; show: anEvent ; cr . 
 ^ true .


]

{ #category : 'initialization' }
Day17Morph >> mouseStillDown: anEvent [
Transcript show: 'mouse still down ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> mouseUp: anEvent [
Transcript show: 'mouse up ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> plot: anObject [
  dat := anObject. 



]

{ #category : 'initialization' }
Day17Morph >> startDrag: anEvent [
Transcript show: 'mouse start drag ' ; show: anEvent ; cr . 
 ^ true



]

{ #category : 'initialization' }
Day17Morph >> step [
"do something if we are asked to startStepping / stopStepping" 



]

{ #category : 'initialization' }
Day17Morph >> stepTime [
"in milliseconds" 
 ^ 1000 


]

{ #category : 'initialization' }
Day17Morph >> wantsSteps [ 
 ^ false


]

{ #category : 'initialization' }
Day17Morph >> wantsStepsWhenCollapsed [ 
 ^ false



]
