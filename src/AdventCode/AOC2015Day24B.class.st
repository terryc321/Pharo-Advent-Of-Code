Class {
	#name : 'AOC2015Day24B',
	#superclass : 'Object',
	#instVars : [
		'day24',
		'fewest',
		'quantum',
		'winningSet'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
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
