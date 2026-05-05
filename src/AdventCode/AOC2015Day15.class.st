Class {
	#name : 'AOC2015Day15',
	#superclass : 'Object',
	#instVars : [
		'best',
		'bestCol'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day15 >> brute [
|in |
in := self input.
best := 0.
[0 to: 100 do:[:a | 
 0 to: 100 do: [:b |
 0 to: 100 do: [:c |
 0 to: 100 do: [:d |
  | sum | 
  sum := a.
  sum := sum + b.
  sum := sum + c.
  sum := sum + d.
  sum = 100 ifTrue: [  self bruteHelper: in with: {a . b . c . d }. ]]]]]] fork.
]

{ #category : 'accessing' }
AOC2015Day15 >> bruteHelper: ex with: anArray [
	"44 teaspoons (d1)butterscotch and 56 teaspoons for (d2)cinnamon"

	| d1 d2 d3 d4 n1 n2 n3 n4 num prod tot proc out |
	d1 := (ex at: 1) at: 2.
	d2 := (ex at: 2) at: 2.
	d3 := (ex at: 3) at: 2.
	d4 := (ex at: 4) at: 2.
	n1 := anArray at: 1.
	n2 := anArray at: 2.
	n3 := anArray at: 3.
	n4 := anArray at: 4.	"num := OrderedCollection new.
proc := [ :n :d :s | (n * (d at: s))].
"

	num := {{n1 * (d1 at: #capacity).
				n2 * (d2 at: #capacity).
				n3 * (d3 at: #capacity).
				n4 * (d4 at: #capacity)}.
			{n1 * (d1 at: #durability).
				n2 * (d2 at: #durability).
				n3 * (d3 at: #durability).
				n4 * (d4 at: #durability)}.
			{n1 * (d1 at: #flavor).
				n2 * (d2 at: #flavor).
				n3 * (d3 at: #flavor).
				n4 * (d4 at: #flavor)}.
			{n1 * (d1 at: #texture).
				n2 * (d2 at: #texture).
				n3 * (d3 at: #texture).
				n4 * (d4 at: #texture)}}.
	prod := num collect: [ :pr | (pr at: 1) + (pr at: 2) + (pr at: 3) + (pr at: 4) ].
	tot := prod inject: 1 into: [ :acc :each | acc * each ].
	tot < 0 ifTrue: [ tot := 0 ]. 
 out := {d1.
		d2.
		d3.
		d4.
		num.
		prod.
		tot}.
 tot = best ifTrue: [ bestCol add: out. 
                      out printString traceCr. ].		
tot > best ifTrue: [ best := tot. 
                     bestCol := OrderedCollection new.
                     bestCol add: out.
                     out printString traceCr. ].
^ out.
]

{ #category : 'accessing' }
AOC2015Day15 >> example [
| s |
s := 'Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3'.
^ self split: s.
]

{ #category : 'as yet unclassified' }
AOC2015Day15 >> exampleRun [
"44 teaspoons (d1)butterscotch and 56 teaspoons for (d2)cinnamon"
| ex d1 d2 num prod tot |
ex := self example.
d1 := (ex at: 1) at: 2.
d2 := (ex at: 2) at: 2.
num := { { (44 * (d1 at: #capacity)).   (56 *(d2 at: #capacity)) } .
       { (44 * (d1 at: #durability)). (56 *(d2 at: #durability)) } .
       { (44 * (d1 at: #flavor)).     (56 *(d2 at: #flavor)) } .
       { (44 * (d1 at: #texture)).    (56 *(d2 at: #texture)) }}.
prod := num collect:[:pr | (pr at: 1) + (pr at: 2)].       
tot := prod inject: 1 into:[ :acc :each | acc * each ].
tot < 0 ifTrue:[ tot := 0 ] . 
^ { d1 . d2 . num . prod . tot }
]

{ #category : 'parsing' }
AOC2015Day15 >> input [
|s |
s := 'Sprinkles: capacity 5, durability -1, flavor 0, texture 0, calories 5
PeanutButter: capacity -1, durability 3, flavor 0, texture 0, calories 1
Frosting: capacity 0, durability -1, flavor 4, texture 0, calories 6
Sugar: capacity -1, durability 0, flavor 0, texture 2, calories 8'.
^ self split: s.
    
]

{ #category : 'parsing' }
AOC2015Day15 >> split: s [
" weakness Character lf versus Character cr "
| lines |
lines := s splitOn: Character lf. 
^ lines collect: [ :line | 
 |ig in props p1 p2 dict|
   dict := Dictionary new.
   ig := line splitOn: $: .
   in := ig at: 1.
   props := ig at: 2.
   p1 := props splitOn: $, .
   p2 := p1 collect:[:e | e splitOn: Character space ].
   "errant empty string at position 1 for some reason"
   p2 do:[ :pr |
     |key val| 
     key := (pr at: 2) asSymbol.
     val := (pr at: 3) asInteger.
     dict at: key put: val ].
    { in asSymbol . dict }
    ].
]
