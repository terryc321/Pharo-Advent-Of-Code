Class {
	#name : 'AOC2015Day24B',
	#superclass : 'Object',
	#instVars : [
		'day24',
		'fewest',
		'quantum',
		'winningSet'
	],
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day24B >> addsUpToRestricted: aCollection [ 
| tot target | 
tot := aCollection inject: 0 into: [:acc :each | acc + each].
target := tot / 4 .
Transcript show: '*** Four bins - Part B ***' ; cr. 
Transcript show: 'target is ' ; show: target; cr.
Transcript show: 'collection is ' ; show: aCollection printString; cr.
Transcript show: 'start time is ' ; show: (Time now print24) ; cr. 

"we restrict size of selected group to add to our target total - if
we find no solutions we incrementally increase size of restriction
how do we detect if a solution was found ? throw an exception ?
"
1 to: aCollection size do: [:restriction |
	Transcript show: 'asserting restriction collection size cannot be more than ' ; show: restriction ; show: ' items long' ; cr.
  self addsUpToRestrictedRecur: aCollection target: target restriction: restriction sum:0 group: (OrderedCollection new) ].

]

{ #category : 'initialization' }
AOC2015Day24B >> addsUpToRestrictedRecur: col target: t restriction: restrict sum: s group: col3 [
| sz |
sz := col3 size.
sz > restrict ifTrue:[ ^ #tooMany ].
(fewest isNil) ifTrue:[ quantum := (10**55) ].
(fewest isInteger and: [sz > fewest]) ifTrue: [^ #tooMany]. 
s = t ifTrue:[ |qtum| 
	             qtum := col3 inject: 1 into: [:acc :each | acc * each ].
	             fewest ifNil: [fewest := sz].
	             (sz < fewest) ifTrue: [ fewest := sz. 
		                                   quantum := qtum.
		                                   winningSet := col3.
															Transcript show: (Time now print24) ; show: ' ' ;
															           show: 'winning set ' ; show: col3 ; show: ' quantum=> ' ; show: qtum ; show: ' size=> ' ; show: sz ; cr. 									
															 ].	              
						(qtum < quantum) ifTrue: [ 
							 quantum := qtum .
							Transcript show: (Time now print24) ; show: ' ' ;
							          show: 'winning set ' ; show: col3 ; show: ' quantum=> ' ; show: qtum ; show: ' size=> ' ; show: sz ; cr. 									
							].									 
	             ^ #ok ].

s > t ifTrue:[ ^ #tooBig ].
"if collection col is empty - it cant iterate over itself"
Processor yield.
col do: [:n | 
	((n + s) <= t) ifTrue:[
		|col2|
		col2 := col copy.		
	   self addsUpToRestrictedRecur: (col2 reject:[:e | e =n]) target:t restriction: restrict sum: (n+s) group: ([|col4| col4 := col3 copy. col4 add: n . col4] value).
	]].
	

]

{ #category : 'initialization' }
AOC2015Day24B >> howToRun [ 
"
copy this into Playground 

day24b := AOC2015Day24B new.
process := [ day24b addsUpToRestricted: (day24b input) ] forkAt: Processor userBackgroundPriority.
day24b 
process suspend.
process terminate.



*** Four bins - Part B ***
target is 387
collection is #(1 3 5 11 13 17 19 23 29 31 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113)
start time is 12:17:41
asserting restriction collection size cannot be more than 1 items long
asserting restriction collection size cannot be more than 2 items long
asserting restriction collection size cannot be more than 3 items long
asserting restriction collection size cannot be more than 4 items long
asserting restriction collection size cannot be more than 5 items long
12:17:49 winning set 161103109113 quantum=> 77387711 size=> 5

"


]

{ #category : 'initialization' }
AOC2015Day24B >> initialize [ 
day24 := AOC2015Day24 new.


]

{ #category : 'initialization' }
AOC2015Day24B >> input [ 
^ day24 input 

]
