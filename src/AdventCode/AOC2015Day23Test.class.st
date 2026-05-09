Class {
	#name : 'AOC2015Day23Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day23Test >> testHlfA [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'hlf a'.
self assert: p equals: #( #hlfA ).





]

{ #category : 'tests' }
AOC2015Day23Test >> testIncA [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'inc a'.
self assert: p equals: #( #incA ).





]

{ #category : 'tests' }
AOC2015Day23Test >> testIncB [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'inc b'.
self assert: p equals: #( #incB ).





]

{ #category : 'tests' }
AOC2015Day23Test >> testJio [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'jio a, +8'.
self assert: p equals: #( #jioA 8).


]

{ #category : 'tests' }
AOC2015Day23Test >> testJmp [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'jmp +123'.
self assert: p equals: #( #jmp 123).

]

{ #category : 'tests' }
AOC2015Day23Test >> testJmp2 [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'jmp +2'.
self assert: p equals: #( #jmp 2).


]

{ #category : 'tests' }
AOC2015Day23Test >> testJmpNeg [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'jmp -7'.
self assert: p equals: #( #jmp -7).




]

{ #category : 'tests' }
AOC2015Day23Test >> testTplA [
|aoc p |
aoc :=AOC2015Day23 new.
p := aoc interpret: 'tpl a'.
self assert: p equals: #( #tplA ).





]
