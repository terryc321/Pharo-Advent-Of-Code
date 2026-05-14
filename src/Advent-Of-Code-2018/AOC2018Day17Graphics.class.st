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

	aSpace := BlSpace new.
	aSpace show. "Edit the space's properties, like title and size"
	aSpace title: 'Bloc basics'.
	aSpace extent: 800 @ 600. "Create a red rectangle"
	rectangle := BlElement new
		             background: Color red;
		             extent: 150 @ 150;
		             yourself. "Add it to the space"
	aSpace root addChild: rectangle. "Update its properties"
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
]

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> createExample [ 
| dict aoc minX minY maxX maxY bricks |
aoc := AOC2018Day17 new.
dict := (aoc parseLines: (aoc example)).
"find min max of x ?? or just "

[ dict keysDo: [ :pt | 
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
	
"make some bricks"
bricks := OrderedCollection new.
dict keysDo: [ :pt | 
		| x y brick scaleX scaleY offsetX offsetY brickWidth brickHeight | 
		brickWidth := 10.
		brickHeight := 10.
		scaleX := 10.
		scaleY := 10.
		offsetX := -500 .
		offsetY := -5 .
		x := pt x * scaleX + offsetX.
		y := pt y * scaleY + offsetY.
		brick := (BlElement new
		             background: Color red;
		             position: x@y ;
		             extent: brickWidth @ brickHeight;
		             yourself). 
      bricks add: brick.
    	aSpace root addChild: brick 
  ].

^ aSpace.		

]

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> createInput [

	aSpace := BlSpace new.
	aSpace show. "Edit the space's properties, like title and size"
	aSpace title: 'Bloc basics'.
	aSpace extent: 800 @ 600. "Create a red rectangle"
	rectangle := BlElement new
		             background: Color red;
		             extent: 150 @ 150;
		             yourself. "Add it to the space"
	aSpace root addChild: rectangle. "Update its properties"
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
]
