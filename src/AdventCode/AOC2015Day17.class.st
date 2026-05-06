Class {
	#name : 'AOC2015Day17',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

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
          
     acc.     
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
