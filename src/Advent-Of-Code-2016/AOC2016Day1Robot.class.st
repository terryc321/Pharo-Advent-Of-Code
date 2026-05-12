"
a recording robot that remembers where it has gone , uses a dictionary lookup - perhaps better an array ?

"
Class {
	#name : 'AOC2016Day1Robot',
	#superclass : 'Object',
	#instVars : [
		'direction',
		'position',
		'visited',
		'path'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'initialization' }
AOC2016Day1Robot >> direction [
 ^ direction












]

{ #category : 'initialization' }
AOC2016Day1Robot >> forward: howFar [ 

1 to: howFar do: [ self forwardOneStep ].












]

{ #category : 'initialization' }
AOC2016Day1Robot >> forwardOneStep [ 
"psych orient : arbitrary x positive to right , y positive to vertical up"
direction = #north ifTrue:[ position := (position x)@(position y + 1) ].
direction = #east ifTrue:[ position := (position x - 1)@(position y) ].
direction = #south ifTrue:[ position := (position x)@(position y - 1) ].
direction = #west ifTrue:[ position := (position x + 1)@(position y) ].








]

{ #category : 'initialization' }
AOC2016Day1Robot >> howTo [ 

"t := TestCase new.
b := AOC2016DayCmCommandition.
b direction.
b forwardOneStep.
b turnRight.
b.
t assert: true equals: true.
t assert: true equals: false.

StPlaygroundDoItCommand browse.

StPlayground when: Announcement do: [ :ann |
    ""Your robot here""
    robot ifNotNil: [ robot refreshView ]
].
1 + 2 .


""Hook into Do It so the current Miller inspector refreshes automatically""
""=== dangerous !!! now knackered the Ctrl-d do it command ! sweet jesus===""
StPlaygroundDoItCommand 
    when: CmCommandExecuted 
    do: [ :ann |
        StPlayground allInstancesDo: [ :pg |
            pg inspector ifNotNil: [ :ins |
                ins refresh.
                ins millerList ifNotNil: [:m | m refresh]
            ]
        ]
    ].
"







]

{ #category : 'initialization' }
AOC2016Day1Robot >> initialize [ 
 position := 0@0 .
 direction := #north.
 visited := Dictionary new.
 path := OrderedCollection new.






]

{ #category : 'initialization' }
AOC2016Day1Robot >> path [ 
 ^ path 










]

{ #category : 'initialization' }
AOC2016Day1Robot >> position [
 ^ position 











]

{ #category : 'initialization' }
AOC2016Day1Robot >> turnLeft [

(direction = #north) ifTrue:[ direction := #west . ^ self ].
(direction = #east) ifTrue:[ direction := #north . ^ self  ].
(direction = #south) ifTrue:[ direction := #east . ^ self  ].
(direction = #west) ifTrue:[ direction := #south . ^ self  ].







]

{ #category : 'initialization' }
AOC2016Day1Robot >> turnRight [

direction = #north ifTrue:[ direction := #east. ^ self ].
direction = #east ifTrue:[ direction := #south .^ self ].
direction = #south ifTrue:[ direction := #west .^ self ].
direction = #west ifTrue:[ direction := #north .^ self].







]
