Class {
	#name : 'AOC2015Day14Reindeer',
	#superclass : 'Object',
	#instVars : [
		'speed',
		'duration',
		'restsFor',
		'name',
		'distance',
		'status',
		'activeCount',
		'restCount'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer class >> newReindeer: anArray [
| r |
r := AOC2015Day14Reindeer new.
r name: (anArray at: 1) ; speed: (anArray at: 2) ; duration: (anArray at: 3) ; restsFor: (anArray at: 4).
^ r.
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> distance [
^ distance
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> duration [
^ duration
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> duration: s [
duration := s.
self
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> name [
^ name
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> name: s [
name := s.
self
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> newReindeer: aDict [
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> restsFor [
^ restsFor
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> restsFor: s [
restsFor := s.
self
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> simulate: aLimit [
"simulate the reindeer for n seconds --- how does it do this best?"
status := #active.
activeCount := 0.
distance := 0.
1 to: aLimit do: [:n |
 self tick.
].
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> speed [
^ speed
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> speed: s [
speed := s
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> status [
^ status
]

{ #category : 'as yet unclassified' }
AOC2015Day14Reindeer >> tick [
status = #active ifTrue:[ 
  activeCount := activeCount + 1.
  distance := distance + speed.
  activeCount = duration ifTrue:[ activeCount := 0. restCount := 0. status := #rest ]]
                ifFalse: [ 
   restCount := restCount + 1.
   restCount = restsFor ifTrue: [ activeCount := 0. restCount := 0. status := #active ]].
   

]
