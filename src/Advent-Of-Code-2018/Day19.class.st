"
we need to load petitparser2 using metacello for development of the parse , 
once have parse we can drop requirement for petit

https://badetitou.fr/blog/2023-05-02-pharo-baselines-in-5mins


this is the tutorial below
https://kursjan.github.io/petitparser2/petitparser2.html

https://eng.libretexts.org/Bookshelves/Computer_Science/Programming_Languages/Book%3A_Deep_into_Pharo_(Bergel_Cassou_Ducasse_and_Laval)/17%3A_PetitParser__Building_Modular_Parsers/17.01%3A_Writing_Parsers_with_PetitParser



```
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.

i have a local repo - how do i use that ? 
Metacello new
    baseline: 'PetitParser2';
    repository: '~/src/Pharo/petitparser2/';
    load.
```




"
Class {
	#name : 'Day19',
	#superclass : 'Object',
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'accessing' }
Day19 >> asLines: aString [
^ aString splitOn: Character cr.

 "an OrderedCollection('This is line 1' 'This is line 2' 'This is line 3')"

]

{ #category : 'accessing' }
Day19 >> data [ 
" returns parsed data from input string"
| dat lines | 
dat := OrderedCollection new.
lines := (self asLines: (self input)).
1 to: (lines size) do: [ :i |
	| line |
	line := lines at: i .
	dat add: (self parse: line).
	 ].

^ dat .

]

{ #category : 'accessing' }
Day19 >> input [ 
^ '#ip 2
addi 2 16 2
seti 1 0 1
seti 1 3 3
mulr 1 3 5
eqrr 5 4 5
addr 5 2 2
addi 2 1 2
addr 1 0 0
addi 3 1 3
gtrr 3 4 5
addr 2 5 2
seti 2 6 2
addi 1 1 1
gtrr 1 4 5
addr 5 2 2
seti 1 1 2
mulr 2 2 2
addi 4 2 4
mulr 4 4 4
mulr 2 4 4
muli 4 11 4
addi 5 6 5
mulr 5 2 5
addi 5 19 5
addr 4 5 4
addr 2 0 2
seti 0 7 2
setr 2 6 5
mulr 5 2 5
addr 2 5 5
mulr 2 5 5
muli 5 14 5
mulr 5 2 5
addr 4 5 4
seti 0 7 0
seti 0 3 2'


]

{ #category : 'accessing' }
Day19 >> parse [ 
 " huh - given input parse it how ? "
"can we parse an integer "
"can we parse three integers "
"can we parse the command name"
"#ip n"
"addr n n n"
"addi n n n"
"seti n n n"
"mulr n n n"
"eqrr n n n"
"gtrr n n n"



]

{ #category : 'accessing' }
Day19 >> parse: aString [ 
| r1 theParser ip addr addi seti mulr eqrr gtrr int ws muli result tmp setr |

ip := ($# asPParser ,$i asPParser , $p asPParser) flatten .
addr := ($a asPParser , $d asPParser , $d asPParser , $r asPParser) flatten.
addi := ($a asPParser , $d asPParser , $d asPParser , $i asPParser) flatten.
seti := ($s asPParser , $e asPParser , $t asPParser , $i asPParser) flatten.
setr := ($s asPParser , $e asPParser , $t asPParser , $r asPParser) flatten.
mulr := ($m asPParser , $u asPParser , $l asPParser , $r asPParser) flatten.
muli := ($m asPParser , $u asPParser , $l asPParser , $i asPParser) flatten.
eqrr := ($e asPParser , $q asPParser , $r asPParser , $r asPParser) flatten.
gtrr := ($g asPParser , $t asPParser , $r asPParser , $r asPParser) flatten.
int := (#digit asPParser star) flatten. 
ws := (#space asPParser star) flatten. 

theParser := (ip , ws , int) /
( addr , ws ,int ,ws ,int ,ws ,int) /
( addi , ws ,int ,ws ,int ,ws ,int) /
( seti , ws ,int ,ws ,int ,ws ,int) /
( setr , ws ,int ,ws ,int ,ws ,int) /
( mulr , ws ,int ,ws ,int ,ws ,int) /
( muli , ws ,int ,ws ,int ,ws ,int) /
( eqrr , ws ,int ,ws ,int ,ws ,int) /
( gtrr , ws ,int ,ws ,int ,ws ,int) .

tmp := theParser parse: aString .

tmp ifNotNil:[ 
	
r1 := tmp at: 1 .	
	
(#('addr' . 'addi' . 'seti' . 'setr' . 'mulr' . 'muli' . 'eqrr' . 'gtrr') includes: r1 ) ifTrue:[ 
	| r3 r5 r7 | 
	r3 := (tmp at: 3) asInteger .
	r5 := (tmp at: 5) asInteger .
	r7 := (tmp at: 7) asInteger .
  ^ { r1 . r3 . r5 . r7 }	
	 ] 
ifFalse:[
	(#('#ip') includes: r1 ) ifTrue:[	| r3 |
										 	r3 := (tmp at: 3) asInteger .
											^ { r1 . r3 } ]
	ifFalse:[ 
		self halt: 'bad parse for {' , aString , '}'.
		^ nil.
		]. 	
]].



"
 huh - given input parse it how ? 
can we parse an integer 
can we parse three integers 
can we parse the command name
#ip n
addr n n n
addi n n n
seti n n n
mulr n n n
eqrr n n n
gtrr n n n
"





]

{ #category : 'accessing' }
Day19 >> workspace001 [
" 1=cmd 3 5 7 are index values as strings"
| d | 
d := Day19 new.
d parse: 'addr 1 2 3'. 
d parse: 'addr 123 456 7890'. 

]
