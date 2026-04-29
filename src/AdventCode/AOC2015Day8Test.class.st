Class {
	#name : 'AOC2015Day8Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'testing' }
AOC2015Day8Test >> example1 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '""')= #(2 0  2).
]

{ #category : 'testing' }
AOC2015Day8Test >> example2 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '"abc"')= #(5  3  2).
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> example3 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check: '"aaa\"aaa"')= #(10  7  3).
]

{ #category : 'as yet unclassified' }
AOC2015Day8Test >> example4 [
| aoc|
aoc := AOC2015Day8 new.
self assert: (aoc check:  '"\x27"')= #(6  1  5).
]
