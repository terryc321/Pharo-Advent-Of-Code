"
Trying to understand why had such trouble using a closure and a temp variable. Think must have forgotten to put result of closure last , 
instead of side effect assignment. [ p add: choice ] and instead [ p add: choice. p ] 

"
Class {
	#name : 'AOC2015Day9Debug',
	#superclass : 'Object',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day9Debug >> recurse2: choices path: path [
choices isEmpty ifTrue: [ Transcript show: path ; cr . ^ #noMore ].
choices isEmpty ifTrue: [ Error signal: 'shouldnt have got here' ].
choices do: [ :choice | |a b |
 a:= choices reject:[ :e | e = choice ].
 b := [ | p |  p := path copy. p add: choice. p] value.
 self recurse2: a path: b]

]

{ #category : 'as yet unclassified' }
AOC2015Day9Debug >> recurse: choices path: path [
choices isEmpty ifTrue: [ Transcript show: path ; cr . ^ #noMore ].
choices isEmpty ifTrue: [ Error signal: 'shouldnt have got here' ].
choices do: [ :choice | |a b |
 a:= choices reject:[ :e | e = choice ].
 b := path copy.
 b add: choice.
 self recurse: a path: b]

]

{ #category : 'accessing' }
AOC2015Day9Debug >> run [
| size |
Transcript clear.
Transcript show: 'started run ..' ; cr.
size := 5.
1 to: size do: [ :n | | a b |
  a := (1 to: size) reject: [:e | e = n ].
  b := OrderedCollection new.
  b add: n.
  self recurse: a path: b ] .
Transcript show: 'finished run ..' ; cr.  

]

{ #category : 'as yet unclassified' }
AOC2015Day9Debug >> run2 [
| size |
Transcript clear.
Transcript show: 'started run ..' ; cr.
size := 5.
1 to: size do: [ :n | | a b |
  a := (1 to: size) reject: [:e | e = n ].
  b := [ | p | p := OrderedCollection new.  p add: n . p ] value.
  self recurse2: a path: b ] .
Transcript show: 'finished run ..' ; cr.  

]
