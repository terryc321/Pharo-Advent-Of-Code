Class {
	#name : 'AOC2015Day23Compiler',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day23Compiler >> body: aParse [
| p col |
p := aParse.
col := OrderedCollection new.
1 to: p size do: [:n | 
	| cmd |
	cmd := p at: n.
	col add: 'installAt:' , n printString , 'with: ' , (self compile: cmd) , '.' ].
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
