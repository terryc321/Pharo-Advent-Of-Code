Class {
	#name : 'AOC2016Day1Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'tests' }
AOC2016Day1Test >> testExecute01 [
|aoc ord parse |
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 2}.
ord add: {#left . 3}.
parse := (aoc parse: 'R2, L3').
self assert: parse equals: ord .
self assert: (aoc execute: parse) equals: { 2@3 . 5}.
"distance 5 blocks away - 2 east and 3 north"
"Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away."


]

{ #category : 'tests' }
AOC2016Day1Test >> testExecute02 [
|aoc ord parse |
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 2}.
ord add: {#right . 2}.
ord add: {#right . 2}.
parse := (aoc parse: 'R2, R2, R2').
self assert: parse equals: ord .
self assert: (aoc execute: parse) equals: { 0@(0 - 2) . 2}.
"R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away."
"R5, L5, R5, R3 leaves you 12 blocks away."


]

{ #category : 'tests' }
AOC2016Day1Test >> testExecute03 [
|aoc ord parse|
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 5}.
ord add: {#left . 5}.
ord add: {#right . 5}.
ord add: {#right . 3}.
parse := (aoc parse: 'R5, L5, R5, R3').
self assert: parse equals: ord .
self assert: (aoc execute: parse) equals: { 10@2 . 12}.
"R5, L5, R5, R3 leaves you 12 blocks away."



]

{ #category : 'tests' }
AOC2016Day1Test >> testExecutePart1 [
|aoc parse|
aoc := AOC2016Day1 new.
parse := (aoc parse: aoc input).
self assert: (aoc execute: parse) equals: { -140@138 . 278}.




]

{ #category : 'tests' }
AOC2016Day1Test >> testParse01 [
|aoc ord parse |
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 2}.
ord add: {#left . 3}.
parse := (aoc parse: 'R2, L3').
self assert: parse equals: ord .


]

{ #category : 'tests' }
AOC2016Day1Test >> testParse02 [
|aoc ord|
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 2}.
ord add: {#right . 2}.
ord add: {#right . 2}.
self assert: (aoc parse: 'R2, R2, R2') equals: ord .
"R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away."


]

{ #category : 'tests' }
AOC2016Day1Test >> testParse03 [
|aoc ord|
aoc := AOC2016Day1 new.
ord := OrderedCollection new.
ord add: {#right . 2}.
ord add: {#right . 2}.
ord add: {#right . 2}.
self assert: (aoc parse: 'R2, R2, R2') equals: ord .
"R5, L5, R5, R3 leaves you 12 blocks away."


]
