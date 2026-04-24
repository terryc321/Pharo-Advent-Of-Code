Class {
	#name : 'BaselineOfPharoAdventOfCode',
	#superclass : 'Object',
	#category : 'BaselineOfPharoAdventOfCode',
	#package : 'BaselineOfPharoAdventOfCode'
}

{ #category : 'baselines' }
BaselineOfPharoAdventOfCode >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				baseline: 'PetitParser'
				with: [
					spec repository:
							'github://moosetechnology/PetitParser:v3.x.x/src' ];
				package: 'Pharo-Advent-Of-Code'
				with: [ spec requires: #( 'PetitParser' ) ] ]
]
