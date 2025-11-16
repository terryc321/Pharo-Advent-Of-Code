Class {
	#name : 'TestDay19',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'tests' }
TestDay19 >> testAddi [
| p r |
p :=  Day19 new.
r := p parse: 'addi 123 456 789'.
self assert: r equals: #( 'addi' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testAddr [
| p r |
p :=  Day19 new.
r := p parse: 'addr 123 456 789'.
self assert: r equals: #( 'addr' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testEqrr [
| p r |
p :=  Day19 new.
r := p parse: 'eqrr 123 456 789'.
self assert: r equals: #( 'eqrr' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testGtrr [
| p r |
p :=  Day19 new.
r := p parse: 'gtrr 123 456 789'.
self assert: r equals: #( 'gtrr' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testInput [
| p instr |
p :=  Day19 new.
instr := OrderedCollection  withAll: #(#('#ip' 2) #('addi' 2 16 2) #('seti' 1 0 1) #('seti' 1 3 3) #('mulr' 1 3 5) #('eqrr' 5 4 5) #('addr' 5 2 2) #('addi' 2 1 2) #('addr' 1 0 0) #('addi' 3 1 3) #('gtrr' 3 4 5) #('addr' 2 5 2) #('seti' 2 6 2) #('addi' 1 1 1) #('gtrr' 1 4 5) #('addr' 5 2 2) #('seti' 1 1 2) #('mulr' 2 2 2) #('addi' 4 2 4) #('mulr' 4 4 4) #('mulr' 2 4 4) #('muli' 4 11 4) #('addi' 5 6 5) #('mulr' 5 2 5) #('addi' 5 19 5) #('addr' 4 5 4) #('addr' 2 0 2) #('seti' 0 7 2) #('setr' 2 6 5) #('mulr' 5 2 5) #('addr' 2 5 5) #('mulr' 2 5 5) #('muli' 5 14 5) #('mulr' 5 2 5) #('addr' 4 5 4) #('seti' 0 7 0) #('seti' 0 3 2)).

"future if we ever change parser - check all parsing correctly"
self assert: (p data) equals: instr.




]

{ #category : 'tests' }
TestDay19 >> testIp [
| p r |
p :=  Day19 new.
r := p parse: '#ip 123'.
self assert: r equals: #( '#ip' 123 ) .



]

{ #category : 'tests' }
TestDay19 >> testMuli [
| p r |
p :=  Day19 new.
r := p parse: 'muli 123 456 789'.
self assert: r equals: #( 'muli' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testMulr [
| p r |
p :=  Day19 new.
r := p parse: 'mulr 123 456 789'.
self assert: r equals: #( 'mulr' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testSeti [
| p r |
p :=  Day19 new.
r := p parse: 'seti 123 456 789'.
self assert: r equals: #( 'seti' 123 456 789 ) .



]

{ #category : 'tests' }
TestDay19 >> testSetr [
| p r |
p :=  Day19 new.
r := p parse: 'setr 123 456 789'.
self assert: r equals: #( 'setr' 123 456 789 ) .



]
