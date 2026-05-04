Class {
	#name : 'AOC2015Day10',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day10 >> iterSay: aString alimit: theLimit [
| s out |
s := aString.
1 to: theLimit do: [ :n |
 out := (self say: s).
 s := out].
^ s

]

{ #category : 'as yet unclassified' }
AOC2015Day10 >> part1 [
| in out |
in := '1113222113' . "own puzzle input"
out := self recurSay: in alimit: 40.
^ { out . out size }.

]

{ #category : 'as yet unclassified' }
AOC2015Day10 >> part1b [
| in out |
in := '1113222113' . "own puzzle input"
out := self iterSay: in alimit: 40.
^ { out . out size }.

]

{ #category : 'as yet unclassified' }
AOC2015Day10 >> part2 [
| in out |
in := '1113222113' . "own puzzle input"
out := self iterSay: in alimit: 50.
^ { out size }.

]

{ #category : 'as yet unclassified' }
AOC2015Day10 >> recurSay: aString alimit: theLimit [
^ self recurSay: (self say: aString) ncount: 1 alimit: theLimit
]

{ #category : 'as yet unclassified' }
AOC2015Day10 >> recurSay: aString ncount: anInteger alimit: theLimit [
anInteger = theLimit ifTrue:[ ^ aString ].
Processor yield.
^ self recurSay: (self say: aString) ncount: (anInteger + 1) alimit: theLimit
]

{ #category : 'accessing' }
AOC2015Day10 >> say: aString [
	| i s res |
	res := ''.
	s := aString , 'XXXXXXX'.
	i := 1.
	[ i < s size and:[ (s at: i) isDigit]]
		whileTrue: [ | digit count |
			digit := s at: i.
			count := 1.
			i := i + 1.
			[ i < s size and: [ ((s at: i) = digit) and:[ (s at: i) isDigit]] ]
				whileTrue: [ count := count + 1.
					i := i + 1 ].
			res := res , count asString , digit asString ].
	^ res
]
