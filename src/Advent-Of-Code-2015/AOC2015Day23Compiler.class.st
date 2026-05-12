Class {
	#name : 'AOC2015Day23Compiler',
	#superclass : 'Object',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'accessing' }
AOC2015Day23Compiler >> body: aParse [
"take all parsed instructions and generate side-effect strings"
| p col |
p := aParse.
col := OrderedCollection new.
1 to: p size do: [:n | 
	| cmd |
	cmd := p at: n.
	col add: (self compile: cmd) , '.' ].
^ col.




]

{ #category : 'compiling' }
AOC2015Day23Compiler >> compile: anArray [
 | op op2 r | 
   r := anArray.
   op := anArray at: 1.
	op = #incA ifTrue: [ ^' [ "incA" rA := rA + 1. rI := rI + 1 ] ' ] .
	op = #incB ifTrue: [ ^' [ "incB" rB := rB + 1. rI := rI + 1 ] ' ] .
	op = #hlfA ifTrue: [ ^' [ "hlfA" rA := rA // 2. rI := rI + 1 ] ' ] .
	op = #jmp ifTrue: [ op2 := r at:2 . 
		 op2 < 0 ifTrue: [^' ["jmp"  rI := rI - ' , (op2 negated) printString ,  ' ] ' ]
		         ifFalse: [^' ["jmp"  rI := rI + ' , op2  printString ,  ' ] ' ]].		
	op = #jieA ifTrue: [ op2 := r at:2 . ^' ["jieA" rA even ifTrue:[ rI := rI + ' , op2 printString , '] ifFalse: [ rI := rI + 1 ]] '].
	op = #jioA ifTrue: [ op2 := r at:2 . ^' ["jioA" rA = 1 ifTrue:[ rI := rI + ' , op2 printString , '] ifFalse: [ rI := rI + 1 ]] '].
	op = #tplA ifTrue: [ ^' [ "tplA" rA := rA * 3. rI := rI + 1 ] ' ] .
	
	^ 'AOC2015Day23Compiler-unknown ' , anArray printString.
	
	"
			p = #jieA ifTrue: [ ^ { #jieA . ((r at:2)at:2) asInteger } ] .			
			p = #jioA ifTrue: [ ^ { #jioA . ((r at:2)at:2) asInteger } ] .
			p = #jmp ifTrue: [ ^ { #jmp . ((r at:2)at:2) asInteger } ] .
			p = #tplA ifTrue: [ ^ { #tplA  } ] .
			Error signal: 'forgot something'.
		"
Error signal: 'AOC2015Day23Compiler compile not recognised ' , anArray printString.


]

{ #category : 'as yet unclassified' }
AOC2015Day23Compiler >> exec2: aParse [
"registers initially zero"
|sz rA rB rI cmd|
"register A starts at 1 instead"
rA := 1. 
rB := 0.
"start at first instruction"
rI := 1.
cmd := { ["jioA" rA = 1 ifTrue:[ rI := rI + 16] ifFalse: [ rI := rI + 1 ]] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jmp"  rI := rI + 23 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jioA" rA = 1 ifTrue:[ rI := rI + 8] ifFalse: [ rI := rI + 1 ]] .
 [ "incB" rB := rB + 1. rI := rI + 1 ] .
 ["jieA" rA even ifTrue:[ rI := rI + 4] ifFalse: [ rI := rI + 1 ]] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jmp"  rI := rI + 2 ] .
 [ "hlfA" rA := rA // 2. rI := rI + 1 ] .
 ["jmp"  rI := rI - 7 ] .
}.
sz := cmd size.
[ rI >= 0 and: [rI <= sz]] whileTrue:[
	"execute each closure at index rI"
  (cmd at: rI) value].
^ {"rA" . rA . "rB=>" . rB } 



]

{ #category : 'as yet unclassified' }
AOC2015Day23Compiler >> exec: aParse [
"registers initially zero"
|sz rA rB rI cmd|
rA := 0. 
rB := 0.
"start at first instruction"
rI := 1.
cmd := { ["jioA" rA = 1 ifTrue:[ rI := rI + 16] ifFalse: [ rI := rI + 1 ]] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jmp"  rI := rI + 23 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jioA" rA = 1 ifTrue:[ rI := rI + 8] ifFalse: [ rI := rI + 1 ]] .
 [ "incB" rB := rB + 1. rI := rI + 1 ] .
 ["jieA" rA even ifTrue:[ rI := rI + 4] ifFalse: [ rI := rI + 1 ]] .
 [ "tplA" rA := rA * 3. rI := rI + 1 ] .
 [ "incA" rA := rA + 1. rI := rI + 1 ] .
 ["jmp"  rI := rI + 2 ] .
 [ "hlfA" rA := rA // 2. rI := rI + 1 ] .
 ["jmp"  rI := rI - 7 ] .
}.
sz := cmd size.
[ rI >= 0 and: [rI <= sz]] whileTrue:[
	"execute each closure at index rI"
  (cmd at: rI) value].
^ {"rA" . rA . "rB=>" . rB } 



]

{ #category : 'accessing' }
AOC2015Day23Compiler >> header [
^'compute
"registers initially zero"
rA := 0. 
rB := 0.
"start at first instruction"
rI := 1. 
'
]

{ #category : 'accessing' }
AOC2015Day23Compiler >> header: aParse [
Transcript clear.
Transcript show: 'compute:
"registers initially zero"
|sz|
rA := 0. 
rB := 0.
"start at first instruction"
rI := 1.
cmd := {'.

"print the commands"
(self body: aParse) do: [:s | Transcript show: s ; cr].

Transcript show: '}.
sz := cmd size.
[ rI >= 0 and: [rI <= sz]] whileTrue:[
	"execute each closure at index rI"
  (cmd at: rI) value].
'.

]

{ #category : 'accessing' }
AOC2015Day23Compiler >> howto [
"p := AOC2015Day23Parser new.
p parsed.
c := AOC2015Day23Compiler new.
c header: (p parsed).

p := AOC2015Day23Parser new.
p parsed.
c := AOC2015Day23Compiler new.
c body: (p parsed).
"


]
