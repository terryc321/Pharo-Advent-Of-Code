Class {
	#name : 'Day20GridBoardElement',
	#superclass : 'BlElement',
	#instVars : [
		'gridSize',
		'cellSize',
		'coloredCells'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'as yet unclassified' }
Day20GridBoardElement >> clearAll [
    coloredCells removeAll.
    self invalidate
]

{ #category : 'as yet unclassified' }
Day20GridBoardElement >> colorCellAt: gridPoint color: aColor [
    coloredCells at: gridPoint put: aColor.
    self invalidate
]

{ #category : 'as yet unclassified' }
Day20GridBoardElement >> drawOnSpartaCanvas: aCanvas [
    aCanvas fill
        paint: Color black;
        path: self boundsInLocal;
        draw.

    coloredCells keysAndValuesDo: [ :pos :color |
        | rect |
        rect := self rectangleForCell: pos.
        aCanvas fill
            paint: color;
            path: rect;
            draw ].

    aCanvas stroke
        paint: (Color gray alpha: 0.25);
        strokeWidth: 0.5;
        path: [ :b |
            0 to: gridSize x do: [ :i |
                b absolute; moveTo: i*cellSize@0; lineTo: i*cellSize@self height ].
            0 to: gridSize y do: [ :i |
                b absolute; moveTo: 0@(i*cellSize); lineTo: self width@(i*cellSize) ]
        ];
        draw
]

{ #category : 'as yet unclassified' }
Day20GridBoardElement >> initialize [

	super initialize.
	gridSize := 20 @ 20.
	cellSize := 30.
	coloredCells := Dictionary new.
	self extent: gridSize * cellSize.
	self background: Color black.
	self layout: BlFrameLayout new
]

{ #category : 'as yet unclassified' }
Day20GridBoardElement >> rectangleForCell: aPoint [
    | origin |
    origin := ((aPoint - 1) * cellSize) asFloatPoint.
    ^ Rectangle origin: origin corner: origin + cellSize
]
