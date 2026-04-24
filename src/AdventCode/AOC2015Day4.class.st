"
how get md5 ? 

```language=Pharo
MD5 ?
```





"
Class {
	#name : 'AOC2015Day4',
	#superclass : 'Object',
	#instVars : [
		'myProcess'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day4 >> halt [ 
 myProcess ifNotNil: [ myProcess terminate. myProcess := nil . ^ 'halted' ].
 ^ 'already halted'

]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> md5driver: aSecret [
	"iteratively call itself"

	| n ret |
	n := 1.
	[ true ] whileTrue: [
			ret := self md5secret: aSecret n: n.
			ret = false
				ifTrue: [
						n := n + 1.
						Processor yield ]
				ifFalse: [ ^ ret ] ]
]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> md5secret: aSecret n: n [
	"recursively call itself until we find 5 zeros in the md5 hash"

	| hash |
	hash := (MD5 hashMessage: aSecret , n asString) hex.
	(hash copyFrom: 1 to: 5) = '00000'
		ifTrue: [ ^ n ]
		ifFalse: [ "Processor yield." 
			(n % 10000) = 0 ifTrue:[ Transcript showCr: 'trying ' , n asString ; cr ].
			^ false ].
	^ n
]

{ #category : 'accessing' }
AOC2015Day4 >> puzzleInput [ 
^ 'bgvyzdsv'



]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> puzzleInputParsed [
	"parsed input goes here"
	^ self notYetImplemented 
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> puzzlePart1 [	
^ ' --- Day 4: The Ideal Stocking Stuffer ---
Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the economically forward-thinking little girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes. The input to the MD5 hash is some secret key (your puzzle input, given below) followed by a number in decimal. To mine AdventCoins, you must find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash.

For example:

If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so.
If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....

'

]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> puzzlePart2 [	
^ ' Now find one that starts with six zeroes.
'


]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> solution1Part1 [

	myProcess := [self md5driver: 'abcdef'] forkAt: Processor userBackgroundPriority.
	
	
	
	
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day4 >> solution1Part2 [
| puz sz h |
puz := self puzzleInput. "the string itself"
sz := puz size . "size of input"
h := 0. "initial height zero"
1 to: sz do: [ :i | 
		| e | "element e - a character in string"
	e := puz at: i . "get a character"
	e = $( ifTrue: [ h := h + 1 ] ifFalse: [ e = $) ifTrue: [ h := h - 1 ]]. 
	h < 0 ifTrue: [ ^ i ]
		 ].
"never entered basement"
Error signal: 'Santa never entered basement'.




]
