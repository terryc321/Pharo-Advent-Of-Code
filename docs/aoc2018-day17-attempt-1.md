
# Advent of Code 2018 Day 17 Reservoir Research - Attempt 1

Technical aside 
```
Goto menu in pharo 14 and select "load Toplo and Bloc"
```
this will load BlElement , BlSpace classes hopefully

using dictionary for points as not all points will be occupied or used
also cant make a 2d matrix in pharo for some reason 


```
d := Day17 new.
d range: (d puzzleExample1 ).
d range: (d puzzleInput1 ).

dv := Day17View new.
dv setModel: d.
dv gameHalt.

s := Day17View allInstances. 
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

```


```
"called after a new model is assigned setModel: aModel "
"remove any BlElement that already exist from root "	
"add our own blocks "
"can we assign them a number so when mouse is over them - we get a balloon telling us where it is ?"
"model has minX maxX minY maxY "
"points get access to points as a Set "
"ask if a point is in a Set "
bricks := OrderedCollection new.    
[ | wid hgt |
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	1 to: wid do: [ :x |
			1 to: hgt do: [ :y |
					| rectangle color ox oy top_offset side_offset box_size |
					box_size := 20.
					top_offset := 20.
					side_offset := 20.
					
					" a default color in case color red/ blue below breaks"
					color := Color blue. 
					" if we just use x y we would not see anything"
					" because puzzle has x y values far off screen so we need to compensate"
					" and add min values found so we can see what is going on "
					ox := x + (model minX) .
					oy := y + (model minY) . 
					
					color := (((model points) includes: (ox@oy)) ifTrue: [ Color red ] ifFalse: [Color blue]) .
					rectangle := BlElement new
						             background: color ; 
						             position: ((20 * x) + side_offset) @ ((20 * y) + top_offset);
						             extent: 20 @ 20;
						             yourself.
					root addChild: rectangle .
 		bricks add: rectangle. ] ]
] value. 




```
"called after a new model is assigned setModel: aModel "
"remove any BlElement that already exist from root "	
"add our own blocks "
"can we assign them a number so when mouse is over them - we get a balloon telling us where it is ?"
"model has minX maxX minY maxY "
"points get access to points as a Set "
"ask if a point is in a Set "
bricks := OrderedCollection new.    
[ | wid hgt max_wid max_hgt |
	max_wid := 20 . 
	max_hgt := 20 . 
	wid := (model maxX) - (model minX) .
	hgt := (model maxY) - (model minY) . 	
	wid := wid min: max_wid . 
	hgt := hgt min: max_hgt . 
	
	1 to: wid do: [ :x |
			1 to: hgt do: [ :y |
					| rectangle color ox oy top_offset side_offset box_size |
					box_size := 20.
					top_offset := 20.
					side_offset := 20.
					
					" a default color in case color red/ blue below breaks"
					color := Color blue. 
					" if we just use x y we would not see anything"
					" because puzzle has x y values far off screen so we need to compensate"
					" and add min values found so we can see what is going on "
					ox := x + (model minX) .
					oy := y + (model minY) . 
					
					color := (((model points) includes: (ox@oy)) ifTrue: [ Color red ] ifFalse: [Color blue]) .
					rectangle := BlElement new
						             background: color ; 
						             position: ((20 * x) + side_offset) @ ((20 * y) + top_offset);
						             extent: 20 @ 20;
						             yourself.
					root addChild: rectangle .
 		bricks add: rectangle. ] ]
] value. 


```
x=495, y=2..7
y=7, x=495..501
x=501, y=3..7
x=498, y=2..4
x=506, y=1..2
x=498, y=10..13
x=504, y=10..13
y=13, x=498..504
```
Rendering clay as #, sand as ., and the water spring as +, and with x increasing to the right and y increasing downward, this becomes:

```
   44444455555555
   99999900000000
   45678901234567
 0 ......+.......
 1 ............#.
 2 .#..#.......#.
 3 .#..#..#......
 4 .#..#..#......
 5 .#.....#......
 6 .#.....#......
 7 .#######......
 8 ..............
 9 ..............
10 ....#.....#...
11 ....#.....#...
12 ....#.....#...
13 ....#######...
```


Phase One - Lets render this onto screen 

we have pharo 14 development edition latest be using BlElements - there is a PBE-Breakout game in ~/code/smalltalk 
we can use as a template for this task 

ideally we just want a grid on the screen with some different coloured rectanges , or just use different
coloured rectangles 



