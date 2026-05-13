Class {
	#name : 'AOC2016Day2Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'tests' }
AOC2016Day2Test >> testAllDirections [  
 | database handMaker h |
database := AOC2016Day2Hand2Database new.
handMaker := [:x | AOC2016Day2Hand2 new withDatabase: database at: x].
h := handMaker value: 1 .
self assert: (h left) keypad equals: 1. 
self assert: (h right) keypad equals: 1. 
self assert: (h up) keypad equals: 1. 
self assert: (h down) keypad equals: 3. 
h := handMaker value: 2 .
self assert: (h left) keypad equals: 2. 
self assert: (h right) keypad equals: 3. 
self assert: (h up) keypad equals: 2. 
self assert: (h down) keypad equals: 6. 
h := handMaker value: 3 .
self assert: (h left) keypad equals: 2. 
self assert: (h right) keypad equals: 4. 
self assert: (h up) keypad equals: 1. 
self assert: (h down) keypad equals: 7. 
h := handMaker value: 4 .
self assert: (h left) keypad equals: 3. 
self assert: (h right) keypad equals: 4. 
self assert: (h up) keypad equals: 4. 
self assert: (h down) keypad equals: 8. 
h := handMaker value: 5 .
self assert: (h left) keypad equals:  5. 
self assert: (h right) keypad equals: 6. 
self assert: (h up) keypad equals:    5. 
self assert: (h down) keypad equals:  5. 
h := handMaker value: 6 .
self assert: (h left) keypad equals:  5. 
self assert: (h right) keypad equals: 7. 
self assert: (h up) keypad equals:    2. 
self assert: (h down) keypad equals:  #a. 
h := handMaker value: 7 .
self assert: (h left) keypad equals:  6. 
self assert: (h right) keypad equals: 8. 
self assert: (h up) keypad equals:    3. 
self assert: (h down) keypad equals:  #b. 
h := handMaker value: 8 .
self assert: (h left) keypad equals:  7. 
self assert: (h right) keypad equals: 9. 
self assert: (h up) keypad equals:    4. 
self assert: (h down) keypad equals:  #c. 
h := handMaker value: 9 .
self assert: (h left) keypad equals:  8. 
self assert: (h right) keypad equals: 9. 
self assert: (h up) keypad equals:    9. 
self assert: (h down) keypad equals:  9. 
h := handMaker value: #a .
self assert: (h left) keypad equals:  #a. 
self assert: (h right) keypad equals: #b. 
self assert: (h up) keypad equals:    6. 
self assert: (h down) keypad equals:  #a. 
h := handMaker value: #b .
self assert: (h left) keypad equals:  #a. 
self assert: (h right) keypad equals: #c. 
self assert: (h up) keypad equals:    7. 
self assert: (h down) keypad equals:  #d. 
h := handMaker value: #c .
self assert: (h left) keypad equals:  #b. 
self assert: (h right) keypad equals: #c. 
self assert: (h up) keypad equals:    8. 
self assert: (h down) keypad equals:  #c. 
h := handMaker value: #d .
self assert: (h left) keypad equals:  #d. 
self assert: (h right) keypad equals: #d. 
self assert: (h up) keypad equals:    #b. 
self assert: (h down) keypad equals:  #d.
 





























	

]

{ #category : 'tests' }
AOC2016Day2Test >> testPart1 [

	self assert: AOC2016Day2 new part1 equals: { 7. 4. 9. 2. 1 } asOrderedCollection .
]

{ #category : 'tests' }
AOC2016Day2Test >> testPart2 [
 self assert: AOC2016Day2 new part2 equals: { #a . 6. #b. 3. 5 } asOrderedCollection .
	

]
