"
use arrow keys left / right 
use keys a / d to move bat left and right

motion of bat seems jerky - solutions ? 

tried animation BlAnimation but using an event loop in background seems to jam it up


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
		'origin'
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
Day17View >> gameHalt [
 isRunning := false . 
 [ Processor terminateActiveProcessNamed: 'GameLoop' ]
    on: Error do: [ :ex | Transcript show: 'No Game Loop process found'; cr ].

"close the window"
 aSpace close.
 



]

{ #category : 'initialization' }
Day17View >> gameLoop [ 
  [ 
    [ 
        [  self updateGame . 
	        "request next pulse"
			 aSpace requestNextPulse.
	
          "(Delay forMilliseconds: 16) wait."
           #(Transcript show: 'tick' ; cr . ).
 	       "wait one second "
          "(Delay forMilliseconds: 1000) wait."          
 	       "wait 16 milliseconds second "
          (Delay forMilliseconds: 16) wait.

          isRunning.  ] whileTrue. 
       "keep looping while last thing evald is true "
    ] on: Error do: [ :ex | Transcript cr; show: ex description ] 
] forkNamed: 'GameLoop'.



]

{ #category : 'initialization' }
Day17View >> initGame [ 
 
root removeChildren.

"we recreate every game loop ? u sure ? "
model = nil ifFalse: [ | wid hgt max_wid max_hgt |
	"reset viewing origin "
	 origin := (0@0). 
		max_wid := 200 . 
		max_hgt := 200 . 
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	wid := wid min: max_wid . 
	hgt := hgt min: max_hgt . 
	
	1 to: wid do: [ :x |
			1 to: hgt do: [ :y |
					| rectangle color ox oy top_offset side_offset box_size |
					box_size := 5.
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
  
   "origin for top left square in the domain model  "
   " origin 100@100 means in presentation using model minX , model minY will be (model minX + origin x , model minY + origin Y)"
	origin := (0@0).
	
	aSpace := BlSpace new. "make a window "
	root := aSpace root. "access root element"
	aSpace extent: 1024 @ 768. "Set window size to 1024x768 pixels"
	aSpace resizable: false. "thats just mean no?"
	aSpace resizable: true. "surely a more dynamic be better"
	aSpace root background: Color blue.
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
		ifTrue: [ Transcript show: 'left arrow down ' ; show: bat position ; cr . 
			       isMovingLeft := true. 
			       isMovingRight := false.
			 ].
	({ 7 . 79 } includes: scanCode)  
	"Right arrow"
		ifTrue: [ Transcript show: 'right arrow down' ; show: bat position ; cr . 
			       isMovingRight := true.
			       isMovingLeft := false.
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
		ifTrue: [ Transcript show: 'left arrow up' ; show: bat position ; cr . 
			     isMovingLeft := false.			     
						origin := origin - (1@0).
	            (origin x ) <= 0 ifTrue:[ origin := (0@ (origin y)) ].
			       ].
	({ 7 . 79 } includes: scanCode)  "Right arrow"
		ifTrue: [ Transcript show: 'right arrow up' ; show: bat position ; cr . 
			    isMovingRight := false.   
					origin := origin + (1@0).
					Transcript show: 'right arrow up origin => ' ; show: origin ; cr .
			 ].
		
	({ 81 } includes: scanCode)  "down arrow"
		ifTrue: [  
				origin := origin + (0@1).
			    delta := (delta - 1) max: 1 . 
			Transcript show: 'down arrow up => delta = ' ; show: delta ; cr . 			
			 ].

	({ 82 } includes: scanCode)  "up arrow"
		ifTrue: [ 
			    delta := delta + 1 . 
				origin := origin - (0@1).			
            (origin y ) <= 0 ifTrue:[ origin := ((origin x)@ 0) ].
			Transcript show: 'up arrow up => delta = ' ; show: delta ; cr . 
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
Day17View >> setModel: aModel [
  model := aModel.
  bricks := Dictionary new.
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

"we recreate every game loop ? u sure ? "
model = nil ifFalse: [ | wid hgt max_wid max_hgt |
		max_wid := 200 . 
		max_hgt := 200 . 
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	wid := wid min: max_wid . 
	hgt := hgt min: max_hgt . 
	
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
		  root addChild: rectangle. 
		  ] .
		 ] ]
] . "if we have a model"



]
