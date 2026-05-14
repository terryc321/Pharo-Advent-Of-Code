Class {
	#name : 'FixBlackSpDropListMorphs',
	#superclass : 'Object',
	#instVars : [
		'process'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'as yet unclassified' }
FixBlackSpDropListMorphs >> fastFix [

SpDropListMorph allInstancesDo:[ :drop | 
	drop contentMorph color: Color white.
	drop contentMorph textColor: Color black ].


]

{ #category : 'accessing' }
FixBlackSpDropListMorphs >> start [

process := [ self fastFix . 
	           3 seconds asDelay wait. ] 
forkAt: Processor systemBackgroundPriority  named: 'fix black on black droplist'.

]

{ #category : 'accessing' }
FixBlackSpDropListMorphs >> stop [
process ifNotNil: [ process terminate ].

]
