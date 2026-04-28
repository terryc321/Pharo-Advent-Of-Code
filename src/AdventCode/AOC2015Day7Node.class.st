"
parent node for all children 
```
{ and or not lshift rshift assign nodes }
```

```

| view nodes shape edges |
view := RSView new.

""Define a simple binary node structure""
Object subclass: #BinaryNode
    instanceVariableNames: 'value left right'
    classVariableNames: ''
    package: 'Example-BinaryTree'.

""Helper method to create a node""
createNode := [ :val | 
    | node |
    node := BinaryNode new.
    node instVarNamed: 'value' put: val.
    node instVarNamed: 'left' put: nil.
    node instVarNamed: 'right' put: nil.
    node ].

""Create nodes""
root := createNode value: 1.
left := createNode value: 2.
right := createNode value: 3.
root instVarNamed: 'left' put: left.
root instVarNamed: 'right' put: right.

""All nodes""
nodes := { root. left. right }.

""Define shape for nodes""
shape := RSShapeBuilder label
    color: Color lightBlue;
    text: [ :node | node instVarNamed: 'value' ];
    yourself.

""Create elements""
elements := shape elementsOn: nodes.
view addAll: elements.

""Position elements with tree layout""
RSTreeLayout on: elements.

""Define edges using left and right links""
edges := RSCompositeEdgeBuilder orthoHorizontal
    canvas: view;
    shapes: elements;
    connectFrom: [ :node | 
        Array streamContents: [ :stream |
            | left right |
            left := node instVarNamed: 'left'.
            right := node instVarNamed: 'right'.
            left ifNotNil: [ stream nextPut: left ].
            right ifNotNil: [ stream nextPut: right ] ] ];
    yourself.

view @ RSControlsView.
view open   
```
"
Class {
	#name : 'AOC2015Day7Node',
	#superclass : 'Object',
	#instVars : [
		'children',
		'ready',
		'val',
		'title'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7Node >> addChild: x [
 children add: x .

 

]

{ #category : 'initialization' }
AOC2015Day7Node >> children [
 ^ children




 

]

{ #category : 'initialization' }
AOC2015Day7Node >> children: aCollection [
 children := aCollection 





 

]

{ #category : 'initialization' }
AOC2015Day7Node >> compute [
 ^ self subclassResponsibility 

]

{ #category : 'initialization' }
AOC2015Day7Node >> initialize [ 
 children := Dictionary new.
 ready := false.
 val := nil .
 title := 'no-title'.
]

{ #category : 'inspector' }
AOC2015Day7Node >> inspectorFor: aBuilder [
    <inspectorPresentationOrder: 9999 title: 'Node'> 
|boxes nodes canvas |
boxes := OrderedCollection new.
nodes := { self } .
nodes do: [ :node |
	boxes add: (RSBox new model: node ; color: Color blue; size: 5 ; popup ; draggable ; yourself)].
canvas := RSCanvas new.
canvas addAll: boxes.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #left.
RSLineBuilder orthoVertical withVerticalAttachPoint ; shapes: boxes ; connectTo: #right.
RSTreeLayout on: boxes.
canvas @ RSCanvasController .
^ canvas.
]

{ #category : 'initialization' }
AOC2015Day7Node >> isAndNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isAssignNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isLShiftNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isNode [ 
 ^ true



]

{ #category : 'initialization' }
AOC2015Day7Node >> isNotNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isNumNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isOrNode [ 
 ^ false



]

{ #category : 'initialization' }
AOC2015Day7Node >> isRShiftNode [ 
 ^ false



]

{ #category : 'accessing' }
AOC2015Day7Node >> left [
 ^ children at: 1 ifAbsent: [ nil ].




]

{ #category : 'accessing' }
AOC2015Day7Node >> left: x [ 
 children at: 1 put: x 




]

{ #category : 'printing' }
AOC2015Day7Node >> printOn: aStream [
	aStream nextPutAll: 'Node{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
]

{ #category : 'initialization' }
AOC2015Day7Node >> ready [
 ^ ready
]

{ #category : 'initialization' }
AOC2015Day7Node >> ready: x [
 ready := x 

]

{ #category : 'accessing' }
AOC2015Day7Node >> right [
 ^ children at: 2 ifAbsent: [ nil ].




]

{ #category : 'accessing' }
AOC2015Day7Node >> right: x [ 
  children at: 2 put: x 








]

{ #category : 'accessing' }
AOC2015Day7Node >> title [
 ^ title 


 

]

{ #category : 'accessing' }
AOC2015Day7Node >> title: x [
 title := x 

]

{ #category : 'initialization' }
AOC2015Day7Node >> val [
 ^ val




]

{ #category : 'initialization' }
AOC2015Day7Node >> val: x [
 val := x .
 ready := true.





]
