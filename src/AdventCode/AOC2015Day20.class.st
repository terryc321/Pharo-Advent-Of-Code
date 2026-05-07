Class {
	#name : 'AOC2015Day20',
	#superclass : 'Object',
	#instVars : [
		'houses'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day20 >> elves [
| limit |
houses := Dictionary new.
limit := 10000000.

1 to: limit do:[:elf | 
	Processor yield.
  elf to: limit by: elf do: [ :visit | 
    |deliver|
    deliver := elf * 10.
    houses at: visit ifPresent: [
       |tot|
       tot := houses at: visit.
       houses at: visit put: tot + deliver]  
       ifAbsent: [ houses at: visit put: deliver].
   ]
]


]

{ #category : 'as yet unclassified' }
AOC2015Day20 >> runElves [
|promise|
promise := [ self elves] asAsyncFuture awaitWithUserBackgroundPriority.

]
