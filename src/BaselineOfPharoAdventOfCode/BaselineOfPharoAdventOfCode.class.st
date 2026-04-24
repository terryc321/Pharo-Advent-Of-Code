"
```language=Pharo
Metacello new
    repository: 'github://terryc321/Pharo-Advent-Of-Code/src';
    baseline: 'PharoAdventOfCode';
    load.
```

ok so we got the baseline to work. except it will not load PetitParser , perhaps wrong location.


"
Class {
	#name : 'BaselineOfPharoAdventOfCode',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPharoAdventOfCode',
	#package : 'BaselineOfPharoAdventOfCode'
}

{ #category : 'baselines' }
BaselineOfPharoAdventOfCode >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec baseline: 'PetitParser2' 
			with: [ spec repository: 'github://kursjan/petitparser2' ];
			package: 'AdventOfCode' with: [ spec requires: #( 'PetitParser2' ) ]]
		
		
			
		
]
