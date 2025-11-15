

```
d := Day17 new.
d range: (d puzzleInput1 ).
" after ranging input we have a set of points to plot "
d points. 

ds := Day17Solver new.
ds solve: (d points) .

dm := Day17Morph new.
dm openInWorld.
dm plot: ds .

viewer (day 17 morph) will plot the solution - 
combination of wall points from {d} 
water sand from solver {ds}




```



```
d := Day17 new.
d range: (d puzzleInput1 ).
" after ranging input we have a set of points to plot "
d points. 

dm := Day17Morph new.
dm openInWorld.
dm plot: d .


morphic 
self changed
self world doOneCycleNow



```


In order to put this onto screen we must decide what set of points we will accept
since our television monitor is not thousands of pixels wide and thouseands of pixels 
high

box size 50 x 50 
respectful of size of morph (self extent x)
also reposition of morph on screen (position)



```
dat points do: [ :pt | 
		| xy local_xy local_xy2 okX okY box_size |
		box_size := 50 .
		xy := ((pt - ((dat minX)@(dat minY))) * 50) .
		okX := (xy x) < (self extent x) and: [ (xy x) >= 0 ].
		okY := (xy y) < (self extent y) and: [ (xy y) >= 0 ].
		(okX and:[ okY ifTrue: [
				local_xy := xy + position. 
				local_xy2 := local_xy + (50@50).
             aCanvas fillRectangle: (local_xy corner:local_xy2) color: (Color brown ).				
				]])      
		 ] 
	]
	 

```


```
| position |
position := (0@0).
Transcript clear.
d points do: [ :pt | 
		| xy local_xy okX okY |
		" depending on magnification this multiple 10 will be bigger >= 1  "
		xy := ((pt - ((d minX)@(d minY))) * 10) .
		okX := (xy x) < 400 and: [ (xy x) >= 0 ].
		okY := (xy y) < 400 and: [ (xy y) >= 0 ].
		(okX and:[ okY ifTrue: [
				local_xy := xy + position. 
				Transcript show: 'plot at ' ; show: local_xy ; cr . 
				]])      
		 ] .
	 
```



# Morphic

windowing system is absolute 

0,0 is top left of screen . 

screen is so wide ? how wide - lets use smalltalk to tell us .

green rectangle top left at 0 ,0 . width rectange is 100 pixel , hight is 100 pixel 

Morph << TestMorph
 
this assumes the morph will forever be 200 by 200 pixels 
```
initialize 
 super initialize.
 self extent: (200@200).
```
 
```
TestMorph >> drawOn: aCanvas
drawOn: aCanvas 
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
```


 ```
 containsPoint: aPoint 
^ (((0@0) corner:(200@200)) containsPoint: aPoint) 
or: [ ((200@200) corner:(400@400)) containsPoint: aPoint ] .
```

this means when TestMorph is dragged about when its dropped , cannot interact with it 
because as far as computer is concerned the points contained are back up on the top left of the 
screen 

```
containsPoint: aPoint 
 | position rect0 rect1 rect2 midpoint extent farCorner|
  "if morph contains point - ask its rectangle if it knows "
 position := self position.
 extent := self extent .
 midpoint := self position + (extent / 2).
 farCorner := position + extent . 
 rect0 := (position corner: farCorner).
 ^ rect0 containsPoint: aPoint . 

```


```

d := Day17 new.
d range: (d puzzleInput1 ).


dm := Day17Morph new.
dm openInWorld.
dm plot: d .

"dont know how to delete non morph objects from system "
Day17Morph allInstancesDo: [ :a | a delete ].

[ :x :y | x + y ] value: 3 value: 4 .  "7"
```

