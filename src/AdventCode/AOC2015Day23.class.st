"
Usage: 

```
d := AOC2015Day23 new.
d part1.
```

Questions 
- can we not just write one parser 
- how do we extend the parser easily
- more optimisations available see code compression



Ideas 
- 1 code compression
```math
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].  <<< let say know land at rI = 2 
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
.... squash multiple incA together
inc A incA -> [ rA := rA + 2 . rI := rI + 2 ].
```

- 2 direct execution 
convert instruction to closure
```math
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ] 
```



```
jioA 16 -> 
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].  <<< let say know land at rI = 2 
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
... etc 
```

becomes 



phase One 

```
jioA 16 -> 
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
tpl A  -> [ rA := rA * 3 .  rI := rI + 1 ].
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
inc A  -> [ rA := rA + 1 .  rI := rI + 1 ].
... etc 
```


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
AOC2015Day23 >> howto [
<bad>
self shouldNotImplement .
"
p := AOC2015Day23Parser new.
p parsed.
c := AOC2015Day23Compiler new.
c header: (p parsed).
c exec: (p parsed).

d := AOC2015Day23 new.
d part1.

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

{ #category : 'accessing' }
AOC2015Day23 >> part1 [ 
| p c|
p := AOC2015Day23Parser new.
c := AOC2015Day23Compiler new.
^ c exec: (p parsed).


]

{ #category : 'accessing' }
AOC2015Day23 >> part2 [ 
| p c|
p := AOC2015Day23Parser new.
c := AOC2015Day23Compiler new.
^ c exec2: (p parsed).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> runInstruction: anArray [
 | in rA rB rI out opcode |
<bad>
self shouldNotImplement .

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
<bad>
self shouldNotImplement .

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
<bad>
self shouldNotImplement .
"use Taskit "
task := [ self runMayHang ] future.
task onSuccessDo: [ :v | answer := task . Transcript show: 'answer was ' ; show: answer ; cr].
task onFailureDo: [ :error | err := task .Transcript show: 'failure encountered - inspector launched ' ; cr . err inspect ].

]
