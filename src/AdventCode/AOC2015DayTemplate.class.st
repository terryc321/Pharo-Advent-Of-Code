"
```language=Pharo
AOC2015Day1 puzzleInput inspect.
AOC2015Day1 puzzlePart1 inspect.
AOC2015Day1 puzzlePart2 inspect.
AOC2015Day1 solution1Part1 . ""280""
AOC2015Day1 solution1Part2 . ""1797""
```

AOC2015Day1 is class name since all classes live in the global scope
AdventCode is the package name 

AOC2015Day1 input 
a class side method to return pattern of '()()()()()'




"
Class {
	#name : 'AOC2015DayTemplate',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015DayTemplate >> about [
	"comment stating purpose of class-side method"
^ 'made AOC2015Day1 input -- a class side method so available to all Day1s. 
'

]

{ #category : 'accessing' }
AOC2015DayTemplate >> puzzleInput [ 
^ ''.

]

{ #category : 'as yet unclassified' }
AOC2015DayTemplate >> puzzlePart1 [	
^ ' 
'

]

{ #category : 'as yet unclassified' }
AOC2015DayTemplate >> puzzlePart2 [	
^ ' 

'

]

{ #category : 'as yet unclassified' }
AOC2015DayTemplate >> solution1Part1 [
| h |
h := 0 . "initial height is zero"
"is a string already an orderedcollection ?"
self puzzleInput do: [ :e |
	e = $( ifTrue: [ h := h + 1 ] ifFalse: [ e = $) ifTrue: [ h := h - 1 ] ]].
^ h .

]

{ #category : 'as yet unclassified' }
AOC2015DayTemplate >> solution1Part2 [
| puz sz h |
puz := self puzzleInput. "the string itself"
sz := puz size . "size of input"
h := 0. "initial height zero"
1 to: sz do: [ :i | 
		| e | "element e - a character in string"
	e := puz at: i . "get a character"
	e = $( ifTrue: [ h := h + 1 ] ifFalse: [ e = $) ifTrue: [ h := h - 1 ]]. 
	h < 0 ifTrue: [ ^ i ]
		 ].
"never entered basement"
Error signal: 'Santa never entered basement'.




]
