Class {
	#name : 'AOC2015Day11Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day11Test >> testPassword [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc run: 'abcdefgh') = 'abcdffaa'.
]

{ #category : 'accessing' }
AOC2015Day11Test >> testPassword2 [
| aoc |
aoc := AOC2015Day11 new.
self assert: (aoc run: 'ghijklmn') = 'ghjjaabc'.
]
