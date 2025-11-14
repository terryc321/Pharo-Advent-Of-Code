Class {
	#name : 'BaselineOfBreakout',
	#superclass : 'BaselineOf',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'baselines' }
BaselineOfBreakout >> baseline: spec [ [
	
	spec package: 'Breakout'
	   with: [ spec requires: #( 'Bloc' ) ].
	
]
]
