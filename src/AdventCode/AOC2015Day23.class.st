"
optimised ?

a long sequence of instructions could potentially be squashed into a single formulae
if know instruction pointer jumps into - say index 3 - 
lets say all instructions from index 3 to index 25 are , multiply a by 3 , add 1 to a , etc..
eventually just get a big formula of what happended to a . 
just compute it once - avoid having to increment - decode - or very least calling 20 odd procedures .









Petit Parser2

```
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

also see class {{AOC2015Day7}}


you can also try the gui but need RB .

```
Metacello new
	baseline: 'PetitParser2Gui';
	repository: 'github://kursjan/petitparser2';
   	load.
```


"
Class {
	#name : 'AOC2015Day23',
	#superclass : 'Object',
	#instVars : [
		'rA',
		'rB',
		'rI',
		'history',
		'parsed',
		'answer',
		'err'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day23 >> hlfA [
"hlf a"
^ 'hlf a' asPParser.




]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> howto [
"
|p|
p := #tplA.
AOC2015Day23>>p. 
day23 := AOC2015Day23 new.
day23 class >> p .  => tplA method of this class
day23 input.
day23 jio parse: 'jio a, '.
day23 jio parse: 'jio a,'.
day23 plusInt parse:'+123'.
day23 jio parse: 'jio a, +123'.
(day23 input) splitOn: Character lf collect: [ :cmd | 
	 day23 interpret: cmd ].
"

]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> incA [
"inc a"
^ 'inc a' asPParser.




]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> incB [
"inc b"
^ 'inc b' asPParser.




]

{ #category : 'initialization' }
AOC2015Day23 >> initialize [ 
parsed := (self interpretInput: (self input)).


]

{ #category : 'accessing' }
AOC2015Day23 >> input [ 
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
AOC2015Day23 >> interpret: aString [
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
AOC2015Day23 >> interpretInput: aString [
 |input lines |
input := aString.
lines := input splitOn: Character cr.
^ lines collect: [ :cmd | self interpret: cmd ].

]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jieA [
"jie a, +123"
^ ('jie a, ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jioA [
"jio a, +123"
^ ('jio a, ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jmp [
"jmp +123"
^ ('jmp ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jmpNeg [
"jmp -123"
^ ('jmp -' asPParser , (#digit asPParser star flatten)).


]

{ #category : 'initialization' }
AOC2015Day23 >> parsed [ 
parsed ifNil: [ ^ (self interpretInput: (self input)) ]
       ifNotNil: [  ^ parsed ].


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> plusInt [
"+123"
^ ($+ asPParser , (#digit asPParser star flatten)).



]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> runInstruction: anArray [
 | in rA rB rI out opcode |
in := anArray at: 1.
rA := anArray at: 2.
rB := anArray at: 3.
rI := anArray at: 4.
opcode := in at: 1.

"jioA jump if one - register A"
opcode = #jioA ifTrue: [ | dist | dist := in at: 2.  
	rA = 1 ifTrue: [ ^{ rA . rB . rI + dist } ] ifFalse: [ ^ { rA . rB . rI + 1 } ]].
opcode = #jieA ifTrue: [ | dist | dist := in at: 2.  
	rA even ifTrue: [ ^{ rA . rB . rI + dist } ] ifFalse: [ ^ { rA . rB . rI + 1 } ]].
opcode = #jmp ifTrue: [ | dist | dist := in at: 2.  ^ { rA . rB . rI + dist } ].
opcode = #incA ifTrue: [  ^  { rA + 1 . rB . rI + 1 } ].
opcode = #incB ifTrue: [ ^ { rA + 1 . rB . rI + 1 } ].
opcode = #tplA ifTrue: [ ^ { rA * 3 . rB . rI + 1 } ].
opcode = #hlfA ifTrue: [ ^ { rA // 2 . rB . rI + 1 } ].

Error signal: 'runInstruction bad opcode ' , opcode.

]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> runMayHang [ 
|tape rA rB rI |
tape := self parsed.
rA := 0.
rB := 0.
rI := 1.

[ rI >= 1 and: [rI <= (tape size) ] ] whileTrue: [ 
	| in out rI2|
	in := tape at: rI.
	"record instructions met along way"
	"hist add: { rA . rB . rI . in }. "
	"run one instruction"
	out := self runInstruction: { in . rA . rB . rI }.
	"new state now becomes current state"
	rA := out at: 1.
	rB := out at: 2.
	rI2 := out at: 3.
	"no index advancement"
	rI = rI2 ifTrue:[ Error signal: 'stalled' ].
	rI := rI2.
	 ].

^ { 'registerA=>' . rA . 'registerB=>' . rB  }
"hist add: { 'final' . rA . rB . rI } ."
"ran out memory if we stored history of all the moves made"





]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> runWithTaskit [
| task | 
"use Taskit "
task := [ self runMayHang ] future.
task onSuccessDo: [ :v | answer := task . Transcript show: 'answer was ' ; show: answer ; cr].
task onFailureDo: [ :error | err := task .Transcript show: 'failure encountered - inspector launched ' ; cr . err inspect ].

]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> tplA [
"tpl a"
^ 'tpl a' asPParser.




]
