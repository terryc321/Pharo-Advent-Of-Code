"
```
clock := AOCClock new.
clock run.
clock stop.
```

"
Class {
	#name : 'AOCClock',
	#superclass : 'Object',
	#instVars : [
		'morph',
		'process'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOCClock >> initialize [ 
 morph := StringMorph new.



]

{ #category : 'running' }
AOCClock >> run [ 
morph openInWorld. 
process := [ [ true ] whileTrue: [ 
    morph contents: Time now print24.
    1 second wait 
] ] forkAt: Processor systemBackgroundPriority .




]

{ #category : 'running' }
AOCClock >> stop [
process terminate.
morph delete.


]
