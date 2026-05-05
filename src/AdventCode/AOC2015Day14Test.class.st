Class {
	#name : 'AOC2015Day14Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day14Test >> testPart1 [
|aoc|
aoc := AOC2015Day14 new.
self assert: (aoc part1 at: 1) = {#Vixen . 2660 . #rest}.
]
