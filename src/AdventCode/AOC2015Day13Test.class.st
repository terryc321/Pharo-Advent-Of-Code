Class {
	#name : 'AOC2015Day13Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day13Test >> testOne [
| aoc dict out |
aoc := AOC2015Day13 new.
dict := aoc parse: (aoc example).
out := aoc cost: dict order: {#Alice . #Bob . #Carol . #David}.
self assert: out = 330.

]

{ #category : 'accessing' }
AOC2015Day13Test >> testPart1 [
| aoc dict out |
aoc := AOC2015Day13 new.
dict := aoc parse: (aoc input).
aoc tryCombinations: dict.
self assert: (aoc best) = 618.

]

{ #category : 'accessing' }
AOC2015Day13Test >> testTwo [
| aoc dict out |
aoc := AOC2015Day13 new.
dict := aoc parse: (aoc example).
aoc tryCombinations: dict.
self assert: (aoc best) = 330.

]
