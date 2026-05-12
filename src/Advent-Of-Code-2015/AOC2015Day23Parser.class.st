Class {
	#name : 'AOC2015Day23Parser',
	#superclass : 'Object',
	#instVars : [
		'parsed'
	],
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> hlfA [
"hlf a"
^ 'hlf a' asPParser.




]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> incA [
"inc a"
^ 'inc a' asPParser.




]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> incB [
"inc b"
^ 'inc b' asPParser.




]

{ #category : 'initialization' }
AOC2015Day23Parser >> initialize [ 
parsed := (self interpretInput: (self input)).


]

{ #category : 'accessing' }
AOC2015Day23Parser >> input [ 
^ 'jio a, +16
inc a
inc a
tpl a
tpl a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
tpl a
tpl a
inc a
jmp +23
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
tpl a
inc a
inc a
tpl a
inc a
tpl a
inc a
tpl a
inc a
inc a
tpl a
inc a
tpl a
tpl a
inc a
jio a, +8
inc b
jie a, +4
tpl a
inc a
jmp +2
hlf a
jmp -7'.
]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> interpret: aString [
 | s parsers | 
s := aString.
parsers := { #incA . #incB . #jioA . #jieA . #jmp . #jmpNeg . #hlfA . #tplA  }.
parsers do: [ :p | 
	 | r | 
	 r := (self perform: p) parse: s.
	 r isPetit2Success ifTrue:[ 
			p = #incA ifTrue: [ ^ { #incA } ] .
			p = #hlfA ifTrue: [ ^ { #hlfA } ] .			
			p = #incB ifTrue: [ ^ { #incB } ] .
			p = #jmpNeg ifTrue: [ ^ { #jmp . ((r at:2) asInteger) negated } ] .			
			p = #jieA ifTrue: [ ^ { #jieA . ((r at:2)at:2) asInteger } ] .			
			p = #jioA ifTrue: [ ^ { #jioA . ((r at:2)at:2) asInteger } ] .
			p = #jmp ifTrue: [ ^ { #jmp . ((r at:2)at:2) asInteger } ] .
			p = #tplA ifTrue: [ ^ { #tplA  } ] .
			Error signal: 'forgot something'.
 ]].
Error signal: 'not recognised ' , aString.
self halt.




]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> interpretInput: aString [
 |input lines |
input := aString.
lines := input splitOn: Character cr.
^ lines collect: [ :cmd | self interpret: cmd ].

]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> jieA [
"jie a, +123"
^ ('jie a, ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> jioA [
"jio a, +123"
^ ('jio a, ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> jmp [
"jmp +123"
^ ('jmp ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> jmpNeg [
"jmp -123"
^ ('jmp -' asPParser , (#digit asPParser star flatten)).


]

{ #category : 'initialization' }
AOC2015Day23Parser >> parsed [ 
parsed ifNil: [ ^ (self interpretInput: (self input)) ]
       ifNotNil: [  ^ parsed ].


]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> plusInt [
"+123"
^ ($+ asPParser , (#digit asPParser star flatten)).



]

{ #category : 'as yet unclassified' }
AOC2015Day23Parser >> tplA [
"tpl a"
^ 'tpl a' asPParser.




]
