Class {
	#name : 'Day17Morph',
	#superclass : 'Morph',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
Day17Morph >> click: anEvent [
 ^ True



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
 ^ True



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

]

{ #category : 'initialization' }
Day17Morph >> handlesMouseDown: anEvent [
 ^ True .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseEnter: anEvent [
 ^ True .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseLeave: anEvent [
 ^ True .


]

{ #category : 'initialization' }
Day17Morph >> handlesMouseOver: anEvent [
 ^ True .


]

{ #category : 'initialization' }
Day17Morph >> initialize [ 
 super initialize.
 self extent: (200@200).


]

{ #category : 'initialization' }
Day17Morph >> keyStroke: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseDown: anEvent [
"also handleMouseDown: anEvent "
"which is about system framework level code "
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseEnter: anEvent [
 anEvent hand newKeyboardFocus: self .


]

{ #category : 'initialization' }
Day17Morph >> mouseEnterDragging: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseLeave: anEvent [
 anEvent hand newKeyboardFocus: nil .


]

{ #category : 'initialization' }
Day17Morph >> mouseLeaveDragging: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseMove: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseOver: anEvent [
 ^ True .


]

{ #category : 'initialization' }
Day17Morph >> mouseStillDown: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> mouseUp: anEvent [
 ^ True



]

{ #category : 'initialization' }
Day17Morph >> startDrag: anEvent [
 ^ True



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
