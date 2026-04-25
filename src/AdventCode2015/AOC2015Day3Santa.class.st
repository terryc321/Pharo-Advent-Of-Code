"
ask santa = how many locations got one present

tell santa = tell santa which direction to go using characters


"
Class {
	#name : 'AOC2015Day3Santa',
	#superclass : 'Object',
	#instVars : [
		'route',
		'point'
	],
	#category : 'AdventCode2015',
	#package : 'AdventCode2015'
}

{ #category : 'accessing' }
AOC2015Day3Santa >> ask [
	"get santa to report how many places he has delivered atleast one present"

	^ route tabulateAtleastOnePresent
]

{ #category : 'accessing' }
AOC2015Day3Santa >> combineSantas: aSanta [
	"combine santa locations delivered to"
   | newRoute aDict bDict |
  newRoute := AOC2015Day3Route new.
  aDict := self route dict.
  bDict := aSanta route dict.
  "add all locations from this santa"
  aDict keysDo: [ :point | newRoute deliverPresentTo: point ].
  bDict keysDo: [ :point | newRoute deliverPresentTo: point ].
  "add all locations from aSanta"
 ^ newRoute
 



]

{ #category : 'initialization' }
AOC2015Day3Santa >> initialize [ 
 route := AOC2015Day3Route new.
 point := 0@0 .
 route deliverPresentTo: point. 





]

{ #category : 'accessing' }
AOC2015Day3Santa >> route [
	"get santas route"
   ^ route 

]

{ #category : 'as yet unclassified' }
AOC2015Day3Santa >> tell: char [
	"tell santa which direction to go using a character"

	| valid |
	valid := false.
	char = $^ ifTrue: [
			point := point + (0 @ 1).
			valid := true ].
	char = $< ifTrue: [
			point := point + (-1 @ 0).
			valid := true ].
	char = $> ifTrue: [
			point := point + (1 @ 0).
			valid := true ].
	char = $v ifTrue: [
			point := point + (0 @ -1).
			valid := true ].
	"if not valid then encountered bad character in string -- error out with index"
	valid ifFalse: [ Error signal: 'bad input character =[' , char , ']' ].
	"mutating instance variable point each time we tell santa where to go "
	route deliverPresentTo: point
]
