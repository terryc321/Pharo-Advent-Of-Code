Class {
	#name : 'AOC2015Day25Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day25Test >> testF1 [
|aoc gen|
aoc := AOC2015Day25 new.
gen := aoc intGenerator.
self assert: (gen next) equals: 20151125




]

{ #category : 'tests' }
AOC2015Day25Test >> testF2 [
|aoc gen res |
aoc := AOC2015Day25 new.
gen := aoc intGenerator.
gen next.
res := gen next.
self assert: res equals: 31916031




]
