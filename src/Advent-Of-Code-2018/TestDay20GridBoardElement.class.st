Class {
	#name : 'TestDay20GridBoardElement',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'tests' }
TestDay20GridBoardElement >> testGrid [
 |board space|
	<sampleInstance>
	<demo>
		board := Day20GridBoardElement new
    colorCellAt: 10@10 color: Color green;      "starting room"
    colorCellAt: 10@11 color: Color yellow;
    colorCellAt: 11@10 color: Color yellow;
    colorCellAt: 12@12 color: (Color red alpha: 0.8);
    yourself.
	space := BlSpace new.
        space extent: 160@180.
        space root addChild: board.
        space show

]

{ #category : 'tests' }
TestDay20GridBoardElement >> testSquare [

	<sampleInstance>
	<demo>
	^ BlElement new
		  geometry: BlRoundedRectangleGeometry new;
		  extent: 80 @ 80;
		  background: Color green;
		  border: (BlBorder paint: Color black width: 2);
		  yourself
]
