Class {
	#name : 'Day20Grid',
	#superclass : 'BlElement',
	#instVars : [
		'grid'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
Day20Grid >> initialize [
 "to hold Day20GridBoardElement"
 grid := Day20GridBoardElement new.
 self addChild: grid.

]
