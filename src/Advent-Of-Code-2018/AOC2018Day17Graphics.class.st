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

{ #category : 'api - instantiation' }
AOC2018Day17Graphics >> create [ 
aSpace := BlSpace new.
aSpace show.
"Edit the space's properties, like title and size"
aSpace title: 'Bloc basics'.
aSpace extent: 800 @ 600.
"Create a red rectangle"
rectangle := BlElement new 
	background: Color red; 
	size: 150 @ 150;
	yourself.
	
"Add it to the space"
aSpace root addChild: rectangle.

"Update its properties"
rectangle 
	background: Color lightBlue;
	position: 100 @ 100;
	border: (BlBorder paint: Color blue width: 10).
circle := BlElement new
	background: Color blue;
	geometry: BlCircleGeometry new;
	size: 80 @ 80;
	yourself.
rectangle addChild: circle.
rectangle clipChildren: false.

circle transformDo: [ :builder | builder scaleBy: 1.2 ].


]
