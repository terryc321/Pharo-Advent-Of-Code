Class {
	#name : 'AOC2015Day22State',
	#superclass : 'Object',
	#instVars : [
		'myManaSpent',
		'myMana',
		'myHits',
		'myArmor',
		'bossHits',
		'bossDamage',
		'missileEffect',
		'drainEffect',
		'shieldEffect',
		'poisonEffect',
		'rechargeEffect',
		'missileCount',
		'drainCount',
		'shieldCount',
		'poisonCount',
		'rechargeCount',
		'spells'
	],
	#classInstVars : [
		'best'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day22State class >> best [
 ^ best


]

{ #category : 'accessing' }
AOC2015Day22State class >> best: n [ 
 best := n .

]

{ #category : 'accessing' }
AOC2015Day22State class >> initialize [ 
"something absurdly large"
 best := 999999999999999.




]

{ #category : 'accessing' }
AOC2015Day22State >> bossHits [
	^ bossHits
]

{ #category : 'accessing' }
AOC2015Day22State >> bossHits: anObject [
	bossHits := anObject
]

{ #category : 'movement' }
AOC2015Day22State >> bossMove [
"effects"
| s|
s := self deepCopy.
(s missileCount > 0) ifTrue: [ s bossHits: (s bossHits - 4) . s missileCount: (s missileCount - 1 max: 0) ].
(s drainCount > 0) ifTrue: [ s bossHits: (s bossHits - 2) . s myHits: (s myHits + 2) . 
                           s drainCount: (s drainCount - 1 max: 0) ].
(s shieldCount > 0) ifTrue: [ s myArmor: (s myArmor + 7). s shieldCount: (s shieldCount - 1 max: 0) ].
(s poisonCount > 0) ifTrue: [ s bossHits: (s bossHits - 3) . s poisonCount: (s poisonCount - 1 max: 0) ].
(s rechargeCount > 0) ifTrue: [ s myMana:  (s myMana + 101) . s rechargeCount: (s rechargeCount - 1 max: 0)].

(s bossHits <= 0) ifTrue:[ 	
	Transcript show: { 'PLAYER Wins !! mana spent => ' . (s myManaSpent) } ; cr .
	((s myManaSpent) < (s class best)) ifTrue: [ s class best: (s myManaSpent) ] .	
	^ #bossDead ].
"boss deals 8 damage usually , atleast 1 damage"
s myHits: (s myHits - ((8 - (s myArmor)) min: 1)). 
(s myMana <= 0) ifTrue:[ ^ #playerDead ].
s playerMove.

]

{ #category : 'accessing' }
AOC2015Day22State >> drainCount [
	^ drainCount
]

{ #category : 'accessing' }
AOC2015Day22State >> drainCount: anObject [
	drainCount := anObject
]

{ #category : 'initialization' }
AOC2015Day22State >> initialize [
self class best ifNil:[ self class initialize ].
myMana := 500. 
myManaSpent := 0.
myHits := 50.
myArmor := 0.
bossHits := 55.
bossDamage := 8.
missileCount := 0.
drainCount := 0.
shieldCount := 0.
poisonCount := 0.
rechargeCount := 0.


]

{ #category : 'accessing' }
AOC2015Day22State >> missileCount [
	^ missileCount
]

{ #category : 'accessing' }
AOC2015Day22State >> missileCount: anObject [
	missileCount := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> myArmor [
	^ myArmor
]

{ #category : 'accessing' }
AOC2015Day22State >> myArmor: anObject [
	myArmor := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> myHits [
	^ myHits
]

{ #category : 'accessing' }
AOC2015Day22State >> myHits: anObject [
	myHits := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> myMana [
	^ myMana
]

{ #category : 'accessing' }
AOC2015Day22State >> myMana: anObject [
	myMana := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> myManaSpent [
	^ myManaSpent
]

{ #category : 'accessing' }
AOC2015Day22State >> myManaSpent: anObject [
	myManaSpent := anObject
]

{ #category : 'movement' }
AOC2015Day22State >> playerMove [
"copy state before we call this - we always trash state"
|  s |

s := self deepCopy.
"myManaSpendLimit"
((s myManaSpent) > (s class best)) ifTrue: [ ^ #overspend ].
((s myManaSpent) > (s class best)) ifTrue: [ ^ #overspend ] .	

(s myMana <= 0) ifTrue:[ ^ #playerDead ].

"effects"
(s missileCount > 0) ifTrue: [ s bossHits: (s bossHits - 4). 
                               s missileCount: (s missileCount - 1 max: 0) ].
                               
(s drainCount > 0) ifTrue: [ s bossHits: (s bossHits - 2). 
                             s myHits: (s myHits + 2) . 
                             s drainCount: (s drainCount - 1 max: 0) ].
                             
(s shieldCount > 0) ifTrue: [ s myArmor: (s myArmor + 7).   
                              s shieldCount: (s shieldCount - 1 max: 0) ].
                              
(s poisonCount > 0) ifTrue: [ s bossHits: (s bossHits - 3) .   
                             s poisonCount: (s poisonCount - 1 max: 0) ].
                               
(s rechargeCount > 0) ifTrue: [ s myMana:  (s myMana + 101) . 
	                            s rechargeCount: (s rechargeCount - 1 max: 0)].

                                
"check if boss dead"
(s bossHits <= 0) ifTrue:[ 
	Transcript show: { 'PLAYER Wins !! mana spent => ' . (s myManaSpent) } ; cr .
	((s myManaSpent) < (s class best)) ifTrue: [ s class best: (s myManaSpent) ] .	
	^ #bossDead ].

"decide on effect to cast based on amount mana player has"
s spells: OrderedCollection new.
((s myMana >= 53) & (s missileCount = 0)) ifTrue: [ s spells add: #missile ].
((s myMana >= 73) & (s drainCount = 0)) ifTrue: [ s spells add: #drain ].
((s myMana >= 113) & (s shieldCount = 0)) ifTrue: [ s spells add: #shield ].
((s myMana >= 173) & (s poisonCount = 0)) ifTrue: [ s spells add: #poison ].
((s myMana >= 229) & (s rechargeCount = 0)) ifTrue: [ s spells add: #recharge ].
"no spells can be cast - player dies"
(s spells size = 0) ifTrue:[ ^ #playerDead ].

s spells do: [:spell |
 (spell = #missile) 
 ifTrue: [ | t | t:= s deepCopy .  t myMana: (t myMana - 53) . t myManaSpent: (t myManaSpent + 53) . t missileCount: 1 . t bossMove  ].
 
 (spell = #drain) 
 ifTrue: [ | t | t:= s deepCopy . t myMana: (t myMana - 73) .  t myManaSpent: (t myManaSpent + 73) . t drainCount: 1 . t bossMove ].
 
 (spell = #shield) 
 ifTrue: [ | t | t:= s deepCopy . t myMana: (t myMana - 113) . t myManaSpent: (t myManaSpent + 113) . t shieldCount: 6 . t bossMove ].
 
 (spell = #poison) 
 ifTrue: [ | t | t:= s deepCopy . t myMana: (t myMana - 173) . t myManaSpent: (t myManaSpent + 173) . t poisonCount: 6 . t bossMove ].
 
 (spell = #recharge) 
 ifTrue: [ | t | t:= s deepCopy . t myMana: (t myMana - 229) . t myManaSpent: (t myManaSpent + 229) . t rechargeCount: 5 . t bossMove ].
 
]











]

{ #category : 'accessing' }
AOC2015Day22State >> poisonCount [
	^ poisonCount
]

{ #category : 'accessing' }
AOC2015Day22State >> poisonCount: anObject [
	poisonCount := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> rechargeCount [
	^ rechargeCount
]

{ #category : 'accessing' }
AOC2015Day22State >> rechargeCount: anObject [
	^ rechargeCount := anObject
]

{ #category : 'running' }
AOC2015Day22State >> run [
	Transcript show: 'RUN has started .' ; cr .
	self playerMove.
	Transcript show: 'RUN has completed .' ; cr .
	Transcript show: 'RUN best =>' ; show:(self class best) ; cr .
	
	

]

{ #category : 'accessing' }
AOC2015Day22State >> shieldCount [
	^ shieldCount
]

{ #category : 'accessing' }
AOC2015Day22State >> shieldCount: anObject [
	shieldCount := anObject
]

{ #category : 'accessing' }
AOC2015Day22State >> spells [
	^ spells
]

{ #category : 'accessing' }
AOC2015Day22State >> spells: anObject [
	spells := anObject
]
