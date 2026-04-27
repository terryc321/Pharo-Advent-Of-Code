"
attempt at trying to create an inspector with roassal canvas RSCanvas capabilities 

we know we need to have a procedure takes one argument aBuilder.
we also need we need to have one of these two pragmas

```
<inspectorPresentationOrder: 0 title: 'example'>
<inspectorPresentationOrder: 0 title: 'example2' if: true >
```


"
Class {
	#name : 'AOC2025DayInspect',
	#superclass : 'Object',
	#instVars : [
		'heart',
		'accumulator'
	],
	#category : 'AdventCode2025',
	#package : 'AdventCode2025'
}

{ #category : 'shapes' }
AOC2025DayInspect >> example12Polygons [
	<script: 'self new example12Polygons open setLabel: ''Polygon shapes'''>
	| canvas color border |
	canvas := RSCanvas new.
	color:= RSGradientPalette gradient21.
	border := RSBorder new paint: Color black; width: 2.
	#('diamond' 'square' 'heptagon' 'hexagon'
	'octagon' 'pentagon' 'rhomboid' 'star'
	'triangle' 'vee' 'plus' 'arrow'
	"not polygons" 'box' 'circle') do: [ :selector|
		| shape gradient |
		gradient := color scale: selector.
		gradient
			start: -50 asPoint;
			stop: 50 asPoint.
		shape := (RSShapeFactory perform: selector asSymbol)
			size: 100;
			model: selector;
			popup;
			color: gradient;
			border: border.
		canvas add: shape
		 ].

	RSGridLayout new gapSize: 50; on: canvas nodes.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : 'as yet unclassified' }
AOC2025DayInspect >> inspectBarchart2: aBuilder [
	<inspectorPresentationOrder: 30 title: 'Barchart2'>
	| c p x y |
	" c is the composite chart , p is the plot"
	
	y := #(1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10).	
	x := 1 to: (y size).
	
	c := RSCompositeChart new. "c is the canvas"
	
	p := RSBarPlot new x: x y: y. "the plot"
	p title: 'the plot of the century'.
	
	c add: p. "add the plot to RSChart "
	c build. "why build"

	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: c canvas ; 
		yourself 
		
	
]

{ #category : 'as yet unclassified' }
AOC2025DayInspect >> inspectBarchart3: aBuilder [
	<inspectorPresentationOrder: 30 title: 'Barchart3'>	
	| canvas col |
	col := #(1 2 3 4 5 6 7 8 9 10).
	canvas := RSCanvas new.
	"without RSCanvasController cannot zoom into graph"
	canvas @ RSCanvasController.
	1 to: (col size) do: [ :i |  
		canvas addShape: (RSBox new
				 extent: 10 @ (10 * (col at: i));
				position: (10 * (2 * (col at: i))) @ 0 ;
				 yourself).			
							].
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: canvas ; 
		yourself 
		
	
]

{ #category : 'as yet unclassified' }
AOC2025DayInspect >> inspectBarchart4: aBuilder [
	<inspectorPresentationOrder: 30 title: 'Barchart4'>	
	| c p x y |
	y := #(1 2 3 4 5 6 7 8 9 10). "the numbers want to plot"
	p := RSBarPlot new y: y.
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: c canvas ; 
		yourself 
		
	
]

{ #category : 'as yet unclassified' }
AOC2025DayInspect >> inspectBarchart: aBuilder [
	<inspectorPresentationOrder: 30 title: 'Barchart'>	
	| c p p2 x y size |
	x := 0.0 to: 2 count: 10.
	y := (x raisedTo: 2) - 2.
	c := RSCompositeChart new.
	p := RSBarPlot new x: x y: y.
	size := 6.
	p barSize: size.
	p barOffset: size / 2.
	p2 := RSBarPlot new x: x y: y + 0.5.
	p2 barSize: size.
	p2 barOffset: size / -2.
	c add: p.
	c add: p2.
	c horizontalTick doNotUseNiceLabel;
			 numberOfTicks: x size - 1;
			 asFloat: 5;
			 useVerticalLabel.

	c build.
	p bars @ RSPopup.

	p2 bars
		when: RSMouseEnter
		do: [ :evt |
			| color |
			color := Color random.
			p2 bars do: [ :shape | shape color: color ].
			evt signalUpdate ]
		for: self.
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: c canvas ; 
		yourself 
		
	
]

{ #category : 'shapes' }
AOC2025DayInspect >> inspectionIn: aBuilder [
	<inspectorPresentationOrder: 90 title: 'Shape'>
	| canvas color border |
	canvas := RSCanvas new.
	color:= RSGradientPalette gradient21.
	border := RSBorder new paint: Color black; width: 30.
	#('diamond' 'square' 'heptagon' 'hexagon'
	'octagon' 'pentagon' 'rhomboid' 'star'
	'triangle' 'vee' 'plus' 'arrow'
	"not polygons" 'box' 'circle') do: [ :selector|
		| shape gradient |
		gradient := color scale: selector.
		gradient
			start: -50 asPoint;
			stop: 50 asPoint.
		shape := (RSShapeFactory perform: selector asSymbol)
			size: 200;
			model: selector;
			popup;
			color: gradient;
			border: border.
		canvas add: shape
		 ].

	RSGridLayout new gapSize: 50; on: canvas nodes.
	canvas @ RSCanvasController.
	
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: canvas;
		yourself
		
		
		

]

{ #category : 'as yet unclassified' }
AOC2025DayInspect >> inspectorGraphIn: aBuilder [
	<inspectorPresentationOrder: 30 title: 'Graph'>	
	| canvas |
	canvas := RSCanvas new.
	"without RSCanvasController cannot zoom into graph"
	canvas @ RSCanvasController.
	canvas addShape: (RSBox new
			 extent: 100 @ 100;
			 yourself).
	canvas addShape: (RSBox new
			 position: 100 @ 100;
			 color: Color blue;
			 extent: 100 @ 100;
			 yourself).
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: canvas ; 
		yourself
]
