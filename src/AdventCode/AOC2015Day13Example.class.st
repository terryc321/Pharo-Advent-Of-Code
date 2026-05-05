Class {
	#name : 'AOC2015Day13Example',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day13Example >> connect: from to: to [ 
(from = #Alice and:[ to = #Bob ]) ifTrue:[ ^ 54 ].
(from = #Alice and:[ to = #Carol ]) ifTrue:[ ^ -79 ].
(from = #Alice and:[ to = #David ]) ifTrue:[ ^ -2 ].

(from = #Bob and:[ to = #Alice ]) ifTrue:[ ^ 83 ].
(from = #Bob and:[ to = #Carol ]) ifTrue:[ ^ -7 ].
(from = #Bob and:[ to = #David ]) ifTrue:[ ^ -63 ].

(from = #Carol and:[ to = #Alice ]) ifTrue:[ ^ -62 ].
(from = #Carol and:[ to = #Bob ]) ifTrue:[ ^ 60 ].
(from = #Carol and:[ to = #David ]) ifTrue:[ ^ 55 ].

(from = #David and:[ to = #Alice ]) ifTrue:[ ^ 46 ].
(from = #David and:[ to = #Bob ]) ifTrue:[ ^ -7 ].
(from = #David and:[ to = #Carol ]) ifTrue:[ ^ 41 ].

Error signal: 'unknown connection'
]

{ #category : 'accessing' }
AOC2015Day13Example >> cost: anArray [
| tot local a b |
Transcript clear.
tot := 0 .
1 to: anArray size do: [:i |
 1 to: anArray size do: [:j |
   i = j ifFalse: [
   a := (anArray at: i).
   b := (anArray at: j).
   local := self connect: a to: b.
   tot := tot + local.
   Transcript show: a ; show: ' to ' ; show: b ; show: ' => ' ; show: local ; show: ' :: ' ; show: tot ; cr. 
   ]]].
"ends"
a := anArray at: 1.
b := anArray at: (anArray size).
   local := self connect: a to: b.
   tot := tot + local.
   Transcript show: a ; show: ' to ' ; show: b ; show: ' => ' ; show: local ; show: ' :: ' ; show: tot ; cr. 
   local := self connect: b to: a.
   tot := tot + local.
   Transcript show: b ; show: ' to ' ; show: a ; show: ' => ' ; show: local ; show: ' :: ' ; show: tot ; cr. 
^ tot.   

 

]
