Class {
	#name : 'AOC2025Day6SimpleTest',
	#superclass : 'TestCase',
	#category : 'AdventCode2025',
	#package : 'AdventCode2025'
}

{ #category : 'tests' }
AOC2025Day6SimpleTest >> testSolution1Part1 [
	self assert: (AOC2025Day6Simple new solution1Part1) = 4277556
	
	
	
	
	
	
	
	
	

]

{ #category : 'tests' }
AOC2025Day6SimpleTest >> testSolution1Part2 [
	self assert: AOC2025Day6Simple new solution1Part2 = 3263827
	
	
	

]

{ #category : 'tests' }
AOC2025Day6SimpleTest >> testSolution2Part1 [
	self assert: (((AOC2025Day6 new solution2Part1) at: 2) = 6169101504608)
	
	
	
	
	
	

]
