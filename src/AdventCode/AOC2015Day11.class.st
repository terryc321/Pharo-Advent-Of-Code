"
Works downwards from string length 8 towards 1 , if goes below 1 an error is signalled

"
Class {
	#name : 'AOC2015Day11',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day11 >> containsIOL: s [
s do: [:ch | 
 ch = $i ifTrue:[ ^ true ].
 ch = $o ifTrue:[ ^ true ].
 ch = $l ifTrue:[ ^ true ].
].
^ false.
]

{ #category : 'accessing' }
AOC2015Day11 >> count: aString [
|s|
s := aString copy.
s size = 8 ifFalse: [Error signal: 'count string bad size'].
self inc: s at: 8.
^ s 
]

{ #category : 'accessing' }
AOC2015Day11 >> inc: s at: i [ 
| ch  |
i < 1 ifTrue:[ Error signal: 'count string - inc too large string size'].
ch := s at: i.
ch = $z ifTrue:[ s at: i put: $a . self inc: s at: (i - 1) ]
        ifFalse: [ | next |  
         next := ((ch asciiValue) + 1) asCharacter.
         s at: i put: next].
^s .          
	

]

{ #category : 'as yet unclassified' }
AOC2015Day11 >> pair: s at: i [
"pair of characters in string s - starting at index i"
i > (s size - 1) ifTrue:[ ^ false ].
(s at: i) = (s at: (i + 1)) ifTrue:[ ^ s at: i ] ifFalse: [^ false].
]

{ #category : 'as yet unclassified' }
AOC2015Day11 >> pairs: s [
| pairs | 
pairs := Set new.
1 to: 8 by: 2 do:[ :i |  
 |pr|
 pr := (self pair: s at: i).
 pr isCharacter ifTrue:[ pairs add: pr ]].
^ pairs size.
	

]

{ #category : 'as yet unclassified' }
AOC2015Day11 >> run: s [
| snext | 
snext := self count:s .
[self satisfy: snext] whileFalse:[
  snext := self count: snext ].
^ snext.  
  
]

{ #category : 'as yet unclassified' }
AOC2015Day11 >> satisfy: s [
(self containsIOL: s) ifTrue:[ ^ false ].
(self threeChars: s) ifFalse:[^ false].
((self pairs: s) < 2) ifTrue:[^ false].
^ true.

]

{ #category : 'as yet unclassified' }
AOC2015Day11 >> threeChars: s [
| a b c result|
"three characters of ascending ascii value - abc / def / ghi "
result := false.
1 to: 5 do:[:i |
 | ai bi ci |
 ai := 1 + i.
 bi := 2 + i.
 ci := 3 + i.  
 a := (s at: ai) asciiValue. 
 b := (s at: bi) asciiValue. 
 c := (s at: ci) asciiValue.
 (a + 1 = b and:[ b + 1 = c]) ifTrue:[ ^ true ]].

^ result.


]
