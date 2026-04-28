"
```language=Pharo
aoc := AOC2015Day7 new.
aoc parsePass: (aoc puzzleInput).
aoc computePass: #a.
aoc.
aoc dict at: #a . ""examine result stored in a ""
```




requires petitparser2 if going to run these - until we can write the equivalent in smalltalk
parsing should really take care of whether 'lf' becomes a symbol #lf , and whether '123' becomes integer 123.
dict instance variable = symbol values #lf can be nil undefined or should have a numerical value 0 to 65535 inclusive 16bit

```
16rFFFF 
```

```language=text
can we define an infix operator in smalltalk ?
```

https://github.com/kursjan/petitparser2

```language=Pharo
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

AOC2015Day1 is class name since all classes live in the global scope
AdventCode is the package name 

AOC2015Day1 input 
a class side method to return pattern of '()()()()()'




"
Class {
	#name : 'AOC2015Day7',
	#superclass : 'Object',
	#instVars : [
		'dict',
		'rules',
		'children',
		'process'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7 >> addRule: rule [ 
 rules add: rule .




]

{ #category : 'accessing' }
AOC2015Day7 >> children [ 
 ^ children


]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> computePass2: aSymbol [
	"use parsePass before this. repeatedly compute all nodes until this node is ready"

	"| targetNode allNodes todo i |
	targetNode := self dict at: aSymbol."
	|allNodes| 
	allNodes := self dict asOrderedCollection.

	allNodes do: [ :node |
			(node ready) ifFalse: [ "only if node is not ready. num node already "
					node isAssignNode ifTrue: [
							node left ready ifTrue: [
								Transcript show: 'assignment progress.' ; cr.
									node val: node left val.
									^ true ] ].
					node isNotNode ifTrue: [
							node left ready ifTrue: [
								Transcript show: 'negation progress.' ; cr.								
									node val: node left val.
									^ true ] ].
					node isAndNode ifTrue: [
							(node left ready and: [ node right ready ]) ifTrue: [
								Transcript show: 'conjunction progress.' ; cr.																
									node val: node left val + node right val.
									^ true ] ].
					node isOrNode ifTrue: [
							(node left ready and: [ node right ready ]) ifTrue: [
									node val: node left val + node right val.
								Transcript show: 'disjunction progress.' ; cr.																	
									^ true ] ].
					node isLShiftNode ifTrue: [
							(node left ready and: [ node right ready ]) ifTrue: [
											Transcript show: 'left shift progress.' ; cr.								
									node val: node left val + node right val.
									^ true ] ].
					node isRShiftNode ifTrue: [
							(node left ready and: [ node right ready ]) ifTrue: [
								Transcript show: 'right shift progress.' ; cr.																
									node val: node left val + node right val.
									^ true ] ] ] ].
					
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> computePass: aSymbol [
	"use parsePass before this. repeatedly compute all nodes until this node is ready"

	| targetNode allNodes stop i |
	targetNode := self dict at: aSymbol.
	allNodes := self dict asOrderedCollection.
   
	stop := false.
	i := 0.
	[ targetNode ready not and: [ stop not ] ] whileTrue: [
			allNodes do: [ :node |
					i := i + 1.
					Processor yield. "give something else a change to run"
					Transcript
						show: 'visiting node ' , i printString , ' =>';
						show: node;
						cr.
					node ready ifFalse: [
							node compute.
							node ready ifTrue: [
									Transcript
										show: 'computed =>';
										show: node;
										cr.
									stop := true ] ] ] ].
	^ self
]

{ #category : 'initialization' }
AOC2015Day7 >> dict [ 
^ dict 



]

{ #category : 'initialization' }
AOC2015Day7 >> initialize [ 
"dict to new dictionary , rules to new collection"
 self reset 



]

{ #category : 'accessing' }
AOC2015Day7 >> interAnd: aCollection [

	| a b c |
	a := aCollection at: 1. "a will be symbol or integer"
	b := aCollection at: 3.
	c := aCollection at: 5.
	c isSymbol ifTrue: [
			| t |
			t := AOC2015Day7AndNode new.
			t addChild: a.
			t addChild: b.
			dict at: c put: t ]
		
	
]

{ #category : 'accessing' }
AOC2015Day7 >> interAssign: aCollection [
	"#lf -> #gf"

	| a c |
	a := aCollection at: 1.
	c := aCollection at: 3.
	(c isSymbol) ifTrue: [
			| t |
			t := AOC2015Day7AssignNode new.
			t val: a.
			dict at: c put: t ]
		
		
		
	
]

{ #category : 'accessing' }
AOC2015Day7 >> interLShift: aCollection [
	"#lf #LSHIFT #ge #-> #hf ; really should be HF node is determined from LF and GE nodes"

	| a b c |
	a := aCollection at: 1. "a will be symbol or integer"
	b := aCollection at: 3.
	c := aCollection at: 5.
	(c isSymbol) ifTrue: [
			| t |
			t := AOC2015Day7LShiftNode new.
			t addDependent: a.
			t addDependent: b.
			dict at: c put: t ]
		
	
]

{ #category : 'accessing' }
AOC2015Day7 >> interNot: aCollection [
	"#NOT #lf -> #bc"

	| a c |
	a := aCollection at: 2.
	c := aCollection at: 3.
	c isSymbol ifTrue: [
			| t |
			t := AOC2015Day7NotNode new.
			t addDependent: a.
			dict at: c put: t ]
]

{ #category : 'accessing' }
AOC2015Day7 >> interOr: aCollection [
	"#lf #AND #ge #-> #hf ; really should be HF node is determined from LF and GE nodes"

	| a b c |
	a := aCollection at: 1. "a will be symbol or integer"
	b := aCollection at: 3.
	c := aCollection at: 5.
	c isSymbol ifTrue: [
			| t |
			t := AOC2015Day7OrNode new.
			t addDependent: a.
			t addDependent: b.
			dict at: c put: t ]
]

{ #category : 'accessing' }
AOC2015Day7 >> interRShift: aCollection [
	"#lf #RSHIFT #ge #-> #hf ; really should be HF node is determined from LF and GE nodes"

	| a b c |
	a := aCollection at: 1. "a will be symbol or integer"
	b := aCollection at: 3.
	c := aCollection at: 5.
	c isSymbol ifTrue: [
			| t |
			t := AOC2015Day7RShiftNode new.
			t addDependent: a.
			t addDependent: b.
			dict at: c put: t ]
]

{ #category : 'testing' }
AOC2015Day7 >> isDetermined: s [
 "either it is an integer - or a symbol whose value in dict is an integer"
	^ s isInteger or: [ (dict at: s ifAbsent:[ ^ false]) isInteger ]
	

]

{ #category : 'initialization' }
AOC2015Day7 >> lookup: aSymbol [ 
^ dict at: aSymbol . 





]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parse: in [
 "for given input try each of the parsers in turn until throw the towel in. 
 1 parseAnd 2parseOr 3parseLShift 4parseRShift 5parseAssign 6parseNot"
 | out ok | 
ok := false.
out := self parseAnd: in. out className = 'Array' ifTrue:[	self interAnd: out. ok := true ].
out := self parseOr: in. out className = 'Array' ifTrue:[	self interOr: out. ok := true ].	
out := self parseNot: in. out className = 'Array' ifTrue:[	self interNot: out. ok := true ].			
out := self parseLShift: in. out className = 'Array' ifTrue:[	self interLShift: out. ok := true ].			
out := self parseRShift: in. out className = 'Array' ifTrue:[	self interRShift: out. ok := true ].												
out := self parseAssign: in. out className = 'Array' ifTrue:[	self interAssign: out. ok := true ].													
ok ifFalse: [ Error signal: 'parse not handled' ].




]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseAnd: input [

	| variable op impliesOp expression |
	variable := #word asPParser star flatten.
	op := 'AND' asPParser trim.
	impliesOp := '->' asPParser trim.
	expression := variable , op , variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first asSymbolOrInteger.
			              nodes second asSymbol.
			              nodes third asSymbolOrInteger.
			              nodes fourth asSymbol.
			              nodes fifth asSymbolOrInteger } ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseAssign: input [

	| variable impliesOp expression |
	variable := #word asPParser star flatten.	
	impliesOp := '->' asPParser trim.
	expression := variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first asSymbolOrInteger .
			              nodes second.
			              nodes third asSymbolOrInteger
			} ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseLShift: input [

	| variable op impliesOp expression |
	variable := #word asPParser star flatten.
	op := 'LSHIFT' asPParser trim.
	impliesOp := '->' asPParser trim.
	expression := variable , op , variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first asSymbolOrInteger.
			              nodes second.
			              nodes third asSymbolOrInteger.
			              nodes fourth.
			              nodes fifth asSymbolOrInteger } ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseNot: input [

	| variable notOp impliesOp expression |
	variable := #word asPParser star flatten.
	notOp := 'NOT' asPParser trim.
	impliesOp := '->' asPParser trim.
	expression := notOp , variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first.
			              nodes second asSymbolOrInteger.
			              nodes third.
			              nodes fourth asSymbolOrInteger
			} ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseOr: input [

	| variable op impliesOp expression |
	variable := #word asPParser star flatten.
	op := 'OR' asPParser trim.
	impliesOp := '->' asPParser trim.
	expression := variable , op , variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first asSymbolOrInteger.
			              nodes second.
			              nodes third asSymbolOrInteger.
			              nodes fourth.
			              nodes fifth asSymbolOrInteger} ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parsePass: inputLines [
"for given input try each of the parsers in turn until throw the towel in. 
 1 parseAnd 2parseOr 3parseLShift 4parseRShift 5parseAssign 6parseNot
in this game , nodes point back towards their dependencies . 
so may only be one number '1' node represent integer 1 , but many nodes may have this node as either left or right child - ok.
"

	| out ok |
	self reset.
	inputLines do: [ :in |
			ok := false. "pass 1" "#lf #AND #bg -> #cd"
			out := self parseAnd: in.
			out className = 'Array' ifTrue: [
					| a b c |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					b isInteger ifTrue: [dict at: b put: ([ |node| node := AOC2015Day7NumNode new. node val: b. node ] value) ].
					dict at: c put: ([ |node| node := AOC2015Day7AndNode new. node addChild: a. node addChild: b. node ] value).
					ok := true.
					]. "#x #OR #y -> #z"
			out := self parseOr: in.
			out className = 'Array' ifTrue: [
					| a b c |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					b isInteger ifTrue: [dict at: b put: ([ |node| node := AOC2015Day7NumNode new. node val: b. node ] value) ].					
					dict at: c put: ([ |node| node := AOC2015Day7OrNode new. node addChild: a. node addChild: b. node ] value).
					ok := true. ]. "#x #RSHIFT #y -> #z"
			out := self parseLShift: in.
			out className = 'Array' ifTrue: [
					| a b c |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					b isInteger ifTrue: [dict at: b put: ([ |node| node := AOC2015Day7NumNode new. node val: b. node ] value) ].										
					dict at: c put: ([ |node| node := AOC2015Day7LShiftNode new. node addChild: a. node addChild: b. node ] value).
					ok := true. ]. "#x #LSHIFT #y -> #z"
			out := self parseRShift: in.
			out className = 'Array' ifTrue: [
					| a b c |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					b isInteger ifTrue: [dict at: b put: ([ |node| node := AOC2015Day7NumNode new. node val: b. node ] value) ].					
					dict at: c put: ([ |node| node := AOC2015Day7RShiftNode new. node addChild: a. node addChild: b. node ] value).
					ok := true. ]. "#NOT #x -> #y"
			out := self parseNot: in.
			out className = 'Array' ifTrue: [
					| a b |
					a := out at: 2.
					b := out at: 4.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					dict at: b put: ([ |node| node := AOC2015Day7NotNode new. node addChild: a. node ] value).
					ok := true. ]. "#x -> #y"
			out := self parseAssign: in.
			out className = 'Array' ifTrue: [
					| a b |
					a := out at: 1.
					b := out at: 3.
					a isInteger ifTrue: [dict at: a put: ([ |node| node := AOC2015Day7NumNode new. node val: a. node ] value) ].
					dict at: b put: ([ |node| node := AOC2015Day7AssignNode new. node addChild: a. node ] value).
					ok := true. ].
			ok ifFalse: [ Error signal: 'parse not handled' ] ].
		 "pass 2" 
		
	inputLines do: [ :in |
			ok := false. 
			out := self parseAnd: in.
			out className = 'Array' ifTrue: [
					| a b c node |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					node := dict at: c.
					node left: (dict at: a).
					node right: (dict at: b).
					ok := true.
					]. "#x #OR #y -> #z"
			out := self parseOr: in.
			out className = 'Array' ifTrue: [
					| a b c node |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					node := dict at: c.
					node left: (dict at: a).
					node right: (dict at: b).
					ok := true. ]. "#x #RSHIFT #y -> #z"
			out := self parseLShift: in.
			out className = 'Array' ifTrue: [
					| a b c node |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					node := dict at: c.
					node left: (dict at: a).
					node right: (dict at: b).
					ok := true. ]. "#x #LSHIFT #y -> #z"
			out := self parseRShift: in.
			out className = 'Array' ifTrue: [
					| a b c node |
					a := out at: 1.
					b := out at: 3.
					c := out at: 5.
					node := dict at: c.
					node left: (dict at: a).
					node right: (dict at: b).
					ok := true. ]. "#NOT #x -> #y"
			out := self parseNot: in.
			out className = 'Array' ifTrue: [
					| a b node |
					a := out at: 2.
					b := out at: 4.
					node := dict at: b.
					node left: (dict at: a).
					ok := true. ]. "#x -> #y"
			out := self parseAssign: in.
			out className = 'Array' ifTrue: [
					| a b node |
					a := out at: 1.
					b := out at: 3.
					node := dict at: b.
					node left: (dict at: a).
					ok := true. ].
			ok ifFalse: [ Error signal: 'parse not handled' ] ].



]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> parseRShift: input [

	| variable op impliesOp expression |
	variable := #word asPParser star flatten.
	op := 'RSHIFT' asPParser trim.
	impliesOp := '->' asPParser trim.
	expression := variable , op , variable , impliesOp , variable ==> [ :nodes |
		              {
			              nodes first asSymbolOrInteger.
			              nodes second.
			              nodes third asSymbolOrInteger.
			              nodes fourth .
			              nodes fifth asSymbolOrInteger } ].

	^ expression parse: input
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> part1 [ 
| progress | 
progress := true .
process := [ self computePass: #a ] forkAt: Processor userBackgroundPriority.
process name: 'My Background Process for day7'.

  "[ progress ] whileTrue: [ 
    self computePass: #a.
    Transcript show: 'Running...'; cr.
    Processor yield.  
    progress := false.  "  






]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> part1halt [
"Later, to terminate it:"
process terminate.

]

{ #category : 'accessing' }
AOC2015Day7 >> puzzleInput [ 
^ 'lf AND lq -> ls
iu RSHIFT 1 -> jn
bo OR bu -> bv
gj RSHIFT 1 -> hc
et RSHIFT 2 -> eu
bv AND bx -> by
is OR it -> iu
b OR n -> o
gf OR ge -> gg
NOT kt -> ku
ea AND eb -> ed
kl OR kr -> ks
hi AND hk -> hl
au AND av -> ax
lf RSHIFT 2 -> lg
dd RSHIFT 3 -> df
eu AND fa -> fc
df AND dg -> di
ip LSHIFT 15 -> it
NOT el -> em
et OR fe -> ff
fj LSHIFT 15 -> fn
t OR s -> u
ly OR lz -> ma
ko AND kq -> kr
NOT fx -> fy
et RSHIFT 1 -> fm
eu OR fa -> fb
dd RSHIFT 2 -> de
NOT go -> gp
kb AND kd -> ke
hg OR hh -> hi
jm LSHIFT 1 -> kg
NOT cn -> co
jp RSHIFT 2 -> jq
jp RSHIFT 5 -> js
1 AND io -> ip
eo LSHIFT 15 -> es
1 AND jj -> jk
g AND i -> j
ci RSHIFT 3 -> ck
gn AND gp -> gq
fs AND fu -> fv
lj AND ll -> lm
jk LSHIFT 15 -> jo
iu RSHIFT 3 -> iw
NOT ii -> ij
1 AND cc -> cd
bn RSHIFT 3 -> bp
NOT gw -> gx
NOT ft -> fu
jn OR jo -> jp
iv OR jb -> jc
hv OR hu -> hw
19138 -> b
gj RSHIFT 5 -> gm
hq AND hs -> ht
dy RSHIFT 1 -> er
ao OR an -> ap
ld OR le -> lf
bk LSHIFT 1 -> ce
bz AND cb -> cc
bi LSHIFT 15 -> bm
il AND in -> io
af AND ah -> ai
as RSHIFT 1 -> bl
lf RSHIFT 3 -> lh
er OR es -> et
NOT ax -> ay
ci RSHIFT 1 -> db
et AND fe -> fg
lg OR lm -> ln
k AND m -> n
hz RSHIFT 2 -> ia
kh LSHIFT 1 -> lb
NOT ey -> ez
NOT di -> dj
dz OR ef -> eg
lx -> a
NOT iz -> ja
gz LSHIFT 15 -> hd
ce OR cd -> cf
fq AND fr -> ft
at AND az -> bb
ha OR gz -> hb
fp AND fv -> fx
NOT gb -> gc
ia AND ig -> ii
gl OR gm -> gn
0 -> c
NOT ca -> cb
bn RSHIFT 1 -> cg
c LSHIFT 1 -> t
iw OR ix -> iy
kg OR kf -> kh
dy OR ej -> ek
km AND kn -> kp
NOT fc -> fd
hz RSHIFT 3 -> ib
NOT dq -> dr
NOT fg -> fh
dy RSHIFT 2 -> dz
kk RSHIFT 2 -> kl
1 AND fi -> fj
NOT hr -> hs
jp RSHIFT 1 -> ki
bl OR bm -> bn
1 AND gy -> gz
gr AND gt -> gu
db OR dc -> dd
de OR dk -> dl
as RSHIFT 5 -> av
lf RSHIFT 5 -> li
hm AND ho -> hp
cg OR ch -> ci
gj AND gu -> gw
ge LSHIFT 15 -> gi
e OR f -> g
fp OR fv -> fw
fb AND fd -> fe
cd LSHIFT 15 -> ch
b RSHIFT 1 -> v
at OR az -> ba
bn RSHIFT 2 -> bo
lh AND li -> lk
dl AND dn -> do
eg AND ei -> ej
ex AND ez -> fa
NOT kp -> kq
NOT lk -> ll
x AND ai -> ak
jp OR ka -> kb
NOT jd -> je
iy AND ja -> jb
jp RSHIFT 3 -> jr
fo OR fz -> ga
df OR dg -> dh
gj RSHIFT 2 -> gk
gj OR gu -> gv
NOT jh -> ji
ap LSHIFT 1 -> bj
NOT ls -> lt
ir LSHIFT 1 -> jl
bn AND by -> ca
lv LSHIFT 15 -> lz
ba AND bc -> bd
cy LSHIFT 15 -> dc
ln AND lp -> lq
x RSHIFT 1 -> aq
gk OR gq -> gr
NOT kx -> ky
jg AND ji -> jj
bn OR by -> bz
fl LSHIFT 1 -> gf
bp OR bq -> br
he OR hp -> hq
et RSHIFT 5 -> ew
iu RSHIFT 2 -> iv
gl AND gm -> go
x OR ai -> aj
hc OR hd -> he
lg AND lm -> lo
lh OR li -> lj
da LSHIFT 1 -> du
fo RSHIFT 2 -> fp
gk AND gq -> gs
bj OR bi -> bk
lf OR lq -> lr
cj AND cp -> cr
hu LSHIFT 15 -> hy
1 AND bh -> bi
fo RSHIFT 3 -> fq
NOT lo -> lp
hw LSHIFT 1 -> iq
dd RSHIFT 1 -> dw
dt LSHIFT 15 -> dx
dy AND ej -> el
an LSHIFT 15 -> ar
aq OR ar -> as
1 AND r -> s
fw AND fy -> fz
NOT im -> in
et RSHIFT 3 -> ev
1 AND ds -> dt
ec AND ee -> ef
NOT ak -> al
jl OR jk -> jm
1 AND en -> eo
lb OR la -> lc
iu AND jf -> jh
iu RSHIFT 5 -> ix
bo AND bu -> bw
cz OR cy -> da
iv AND jb -> jd
iw AND ix -> iz
lf RSHIFT 1 -> ly
iu OR jf -> jg
NOT dm -> dn
lw OR lv -> lx
gg LSHIFT 1 -> ha
lr AND lt -> lu
fm OR fn -> fo
he RSHIFT 3 -> hg
aj AND al -> am
1 AND kz -> la
dy RSHIFT 5 -> eb
jc AND je -> jf
cm AND co -> cp
gv AND gx -> gy
ev OR ew -> ex
jp AND ka -> kc
fk OR fj -> fl
dy RSHIFT 3 -> ea
NOT bs -> bt
NOT ag -> ah
dz AND ef -> eh
cf LSHIFT 1 -> cz
NOT cv -> cw
1 AND cx -> cy
de AND dk -> dm
ck AND cl -> cn
x RSHIFT 5 -> aa
dv LSHIFT 1 -> ep
he RSHIFT 2 -> hf
NOT bw -> bx
ck OR cl -> cm
bp AND bq -> bs
as OR bd -> be
he AND hp -> hr
ev AND ew -> ey
1 AND lu -> lv
kk RSHIFT 3 -> km
b AND n -> p
NOT kc -> kd
lc LSHIFT 1 -> lw
km OR kn -> ko
id AND if -> ig
ih AND ij -> ik
jr AND js -> ju
ci RSHIFT 5 -> cl
hz RSHIFT 1 -> is
1 AND ke -> kf
NOT gs -> gt
aw AND ay -> az
x RSHIFT 2 -> y
ab AND ad -> ae
ff AND fh -> fi
ci AND ct -> cv
eq LSHIFT 1 -> fk
gj RSHIFT 3 -> gl
u LSHIFT 1 -> ao
NOT bb -> bc
NOT hj -> hk
kw AND ky -> kz
as AND bd -> bf
dw OR dx -> dy
br AND bt -> bu
kk AND kv -> kx
ep OR eo -> eq
he RSHIFT 1 -> hx
ki OR kj -> kk
NOT ju -> jv
ek AND em -> en
kk RSHIFT 5 -> kn
NOT eh -> ei
hx OR hy -> hz
ea OR eb -> ec
s LSHIFT 15 -> w
fo RSHIFT 1 -> gh
kk OR kv -> kw
bn RSHIFT 5 -> bq
NOT ed -> ee
1 AND ht -> hu
cu AND cw -> cx
b RSHIFT 5 -> f
kl AND kr -> kt
iq OR ip -> ir
ci RSHIFT 2 -> cj
cj OR cp -> cq
o AND q -> r
dd RSHIFT 5 -> dg
b RSHIFT 2 -> d
ks AND ku -> kv
b RSHIFT 3 -> e
d OR j -> k
NOT p -> q
NOT cr -> cs
du OR dt -> dv
kf LSHIFT 15 -> kj
NOT ac -> ad
fo RSHIFT 5 -> fr
hz OR ik -> il
jx AND jz -> ka
gh OR gi -> gj
kk RSHIFT 1 -> ld
hz RSHIFT 5 -> ic
as RSHIFT 2 -> at
NOT jy -> jz
1 AND am -> an
ci OR ct -> cu
hg AND hh -> hj
jq OR jw -> jx
v OR w -> x
la LSHIFT 15 -> le
dh AND dj -> dk
dp AND dr -> ds
jq AND jw -> jy
au OR av -> aw
NOT bf -> bg
z OR aa -> ab
ga AND gc -> gd
hz AND ik -> im
jt AND jv -> jw
z AND aa -> ac
jr OR js -> jt
hb LSHIFT 1 -> hv
hf OR hl -> hm
ib OR ic -> id
fq OR fr -> fs
cq AND cs -> ct
ia OR ig -> ih
dd OR do -> dp
d AND j -> l
ib AND ic -> ie
as RSHIFT 3 -> au
be AND bg -> bh
dd AND do -> dq
NOT l -> m
1 AND gd -> ge
y AND ae -> ag
fo AND fz -> gb
NOT ie -> if
e AND f -> h
x RSHIFT 3 -> z
y OR ae -> af
hf AND hl -> hn
NOT h -> i
NOT hn -> ho
he RSHIFT 5 -> hh' splitOn: String cr.


]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> puzzleInputParsed [
	"parsed input goes here"
	^ self notYetImplemented 
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> puzzlePart1 [	
^ ' --- Day 7: Some Assembly Required ---
This year, Santa brought little Bobby Tables a set of wires and bitwise logic gates! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

Each wire has an identifier (some lowercase letters) and can carry a 16-bit signal (a number from 0 to 65535). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

The included instructions booklet describes how to connect the parts together: x AND y -> z means to connect wires x and y to an AND gate, and then connect its output to wire z.

For example:

123 -> x means that the signal 123 is provided to wire x.
x AND y -> z means that the bitwise AND of wire x and wire y is provided to wire z.
p LSHIFT 2 -> q means that the value from wire p is left-shifted by 2 and then provided to wire q.
NOT e -> f means that the bitwise complement of the value from wire e is provided to wire f.
Other possible gates include OR (bitwise OR) and RSHIFT (right-shift). If, for some reason, you''d like to emulate the circuit instead, almost all programming languages (for example, C, JavaScript, or Python) provide operators for these gates.

For example, here is a simple circuit:

123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
After it is run, these are the signals on the wires:

d: 72
e: 507
f: 492
g: 114
h: 65412
i: 65079
x: 123
y: 456
In little Bobby''s kit''s instructions booklet (provided as your puzzle input), what signal is ultimately provided to wire a?

'

]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> puzzlePart2 [	
^ ' --- Part Two ---
Now, take the signal you got on wire a, override wire b to that signal, and reset the other wires (including wire a). What new signal is ultimately provided to wire a?
'

]

{ #category : 'initialization' }
AOC2015Day7 >> reset [
 dict := Dictionary new.
 rules := OrderedCollection new.


]

{ #category : 'initialization' }
AOC2015Day7 >> rules [
^ rules 
 



]

{ #category : 'initialization' }
AOC2015Day7 >> runRules [
"run each rule "
 rules do: [ :rule | rule value ] .





]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> solution1Part1 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> solution1Part2 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day7 >> solve1: node [


]

{ #category : 'testing' }
AOC2015Day7 >> valueOf: s [
 "use only after isDetermined has been computed  "
 "either it is an integer - or a symbol whose value in dict is an integer"
^  s isInteger ifTrue:[ ^ s ] ifFalse: [ dict at: s ].
	


]
