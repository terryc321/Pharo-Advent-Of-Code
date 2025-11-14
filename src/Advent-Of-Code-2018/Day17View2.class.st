"
use sparta canvas instead of having thousands of BlElements on screen to represent the
state of the puzzle
where the water is flowing etc will be painted rectangles rather than full blown BlElement classes
simply for performance also dont know what use it would be 
to be able to have so many elements


"
Class {
	#name : 'Day17View2',
	#superclass : 'BlElement',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
Day17View2 >> brokenDrawOn: aeCanvas [
 "lets see if this does anything"

	"Draw triangles at the edges."

	|r|
	r := self horizontal
		ifTrue: [self bounds insetBy: (2@1 corner: 2@1)]
		ifFalse: [self bounds insetBy: (1@2 corner: 1@2)].
	aCanvas
		drawPolygon: (self leftOrTopVertices: self bounds)
		fillStyle: self borderColor;
		drawPolygon: (self leftOrTopVertices: r)
		fillStyle: self fillStyle;
		drawPolygon: (self rightOrBottomVertices: self bounds)
		fillStyle: self borderColor;
		drawPolygon: (self rightOrBottomVertices: r)
		fillStyle: self fillStyle

]

{ #category : 'initialization' }
Day17View2 >> click [
 Transcript show: 'hey you clicked me !'
]

{ #category : 'initialization' }
Day17View2 >> initialize [
	"inspiration from https://books.pharo.org/booklet-ASimpleMemoryGameInBloc/2024-06-05-ASimpleBlocTutorial.pdf"
	super initialize.
	self extent: 50 @ 50. 
	self background: Color black.
	self geometry: BlRectangleGeometry new.
	self addEventHandlerOn: BlClickEvent do: [ :anEvent | self click ].
	"i just added this"
  "and this "
]
