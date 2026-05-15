Class {
	#name : 'AOC2018Day17Graphics',
	#superclass : 'Object',
	#instVars : [
		'aSpace',
		'circle',
		'rectangle'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'examples' }
AOC2018Day17Graphics class >> example [
^ self new create.

]

{ #category : 'examples' }
AOC2018Day17Graphics class >> exampleExample [
^ self new createExample.

]

{ #category : 'examples' }
AOC2018Day17Graphics class >> exampleInput [
^ self new createInput.

]

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> create [
^ self shouldNotImplement .

"
	aSpace := BlSpace new.
	aSpace show. ""Edit the space's properties, like title and size""
	aSpace title: 'Bloc basics'.
	aSpace extent: 800 @ 600. ""Create a red rectangle""
	rectangle := BlElement new
		             background: Color red;
		             extent: 150 @ 150;
		             yourself. ""Add it to the space""
	aSpace root addChild: rectangle. ""Update its properties""
	rectangle
		background: Color lightBlue;
		position: 100 @ 100;
		border: (BlBorder paint: Color blue width: 10).
	circle := BlElement new
		          background: Color blue;
		          geometry: BlCircleGeometry new;
		          extent: 80 @ 80;
		          yourself.
	rectangle addChild: circle.
	rectangle clipChildren: false.

	circle transformDo: [ :builder | builder scaleBy: 1.2 ]
	"
]

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> createExample [

	| dict aoc |
	aoc := AOC2018Day17 new.
	dict := aoc parseLines: aoc example. "add sprinkler"
	dict at: 500 @ 0 put: #sprinkler.
	^ self render: (aoc solve: dict)
	

]

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> createInput [

	| dict aoc |
	aoc := AOC2018Day17 new.
	dict := aoc parseLines: aoc input. "add sprinkler"
	dict at: 500 @ 0 put: #sprinkler.
	^ self render: (aoc solve: dict)
]

{ #category : 'rendering' }
AOC2018Day17Graphics >> render: day17 [
| minX minY maxX maxY bricks root scaleX scaleY offsetX offsetY brickWidth brickHeight windowSize |
"find min max of x ?? or just "

[ day17 dictionary keysDo: [ :pt | 
		| x y | 
		x := pt x.
		y := pt y.
		minX ifNil: [ minX := x ].
		maxX ifNil: [ maxX := x ].
		minY ifNil: [ minY := y ].
		maxY ifNil: [ maxY := y ].
		x < minX ifTrue:[ minX := x ].
		x > maxX ifTrue:[ maxX := x ].
		y < minY ifTrue:[ minY := y ].
		y > maxY ifTrue:[ maxY := y ].
		 ]
	  ] value.

minX := minX - 5. 
maxX := maxX + 5. 
minY := minY - 5.
maxY := maxY + 5.
"now have region of 2d grid we are going to use - can we just position and extent ?"
"maybe have sliders and such what not to do this - with connectors ? announcements ? "

"create window"
	aSpace := BlSpace new.
	aSpace show. "Edit the space's properties, like title and size"
	aSpace title: 'Bloc basics'.
	aSpace extent: 800 @ 600. 
	root := aSpace root.

"set view "
		brickWidth := 20.
		brickHeight := 20.
		scaleX := brickWidth.
		scaleY := brickHeight.
		offsetX := (minX * brickWidth) .
		offsetY := (minY * brickHeight) .
	
"make some bricks"
bricks := OrderedCollection new.
day17 dictionary keysDo: [ :pt | 
		| x y brick  | 
		x := pt x * scaleX - offsetX.
		y := pt y * scaleY - offsetY.
		brick := (BlElement new
		             background: (((day17 dictionary at: pt) = #brick) ifTrue:[ Color red] ifFalse:[ Color blue]);
		             position: x@y ;
		             extent: brickWidth @ brickHeight;
		             yourself). 
      bricks add: brick.
    	root addChild: brick 
  ].

"Retrieve the current size"
windowSize := aSpace extent.
"windowSize is a BlExtent (e.g., 400@300)"


0 to: (windowSize x)	by: brickWidth do: [ :x | 
		| lineElement | 
		lineElement := (BlLineGeometry from: (x @ 0) to: (x @ (windowSize y))) asElement .
		lineElement border: (BlBorder paint: Color green width: 2).
		root addChild: lineElement.
		].
0 to: (windowSize y)	by: brickHeight do: [ :y | 
		| lineElement | 
		lineElement := (BlLineGeometry from: (0 @ y) to: ((windowSize x)@y)) asElement .
		lineElement border: (BlBorder paint: Color green width: 2).
		root addChild: lineElement.
		].
	
"	
root addChild: (BlElement new
		             background: Color pink;
		             position: 50@50 ;
		             extent:  50@50 ; 
		             yourself). 
"

		
root addEventHandler: (BlEventHandler on: BlSpaceResizedEvent do: [ :anEvent | 
    Transcript show: 'Resized to: ', anEvent newExtent printString; cr ]).
		
^ aSpace.		

]
