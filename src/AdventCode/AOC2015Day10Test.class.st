Class {
	#name : 'AOC2015Day10Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day10Test >> testIterSay [
|aoc|
aoc := AOC2015Day10 new.
self assert: (aoc iterSay: '1' alimit: 1) = '11'.
self assert: (aoc iterSay: '1' alimit: 2) = '21'.
self assert: (aoc iterSay: '1' alimit: 3) = '1211'.
self assert: (aoc iterSay: '1' alimit: 4) = '111221'.
self assert: (aoc iterSay: '1' alimit: 5) = '312211'.
]

{ #category : 'as yet unclassified' }
AOC2015Day10Test >> testIterSay2 [
|aoc|
aoc := AOC2015Day10 new.
self assert: (aoc iterSay: '1' alimit: 1) = '11'.
self assert: (aoc iterSay: '11' alimit: 1) = '21'.
self assert: (aoc iterSay: '21' alimit: 1) = '1211'.
self assert: (aoc iterSay: '1211' alimit: 1) = '111221'.
self assert: (aoc iterSay: '111221' alimit: 1) = '312211'.
]

{ #category : 'as yet unclassified' }
AOC2015Day10Test >> testRecurSay [
|aoc|
aoc := AOC2015Day10 new.
self assert: (aoc recurSay: '1' alimit: 1) = '11'.
self assert: (aoc recurSay: '1' alimit: 2) = '21'.
self assert: (aoc recurSay: '1' alimit: 3) = '1211'.
self assert: (aoc recurSay: '1' alimit: 4) = '111221'.
self assert: (aoc recurSay: '1' alimit: 5) = '312211'.
]

{ #category : 'as yet unclassified' }
AOC2015Day10Test >> testRecurSay2 [
|aoc|
aoc := AOC2015Day10 new.
self assert: (aoc recurSay: '1' alimit: 1) = '11'.
self assert: (aoc recurSay: '11' alimit: 1) = '21'.
self assert: (aoc recurSay: '21' alimit: 1) = '1211'.
self assert: (aoc recurSay: '1211' alimit: 1) = '111221'.
self assert: (aoc recurSay: '111221' alimit: 1) = '312211'.
]

{ #category : 'as yet unclassified' }
AOC2015Day10Test >> testSay [
|aoc|
aoc := AOC2015Day10 new.
self assert: (aoc say: '1') = '11'.
self assert: (aoc say: '11') = '21'.
self assert: (aoc say: '21') = '1211'.
self assert: (aoc say: '1211') = '111221'.
self assert: (aoc say: '111221') = '312211'.
]
