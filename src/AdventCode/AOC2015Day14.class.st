Class {
	#name : 'AOC2015Day14',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day14 >> example [
^'Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.'
]

{ #category : 'accessing' }
AOC2015Day14 >> input [
^'Vixen can fly 19 km/s for 7 seconds, but then must rest for 124 seconds.
Rudolph can fly 3 km/s for 15 seconds, but then must rest for 28 seconds.
Donner can fly 19 km/s for 9 seconds, but then must rest for 164 seconds.
Blitzen can fly 19 km/s for 9 seconds, but then must rest for 158 seconds.
Comet can fly 13 km/s for 7 seconds, but then must rest for 82 seconds.
Cupid can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
Dasher can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Dancer can fly 3 km/s for 16 seconds, but then must rest for 37 seconds.
Prancer can fly 25 km/s for 6 seconds, but then must rest for 143 seconds.'

]

{ #category : 'as yet unclassified' }
AOC2015Day14 >> part1 [
	| deer aoc |
	deer := (self split: self input)
			collect: [ :desc | AOC2015Day14Reindeer newReindeer: desc ].
	deer do: [ :d | d simulate: 2503 ].
	deer sort: [ :a :b | a distance > b distance ].
	^ deer
		collect: [ :d | 
			{d name.
				d distance.
				d status} ]
]

{ #category : 'as yet unclassified' }
AOC2015Day14 >> split: s [
	| r1 r2 res |
	r1 := s splitOn: Character lf.
	res := OrderedCollection new.
	r1
		do: [ :line | 
			| r3 |
			r3 := line splitOn: Character space.
			res
				add: {(r3 at: 1) asSymbol.
						(r3 at: 4) asInteger.
						(r3 at: 7) asInteger.
						(r3 at: 14) asInteger} ].
	^ res
]
