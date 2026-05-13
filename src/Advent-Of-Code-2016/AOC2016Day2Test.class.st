Class {
	#name : 'AOC2016Day2Test',
	#superclass : 'TestCase',
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'tests' }
AOC2016Day2Test >> testPart1 [

	self assert: AOC2016Day2 new part1 equals: { 7. 4. 9. 2. 1 } asOrderedCollection .
]

{ #category : 'tests' }
AOC2016Day2Test >> testPart2 [
 self assert: AOC2016Day2 new part2 equals: { 6. 5. 3. 2. 1 } asOrderedCollection .
	

]
