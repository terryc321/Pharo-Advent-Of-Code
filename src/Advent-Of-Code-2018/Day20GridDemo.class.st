"
Presumably need to load Bloc into pharo14
this will install the help 
From Help menu at top of window - Bloc - 1 - Getting started 

shows BlElement example .

can we get a live view of BlElement from inside inspector ?



 
"
Class {
	#name : 'Day20GridDemo',
	#superclass : 'BlElement',
	#instVars : [
		'grid'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'as yet unclassified' }
Day20GridDemo >> drawOnSpartaCanvas: aCanvas [
    "Big blue background rectangle"
    aCanvas fill
        paint: (Color blue alpha: 0.9);
        path: (0@0 corner: self extent);
    draw.

	"Smaller red rectangle inside (centered)"
    aCanvas fill
        paint: (Color red alpha: 0.9);
        path: (self extent / 4 corner: self extent * 0.75);
      draw .

]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example [ 
| demo |
<demo>
<sampleInstance>
demo := Day20GridDemo new. " background: Color blue."
^ demo.


]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example10 [
	<demo>
	<sampleInstance>
	| rectangle sz sz2 nx ny |
	rectangle := BlElement new
		             background: Color black;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	nx := 50 .
	ny := 50 .
	sz := 10.
	sz2 := 8. "slightly smaller "
	1 to: nx do: [ :y |
		1 to: ny do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * sz)@(y * sz) ; 
		          extent: sz2 @ sz2;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | (event target) background: Color purple  ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target  ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example11 [
	<demo>
	<sampleInstance>
	| rectangle sz sz2 nx ny |
	rectangle := BlElement new
		             background: Color black;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	nx := 100 .
	ny := 100 .
	sz := 10.
	sz2 := 8. "slightly smaller "
	1 to: nx do: [ :y |
		1 to: ny do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * sz)@(y * sz) ; 
		          extent: sz2 @ sz2;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | (event target) background: Color purple  ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target  ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example12 [
	<demo>
	<sampleInstance>
	| rectangle sz sz2 nx ny |
	rectangle := BlElement new
		             background: Color black;
		             extent: 1024 @ 768;
		             yourself. "Create a red rectangle"
	nx := 50 .
	ny := 50 .
	sz := 10.
	sz2 := 9. "slightly smaller "
	1 to: nx do: [ :y |
		1 to: ny do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * sz)@(y * sz) ; 
		          extent: sz2 @ sz2;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | (event target) background: Color purple  ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target  ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example2 [
	<demo>
	<sampleInstance>
	| rectangle circle |
	rectangle := BlElement new
		             background: Color red;
		             extent: 500 @ 500;
		             yourself. "Create a red rectangle"
	rectangle
		background: Color lightBlue;
		position: 100 @ 100;
		border: (BlBorder paint: Color blue width: 10).
	circle := BlElement new
		          background: Color green;
		          geometry: BlCircleGeometry new;
		          extent: 80 @ 80;
		          yourself.
	rectangle addChild: circle.
	rectangle clipChildren: false.
circle transformDo: [ :builder | builder scaleBy: 1.2 ].

	^ rectangle
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example3 [ 
	<demo>
	<sampleInstance>
	| rectangle circle fallAnimation climbAnimation animationSequence |
	rectangle := BlElement new
		             background: Color red;
		             extent: 500 @ 500;
		             yourself. "Create a red rectangle"
	rectangle
		background: Color lightBlue;
		position: 100 @ 100;
		border: (BlBorder paint: Color blue width: 10).
	circle := BlElement new
		          background: Color green;
		          geometry: BlCircleGeometry new;
		          extent: 80 @ 80;
		          yourself.
	rectangle addChild: circle.
	rectangle clipChildren: false.
circle transformDo: [ :builder | builder scaleBy: 1.2 ].
"Animate opacity"
rectangle addAnimation: (BlOpacityAnimation new opacity: 0.5).

"Animate transformations"
fallAnimation := (BlTransformAnimation translate: 0 @ 200) absolute.
rectangle addAnimation: fallAnimation.
climbAnimation := (BlTransformAnimation translate: 0 @ 0) absolute.
rectangle addAnimation: climbAnimation.

"Create a sequence of animations"
animationSequence := BlSequentialAnimation withAll: { fallAnimation. climbAnimation }.
animationSequence beInfinite.
rectangle addAnimation: animationSequence.

	^ rectangle
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example4 [ 
	<demo>
	<sampleInstance>
	| rectangle rectangle2 |
	rectangle := BlElement new
		             background: Color red;
		             extent: 200 @ 200;
		             yourself. "Create a red rectangle"
	
	rectangle2 := BlElement new
		          background: Color green;
		          geometry: BlCircleGeometry new;
			        position: 30@30 ; 
		          extent: 50 @ 50;
		          yourself.
	rectangle addChild: rectangle2.
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example5 [ 
	<demo>
	<sampleInstance>
	| rectangle rectangle2 rectangle3 |
	rectangle := BlElement new
		             background: Color red;
		             extent: 200 @ 200;
		             yourself. "Create a red rectangle"
	
	 rectangle2 := BlElement new
		          background: Color green;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: 30@30 ; 
		          extent: 50 @ 50;
		          yourself.
	 rectangle3 := BlElement new
		          background: Color green;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: 100@30 ; 
		          extent: 50 @ 50;
		          yourself.
		
		"Change color on click"
	rectangle2 addEventHandlerOn: BlClickEvent do: [ :event | event target background: Color black ].
		
	rectangle addChild: rectangle2.
   rectangle addChild: rectangle3.
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example6 [ 
	<demo>
	<sampleInstance>
	| rectangle rectangle2 rectangle3 |
	rectangle := BlElement new
		             background: Color red;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	
	 rectangle2 := BlElement new
		          background: Color green;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: 50@50 ; 
		          extent: 200 @ 200;
		          yourself.
	 rectangle3 := BlElement new
		          background: Color green;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: 300@50 ; 
		          extent: 200 @ 200;
		          yourself.
		
		"Change color on click"
	rectangle2 addEventHandlerOn: BlClickEvent do: [ :event | event target background: Color black ].
		"Animate on hover"
		
rectangle3 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | event target addAnimation: (BlOpacityAnimation new opacity: 0.2) ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target addAnimation: (BlOpacityAnimation new opacity: 1.0) ]. 
		
	rectangle addChild: rectangle2.
   rectangle addChild: rectangle3.
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example7 [
	<demo>
	<sampleInstance>
	| rectangle |
	rectangle := BlElement new
		             background: Color black;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	
	1 to: 50 do: [ :y |
		1 to: 50 do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * 40)@(y * 40) ; 
		          extent: 35 @ 35;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | event target addAnimation: (BlOpacityAnimation new opacity: 0.2) ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target addAnimation: (BlOpacityAnimation new opacity: 1.0) ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example8 [
	<demo>
	<sampleInstance>
	| rectangle |
	rectangle := BlElement new
		             background: Color black;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	
	1 to: 50 do: [ :y |
		1 to: 50 do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * 40)@(y * 40) ; 
		          extent: 35 @ 35;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | (event target) background: Color purple  ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target  ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]

{ #category : 'as yet unclassified' }
Day20GridDemo >> example9 [
	<demo>
	<sampleInstance>
	| rectangle sz sz2 |
	rectangle := BlElement new
		             background: Color black;
		             extent: 600 @ 600;
		             yourself. "Create a red rectangle"
	sz := 30.
	sz2 := 28. "slightly smaller "
	1 to: sz do: [ :y |
		1 to: sz do: [ :x | 
			| rect | 
			rect := BlElement new
		          background: Color yellow;
		          "geometry: BlCircleGeometry new;"
		 	        geometry: BlRectangleGeometry new;
			        position: (x * sz)@(y * sz) ; 
		          extent: sz2 @ sz2;
		          yourself.
rect 
	addEventHandlerOn: BlMouseEnterEvent
	do: [ :event | (event target) background: Color purple  ];
	addEventHandlerOn: BlMouseLeaveEvent 
	do: [ :event | event target  ]. 
		
	 rectangle addChild: rect.	
			 ] ].
	
	^rectangle.
	
]
