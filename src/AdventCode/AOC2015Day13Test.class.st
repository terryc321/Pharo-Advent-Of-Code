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
"people := OrderedCollection new.
(dict at: #people) do: [: each | people add: each].
"
out := aoc cost: dict order: {#Alice . #Bob . #Carol . #David}.
self assert: out = 330.

]
