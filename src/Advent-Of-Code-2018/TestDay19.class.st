Class {
	#name : 'TestDay19',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'tests' }
TestDay19 >> testAddr [
| p r |
p :=  Day19 new.
r := p parse: 'addr 123 456 789'.
self assert: r equals: #( 'addr' . 123 . 456 . 789 ) .



]
