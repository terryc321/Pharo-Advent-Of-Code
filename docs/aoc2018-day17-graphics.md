
# Advent of Code 2018 Day 17 Reservoir Research - Attempt 1

Latest image
```
Pharo 14 development . 4 . image 


```

```
gameLoop 
Transcript show: 'Entering game loop'.

  [ 
    [ 
        [  self updateGame . 
	      
	Transcript show: tick ; cr . 
	tick := tick + 1 . 
	
	
          "(Delay forMilliseconds: 16) wait."
           #(Transcript show: 'tick' ; cr . ).
 	       "wait one second "
          "(Delay forMilliseconds: 1000) wait."          
 	       "wait 16 milliseconds second "
          "(Delay forMilliseconds: 16) wait."

          isRunning.  ] whileTrue. 
       "keep looping while last thing evald is true "
    ] on: Error do: [ :ex | Transcript cr; show: ex description ] 
] value . "forkNamed: 'GameLoop'."

Transcript show: 'Leaving game loop'.



```


Technical aside 
```
Goto menu in pharo 14 and select "load Toplo and Bloc"
```
this will load BlElement , BlSpace classes hopefully

Basic plumbing 

make a model , make a view , connect the view to the model .
```
d := Day17 new.
d range: (d puzzleExample1 ).

dv := Day17View new.
dv setModel: d.

```

to debug we can get all instances of Day17View , can then inspect them , 
```
s := Day17View allInstances. 

"tell all Day17View to shut themselves down "
Day17View allInstances do:[ :aView | aView gameHalt ]. 


```


# Populate the model

```
Day17
 d := Day17 new .
 d range: (d puzzleExample1).
 
Day17View 
 dv setModel: d
```

```

d:= Day17 new . 
d range: d puzzleExample1 . 
d minX . 
d maxX . 
d minY .
d maxY . 


dv:= Day17View new. 
dv setModel: d. 

b gameHalt. 

"for a given set , does it contain the point (10@20) ? "

s := Set new . 
s add: (10@20) . 
(10@20) className . 
s includes: (10@10). 
s 
```


```
initialize

	| rand wid hgt |
	super initialize. 
	"make some bricks all random colours "
   isAnimating := false. 

   "how far bat moves"
   delta := 10 . 
   "animated over what duration"
   duration := 400. 

   isMovingLeft := false. 
   isMovingRight := false. 
   isRunning := true. 

	aSpace := BlSpace new. "make a window "
	root := aSpace root. "access root element"
	aSpace extent: 1024 @ 768. "Set window size to 1024x768 pixels"
    "aSpace width"
	"aSpace height"
	aSpace resizable: false. "thats just mean no?"
	aSpace resizable: true. "surely a more dynamic be better"
	aSpace root background: Color blue.
	aSpace title: 'Advent of Code Day17 Puzzle'. " extent: 500@500 . "

	bricks := OrderedCollection new.    
	1 to: 20 do: [ :x |
			1 to: 20 do: [ :y |
					| rectangle |
					rectangle := BlElement new
						             background: Color random;
						             position: 40 * x @ (20 * y);
						             extent: 40 @ 20;
						             yourself.
					root addChild: rectangle .
					bricks add: rectangle. ] ].

	bat := BlElement new
		       background: Color red;
		       position: 400 @ 600;
		       extent: 120 @ 20;
		       yourself.
	root addChild: bat.

   ball := BallElement new velocity: 10@10 . 
   
	balls := OrderedCollection new. 
	rand := Random new. 
	wid := aSpace extent x.
	hgt := aSpace extent y.
	1 to: self ballCount do: [ :n |
		 |tmp | 
		 tmp := BallElement new 
		          position: ((rand next * 20) floor @ (rand next * 30) floor) ;
		          velocity: ((rand next * 20) floor @ (rand next * 20) floor ).
		 tmp delta: delta.
		"make every BallElement part of scene"
		#( root addChild: tmp. 
		 balls add: tmp).
		
	              ].
	
	root addChild: ball.
   "aSpace root focus: true.  "
   "Request keyboard focus for the root (enables key events)"
  "Make element focusable"
   "root focusability: BlFocusability focusable;  "
	root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | self keyDownEvent: anEvent ]).
	root addEventHandler: (BlEventHandler on: BlKeyUpEvent do: [ :anEvent | self keyUpEvent: anEvent ]).
	"Request focus when initialized"
	"root requestFocus  "
	root focused: true . 
	
"aSpace root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | bat keyDownEvent: anEvent ])."
aSpace root addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :anEvent | self keyDownEvent: anEvent ]).

"finally show window "
	aSpace show.
	
"start a background process for game loop"
self gameLoop.	
	
```


```
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

   
```

```
d := Day17 new.
d range: (d puzzleExample1 ).
d range: (d puzzleInput1 ).

dv := Day17View new.
dv setModel: d.
dv gameHalt.

s := Day17View allInstances. 
Day17View allInstances do:[ :aView | aView gameHalt ]. 
Day17View allInstances do:[ :aView | aView gameHalt ]. 

d points.

(123@456) x . 

b := BlElement new .
b extent: 100@100.
b background: (Color red). 
b background: (Color blue).
b

d := Dictionary new. 
d at: (3@3) put: 5 . 
d at: (3@3). 

{ 1 . 2  .3  }
```
