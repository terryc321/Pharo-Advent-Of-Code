Class {
	#name : 'AOC2015Day23ParserTest',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'tests' }
AOC2015Day23ParserTest >> testHlfA [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'hlf a'.
self assert: p equals: #( #hlfA ).





]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testIncA [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'inc a'.
self assert: p equals: #( #incA ).





]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testIncB [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'inc b'.
self assert: p equals: #( #incB ).





]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testJio [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'jio a, +8'.
self assert: p equals: #( #jioA 8).


]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testJmp [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'jmp +123'.
self assert: p equals: #( #jmp 123).

]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testJmp2 [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'jmp +2'.
self assert: p equals: #( #jmp 2).


]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testJmpNeg [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'jmp -7'.
self assert: p equals: #( #jmp -7).




]

{ #category : 'tests' }
AOC2015Day23ParserTest >> testTplA [
|aoc p |
aoc :=AOC2015Day23Parser new.
p := aoc interpret: 'tpl a'.
self assert: p equals: #( #tplA ).





]
