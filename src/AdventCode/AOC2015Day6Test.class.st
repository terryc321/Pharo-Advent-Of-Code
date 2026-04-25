Class {
	#name : 'AOC2015Day6Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day6Test >> testSolution1Part1 [
	self assert: (AOC2015Day6 new solution1Part1 = #('grid lights on=>' 543903 ' : grid lights off => ' 456097)).
	
	

]

{ #category : 'tests' }
AOC2015Day6Test >> testSolution1Part2 [
	self assert: ((AOC2015Day6 new solution1Part2) =  #('grid lights total =>' 14687245))
	

]

{ #category : 'tests' }
AOC2015Day6Test >> testSplitLines [
"quick visual check we get all input"
	self assert: ((AOC2015Day6 new puzzleInput splitOn: String cr) size) = 300. 
	
	
	

]
