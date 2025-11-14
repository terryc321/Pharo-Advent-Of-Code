"
use arrow keys left / right 

we present screen a collection of rectangles which are kept in a dictionary called bricks

so we can retrieve x by y rectangle 
```
is bricks even defined ?
bricks at: (x@y) . 


""perhasps to change the backgroun d colour""
""is there even a brick at x y ""
""why use inefficient dictionary and not a 2d grid ?""
(bricks at: (x@y)) background: Color green . 
```


"
Class {
	#name : 'Day17View',
	#superclass : 'Object',
	#instVars : [
		'aSpace',
		'root',
		'bat',
		'ball',
		'bricks',
		'circle',
		'delta',
		'isMovingLeft',
		'isMovingRight',
		'isRunning',
		'duration',
		'isAnimating',
		'balls',
		'model',
		'origin',
		'leftKeyDown',
		'leftKeyDownCounter',
		'box_size',
		'rightKeyDown',
		'rightKeyDownCounter',
		'tick'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
Day17View >> animateLeft [
    | pos | 

    pos := bat position . 
     pos := pos - (delta@0).
     bat position: pos . 


]

{ #category : 'initialization' }
Day17View >> animateRight [
    | pos |

    pos := bat position . 
     pos := pos + (delta@0).
     bat position: pos . 


]

{ #category : 'initialization' }
Day17View >> animateStop [
 "remove all animations from bat"
  #(  bat removeAnimations. ).
 ^ nil . 





]

{ #category : 'initialization' }
Day17View >> ballCount [
 ^ 100 .

]

{ #category : 'initialization' }
Day17View >> boxSize [ 
 "pixels a box will consume N x N pixels where return N "
 ^ box_size . 



]

{ #category : 'initialization' }
Day17View >> boxSize: n [ 
 "pixels a box will consume N x N pixels where return N "
 box_size := n . 



]

{ #category : 'initialization' }
Day17View >> gameHalt [
 isRunning := false . 
 [ Processor terminateActiveProcessNamed: 'GameLoop' ]
    on: Error do: [ :ex | Transcript show: 'No Game Loop process found'; cr ].

"close the window"
 aSpace close.
 



]

{ #category : 'initialization' }
Day17View >> gameLoop [ 

^ true
]

{ #category : 'initialization' }
Day17View >> initGame [ 
 
root removeChildren.

"we recreate every game loop ? u sure ? "
model = nil ifFalse: [ | wid hgt max_wid max_hgt |
	"reset viewing origin "
	 origin := (0@0). 
		max_wid := 20 . 
		max_hgt := 20 . 
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	wid := wid min: max_wid . 
	hgt := hgt min: max_hgt . 
	
	1 to: wid do: [ :x |
			1 to: hgt do: [ :y |
					| rectangle color ox oy top_offset side_offset box_size |
					box_size := self boxSize.
					top_offset := 20.
					side_offset := 20.
					
					" a default color in case color red/ blue below breaks"
					color := Color blue. 
					" if we just use x y we would not see anything"
					" because puzzle has x y values far off screen so we need to compensate"
					" and add min values found so we can see what is going on "
					ox := x + (model minX) + (origin x) .
					oy := y + (model minY) + (origin y) . 
					
					color := (((model points) includes: (ox@oy)) ifTrue: [ Color red ] ifFalse: [Color blue]) .
					rectangle := BlElement new
						             background: color ; 
						             position: ((box_size * x) + side_offset) @ ((box_size * y) + top_offset);
						             extent: box_size @ box_size;
						             yourself.
				   bricks at: (x@y) put: rectangle. 
					root addChild: rectangle .
 		             ] ]
] .

4
]

{ #category : 'initialization' }
Day17View >> initialize [

	super initialize. "make some bricks all random colours "
	tick := 0 .
	isRunning := true . 
  
   "origin for top left square in the domain model  "
   " origin 100@100 means in presentation using model minX , model minY will be (model minX + origin x , model minY + origin Y)"
	origin := (0@0).
   bricks := Dictionary new. 
	box_size := 50 . 
	
	leftKeyDown := False. 
	leftKeyDownCounter := 0 .
	
	rightKeyDown := False.
	rightKeyDownCounter := 0 .
	
	
	
	aSpace := BlSpace new. "make a window "
	root := aSpace root. "access root element"
	aSpace extent: 1024 @ 768. "Set window size to 1024x768 pixels"
	aSpace resizable: false. "thats just mean no?"
	aSpace resizable: true. "surely a more dynamic be better"
	aSpace root background: Color black.
	aSpace title: 'Advent of Code Day17 Puzzle'. " extent: 500@500 . "

	root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | self keyDownEvent: anEvent ]).
	root addEventHandler: (BlEventHandler on: BlKeyUpEvent do: [ :anEvent | self keyUpEvent: anEvent ]).
	"Request focus when initialized"
	"root requestFocus  "
	root focused: true . 
	
	"give the game a ball to keep it happy for now"
	bat := BlElement new
		       background: Color red;
		       position: 400 @ 600;
		       extent: 120 @ 20;
		       yourself.
	root addChild: bat.

 "think delta is a delay for ball movement"
   delta := 100. 
   ball := BallElement new velocity: 10@10 . 
   
	
"aSpace root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | bat keyDownEvent: anEvent ])."
aSpace root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | self keyDownEvent: anEvent ]).

"finally show window "
	aSpace show.
	
"start a background process for game loop"
self gameLoop.	
	

]

{ #category : 'initialization' }
Day17View >> keyDownEvent: anEvent [
	| scanCode |
	
	scanCode := anEvent scanCode . 
	({ 4 . 80 } includes: scanCode)  
	"Left arrow"
		ifTrue: [ 
			    origin := origin - (1@0).
			  Transcript show: 'left arrow pressed ' ; show: origin ; cr . 
			   self reconfigureGame .
			 ].
	({ 7 . 79 } includes: scanCode)  
	"Right arrow"
		ifTrue: [ 
			 origin := origin + (1@0).
			Transcript show: 'right arrow pressed' ; show: origin ; cr . 			    
			   self reconfigureGame .						
			].
		
	({ 81 } includes: scanCode)  "down arrow"
		ifTrue:[
			 origin := origin + (0@1).
				Transcript show: 'down arrow pressed' ; show: origin ; cr . 	
					 self reconfigureGame .
			 ].

	({ 82 } includes: scanCode)  "up arrow"
		ifTrue: [ 
			 origin := origin - (0@1).
	      Transcript show: 'up arrow pressed' ; show: origin ; cr . 
	 self reconfigureGame .
			 ].
	
	({ 45 } includes: scanCode)  "minus key"
		ifTrue: [ 
			 box_size := box_size - 5 . 
			self initGame.
      	 self reconfigureGame .
			 ].
			
		
	"show the key that was pressed"
	"track how far left or right"	
	Transcript show: 'key scancode = ' ; show: anEvent scanCode ; cr.
	anEvent consumed: true  "Prevent event bubbling".
	

]

{ #category : 'initialization' }
Day17View >> keyUpEvent: anEvent [
	| scanCode |	
	scanCode := anEvent scanCode . 
	({ 4 . 80 } includes: scanCode)  "Left arrow"
		ifTrue: [ Transcript show: 'left arrow up' ; show: origin ; cr . 

			       ].
	({ 7 . 79 } includes: scanCode)  "Right arrow"
		ifTrue: [ Transcript show: 'right arrow up' ; show: origin ; cr . 
		      
			 ].
		
	({ 81 } includes: scanCode)  "down arrow"
		ifTrue: [  
				Transcript show: 'down arrow up' ; show: origin ; cr . 	
			 ].

	({ 82 } includes: scanCode)  "up arrow"
		ifTrue: [ 
	      Transcript show: 'up arrow up' ; show: origin ; cr . 
			 ].

		
	"show the key that was pressed"
	Transcript show: 'key scancode = ' ; show: anEvent scanCode ; cr . 
	
	anEvent consumed: true  "Prevent event bubbling".
	

]

{ #category : 'initialization' }
Day17View >> listAnimations [
 self error: 'shouldNotImplement'.
]

{ #category : 'initialization' }
Day17View >> reconfigureGame [

Transcript show: 'reconfiguring the game with origin => ' ; show: origin ; cr . 	

"we recreate every game loop ? u sure ? "
model = nil ifFalse: [ | wid hgt max_wid max_hgt |
		max_wid := ((aSpace width) / (self boxSize)) floor .
		max_hgt := ((aSpace height) / (self boxSize)) floor .
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	wid := wid min: max_wid . 
	hgt := hgt min: max_hgt . 
	
	
Transcript show: 'reconfigured ' ; show: { max_wid .  max_hgt } ; cr . 
	1 to: wid do: [ :x |
			1 to: hgt do: [ :y |
					| rectangle color ox oy top_offset side_offset box_size |
					" a default color in case color red/ blue below breaks"
					color := Color blue. 
   	
					" if we just use x y we would not see anything"
					" because puzzle has x y values far off screen so we need to compensate"
					" and add min values found so we can see what is going on "
					ox := x + (model minX) + (origin x) .
					oy := y + (model minY) + (origin y) . 
			
			" is bricks defined ? "		
			bricks = nil ifFalse:[		
		 rectangle := bricks at: (x@y) . 			
					].
		  rectangle = nil ifFalse:[			
		 rectangle background: (((model points) includes: (ox@oy)) ifTrue: [ Color red ] ifFalse: [Color blue]).
		 " root addChild: rectangle. "
		  ] .
		 ] ]
] . "if we have a model"

  "request next pulse"
 aSpace requestNextPulse.
			

]

{ #category : 'initialization' }
Day17View >> setModel: aModel [
  model := aModel.
  bricks := Dictionary new.
  origin := (0@0).
  self initGame.


  


]

{ #category : 'initialization' }
Day17View >> updateBall [
	| pos x y vx vy board wid hgt removals |

  pos := ball position.
  x := pos x. 
  y := pos y.
  vx := ball vx . 
  vy := ball vy .
  board := aSpace extent.
  wid := board x . 
  hgt := board y . 

  x := x + vx . 
  y := y + vy .

  x < 0 ifTrue: [ vx := 0 - vx ].
  y < 0 ifTrue: [ vy := 0 - vy ].
  x > wid ifTrue: [ vx := 0 - vx . x := wid - delta ].
  y > hgt ifTrue: [ vy := 0 - vy . y := hgt - delta ].

  ball position: x @ y . 
#(
  Transcript show: 'board has size = '; show: board ; cr . 
  Transcript show: 'ball position is '; show: ball position ; cr . 
  Transcript show: 'ball velocity is '; show: ballvx ; show: ',' ; show: ballvy  ; cr . 
).
  ball velocity: vx@vy .

  "have we hit a brick ? "

 "ball position is not a continuous thing , it is discrete one point its here , next tick its over there "
 "is ball in vicinity such that it MAY have touched brick ? "
 removals := OrderedCollection new. 
 bricks do: [ :aBrick | 
	 | bx by bx2 by2 col hit | 
	 bx := aBrick position x.
	 by := aBrick position y.
	 bx2 := (aBrick position + aBrick extent) x . 
    by2 := (aBrick position + aBrick extent) y . 
    col := OrderedCollection new. 
    col add: x > bx . 
    col add: x < bx2 . 
    col add: y > by .
    col add: y < by2 . 
    hit := true . 
    col do: [ :e | 
	      e ifFalse: [ hit := false ] ].
	  
     hit ifTrue: [ 
	        "remove this brick from collection of bricks , remove it from the root of scene "
	      removals add: aBrick. ]].
     removals do: [ :aBrick | 
	      bricks remove: aBrick.
	      root removeChild: aBrick  ].

  "have we hit the bat ? " 
  "assumption is that the ball is above the bat ? "

[  | bx by bx2 by2 col hit | 
	 bx := bat position x.
	 by := bat position y.
	 bx2 := (bat position + bat extent) x . 
    by2 := (bat position + bat extent) y . 
    col := OrderedCollection new. 
    col add: x > bx . 
    col add: x < bx2 . 
    col add: y > by .
    col add: y < by2 . 
    hit := true . 
    col do: [ :e | 
	      e ifFalse: [ hit := false ] ].
	  
     hit ifTrue: [ 	     
	        "ball is moving to right vx > 0 flip vy "
   	        "ball is moving to left vx < 0 flip vy "
	        ball velocity: (ball vx)@(0 - (ball vy)).
	      ]] value.





  "update each ball"
  balls do: [ :aBall | aBall updateBall: aSpace extent  ].

#(Transcript show: 'balls[1] position is '; show: (balls at: 1) position ; cr . ).

   

]

{ #category : 'initialization' }
Day17View >> updateGame [
	

	isMovingLeft ifTrue: [ self animateLeft ].
	isMovingRight ifTrue: [ self animateRight ]. 
	isMovingLeft not and: [ isMovingRight not ifTrue:[ self animateStop ]].
  
   self updateBall.
  
  

]
