"
```
aoc := AOC2015Day17 new.
aoc example.
aoc input.
aoc exampleSearch.
aoc inputSearchRun. 

aoc part1. => 1304
aoc part2. => 18
```

development 

```
|choices|
choices := { 1 . 2 . 3 }.
choices inject: 0 into: [ :acc :each | 
	 acc + each ].
choices.

Transcript show: 'hi'.
3 to: 2 do:[:i |
	Transcript show: i ; cr. ].

""check sorting ""
{ 4 . 3 . 2 . 1  } sort:[:a :b | a < b ]. 
```
"
Class {
	#name : 'AOC2015Day17',
	#superclass : 'Object',
	#instVars : [
		'data',
		'choices'
	],
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'accessing' }
AOC2015Day17 >> choices [
 ^choices 


]

{ #category : 'accessing' }
AOC2015Day17 >> example [
^ { 20 .  15 . 10.  5.  5}
]

{ #category : 'accessing' }
AOC2015Day17 >> exampleSearch [
"all ways can make a certain number #(20 15 10 5 5) for 25 litres "
| arr sz target acc a b c d e |
target := 25.
arr := self example.
sz := arr size.
acc := OrderedCollection new.
"one"
(1 to: sz) do:[:ai | 
       a := arr at: ai.
       a = target ifTrue: [ acc add: { a }  ]].

"two"
(1 to: sz) do:[:ai | 
  ((ai + 1) to: sz) do:[:bi | 
      a := arr at: ai.
      b := arr at: bi.
     (a + b) = target ifTrue: [ acc add: { a . b }  ]]].

"three"
(1 to: sz) do:[:ai | 
  ((ai + 1) to: sz) do:[:bi | 
   ((bi + 1) to: sz) do:[:ci | 
      a := arr at: ai.
      b := arr at: bi.
      c := arr at: ci.
     ((a + b)+c) = target ifTrue: [ acc add: { a . b .c }  ]]]].

"four"     
(1 to: sz) do:[:ai | 
  ((ai + 1) to: sz) do:[:bi | 
   ((bi + 1) to: sz) do:[:ci | 
   ((ci + 1) to: sz) do:[:di | 
      a := arr at: ai.
      b := arr at: bi.
      c := arr at: ci.
      d := arr at: di.
     (((a + b)+c)+d) = target ifTrue: [ acc add: { a . b . c . d }  ]]]]].
     
"five"     
(1 to: sz) do:[:ai | 
  ((ai + 1) to: sz) do:[:bi | 
   ((bi + 1) to: sz) do:[:ci | 
   ((ci + 1) to: sz) do:[:di | 
   ((di + 1) to: sz) do:[:ei | 
      a := arr at: ai.
      b := arr at: bi.
      c := arr at: ci.
      d := arr at: di.
      e := arr at: ei.
     ((((a + b)+c)+d)+e) = target ifTrue: [ acc add: { a . b . c . d . e}  ]]]]]].
          
^ acc.     
]

{ #category : 'accessing' }
AOC2015Day17 >> initialize [
 data := self input.
choices := OrderedCollection  new.


]

{ #category : 'accessing' }
AOC2015Day17 >> input [
	^ {33.
		14.
		18.
		20.
		45.
		35.
		16.
		35.
		1.
		13.
		18.
		13.
		50.
		44.
		48.
		6.
		24.
		41.
		30.
		42}
]

{ #category : 'accessing' }
AOC2015Day17 >> inputSearch: cs last: last limit: lim depth: depth target: target tot: tot [

(tot = target) ifTrue:[ self record: cs . ^ #nomore ].
(tot > target) ifTrue:[ ^ #toofar ].
(last >= lim) ifTrue: [ ^ #nomore ].

(last + 1) to: (data size) do: [:i |
	| n c |
	n := data at: i .
	c := cs copy.
	c add: n.
	self inputSearch: c last: i limit: lim depth: (depth + 1) target: target tot: (tot + n)].

]

{ #category : 'accessing' }
AOC2015Day17 >> inputSearchRun [
"150 litre of eggnog "
choices := OrderedCollection  new.
	 1 to: data size do: [:i |
		| n c |
		n := data at: i .
		c := OrderedCollection new.
		c add: n .
		self inputSearch: c last: i limit: (data size) depth: 1 target: 150 tot: n ].
	

]

{ #category : 'accessing' }
AOC2015Day17 >> part1 [
 ^self inputSearchRun 


]

{ #category : 'accessing' }
AOC2015Day17 >> part2 [ 
"sort by min size "
 | r min | 
 r := (self inputSearchRun) choices .
 r sort: [:a :b | 
	 |va vb |
	va := a .
	vb := b . 
	
	 (a size) < (b size)].
 min := (r at: 1) size.
 ^ r reject:[:e | (e size) > min].


 

]

{ #category : 'actions api' }
AOC2015Day17 >> record: anObject [
 choices add: anObject.

]
