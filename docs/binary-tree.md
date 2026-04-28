
# Binary Tree 

Again to re-iterate for later pharo-13 pharo-14 releases in order for inspection tab to open
need to use pragma inspectorPresentationOrder:title:

before we get into weeds on inspectorPresentationOrder:title: lets see if we can get the 
generic class hierachy from smalltalk system

```
data := Collection withAllSubclasses .
boxes := data collect: [ :class | 
	 RSBox new model: class ; popup ; draggable ; yourself ].
canvas := RSCanvas new.
canvas addAll: boxes.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectFrom: #superclass .
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
```

above - this works. can we replicate on a simpler data set.

we can have different size boxes

```
n1 := AOC2015Day7Node new. n1 title: 'foo' ; yourself.
n2 := AOC2015Day7Node new. n2 title: 'bar' ; yourself.
n3 := AOC2015Day7Node new. n3 title: 'baz' ; yourself.
box1 := RSBox new model: n1 ; size: 10 ; popup ; draggable ; yourself . 
box2 := RSBox new model: n2 ; size: 20 ; popup ; draggable ; yourself . 
box3 := RSBox new model: n3 ; size: 30 ; popup ; draggable ; yourself .
boxes := {  box1 . box2 . box3 }.
canvas := RSCanvas new.
canvas addAll: boxes.
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
```

we can put 3 plain gray boxes on the screen , there are no lines to them , no title , no color.

with our node we write a printOn: method takes a stream , so when we print out it takes node title also.
```
AOC2015Day7Node >> printOn: aStream
	aStream nextPutAll: 'Node{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.				 
			 
AOC2015Day7Node >> title
        ^ title 

AOC2015Day7Node >> title: x
        title := x 
```

now our nodes can be identified by mouse hover.

we managed to make them colorful

```
n1 := AOC2015Day7Node new. n1 title: 'foo' ; yourself.
n2 := AOC2015Day7Node new. n2 title: 'bar' ; yourself.
n3 := AOC2015Day7Node new. n3 title: 'baz' ; yourself.

box1 := RSBox new model: n1 ; color: Color blue; size: 10 ; popup ; draggable ; yourself . 
box2 := RSBox new model: n2 ;  color: Color red;size: 20 ; popup ; draggable ; yourself . 
box3 := RSBox new model: n3 ;  color: Color orange; size: 30 ; popup ; draggable ; yourself .
boxes := {  box1 . box2 . box3 }.
canvas := RSCanvas new.
canvas addAll: boxes.
"RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left."
"RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectFrom: [ :box | box right]."
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
```

we can add a black line between box1 and box2 

```
canvas add: (RSLine new
		attachPoint: (RSBorderAttachPoint new
			startOffset: 0;
			endOffset: 0;			
			yourself);
		from: box1;
		to: box2;
		color: Color black ;
		yourself).
```

doing this also makes boxes adhere to RSTreeLayout by virtue from - to connection .

to get a tree hierachy drawn correctly the object - our node in this case - has to return 
either another node object or nil (nil meaning no line will be drawn between nodes)

we can now use the RSLineBuilder class to generate the lines for us , any node that responds with another node object understands message #left or #right gets a line drawn

```
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #right.
```

Lets look at the full reconstructed example 

```

n0 := AOC2015Day7Node new. n0 title: 'root' ; yourself.
n1 := AOC2015Day7Node new. n1 title: 'foo' ; yourself.
n2 := AOC2015Day7Node new. n2 title: 'bar' ; yourself.
n3 := AOC2015Day7Node new. n3 title: 'baz' ; yourself.

n0 left: n1. 
n1 left: n2.
n1 right: n3. 

box0 := RSBox new model: n0 ; color: Color blue; size: 5 ; popup ; draggable ; yourself . 
box1 := RSBox new model: n1 ; color: Color blue; size: 10 ; popup ; draggable ; yourself . 
box2 := RSBox new model: n2 ;  color: Color red;size: 20 ; popup ; draggable ; yourself . 
box3 := RSBox new model: n3 ;  color: Color orange; size: 30 ; popup ; draggable ; yourself .

boxes := {  box0 . box1 . box2 . box3 }.
canvas := RSCanvas new.
canvas addAll: boxes.

RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #right.

RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.

```


```
n0 := AOC2015Day7Node new. n0 title: 'root' ; yourself.
n1 := AOC2015Day7Node new. n1 title: 'foo' ; yourself.
n2 := AOC2015Day7Node new. n2 title: 'bar' ; yourself.
n3 := AOC2015Day7Node new. n3 title: 'baz' ; yourself.
n0 left: n1. 
n1 left: n2.
n1 right: n3. 
nodes := { n0 . n1 . n2 . n3 } .
boxes := OrderedCollection new.
nodes do: [ :node |
	boxes add: (RSBox new model: node ; color: Color blue; size: 5 ; popup ; draggable ; yourself
	)].
canvas := RSCanvas new.
canvas addAll: boxes.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #right.
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
```

here is a working version for day 7 , for some reason the number nodes are not connected , 
but they clearly are on the dictionary.

```
aoc := AOC2015Day7 new.
lines := (aoc puzzleInput).
lines do: [ :aline | aoc parseLine: aline  ].
lines do: [ :aline | aoc parseLine2: aline  ].
aoc parseLine3.

nodes := (aoc dict asOrderedCollection) .
boxes := OrderedCollection new.
nodes do: [ :node |
	boxes add: (RSBox new model: node ; color: Color blue; size: 5 ; popup ; draggable ; yourself
	)].
canvas := RSCanvas new.
canvas addAll: boxes.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #right.
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
```



``` smalltalk
Collection >> inspectionNode: aBuilder [
    <inspectorPresentationOrder: 0 title: 'Node'> 
    
   
]

```
