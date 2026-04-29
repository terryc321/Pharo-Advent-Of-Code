Class {
	#name : 'AOC2015Day22State',
	#superclass : 'Object',
	#instVars : [
		'myManaSpendLimit',
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
		'rechargeCount'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day22State >> bossMove [
"effects"
(missileCount > 0) ifTrue: [ bossHits := bossHits - 4. missileCount := missileCount - 1 max: 0 ].
(drainCount > 0) ifTrue: [ bossHits := bossHits - 2. myHits := myHits + 2 . 
                           drainCount := drainCount - 1 max: 0 ].
(shieldCount > 0) ifTrue: [ myArmor := 7. shieldCount := shieldCount - 1 max: 0 ].
(poisonCount > 0) ifTrue: [ bossHits := bossHits - 3 . poisonCount := poisonCount - 1 max: 0 ].
(rechargeCount > 0) ifTrue: [ bossHits := bossHits - 3 . poisonCount := poisonCount - 1 max: 0].

(bossHits <= 0) ifTrue:[ ^ #bossDead ].
"boss deals 8 damage usually , atleast 1 damage"
myHits := myHits - ((8 - myArmor) min: 1) . 



]

{ #category : 'initialization' }
AOC2015Day22State >> initialize [
myMana := 500. 
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

{ #category : 'as yet unclassified' }
AOC2015Day22State >> playerMove [
"copy state before we call this - we always trash state"
| spells |
(myMana <= 0) ifTrue:[ ^ #playerDead ].
"effects"
(missileCount > 0) ifTrue: [ bossHits := bossHits - 4. missileCount := missileCount - 1 max: 0 ].
(drainCount > 0) ifTrue: [ bossHits := bossHits - 2. myHits := myHits + 2 . 
                           drainCount := drainCount - 1 max: 0 ].
(shieldCount > 0) ifTrue: [ myArmor := 7. shieldCount := shieldCount - 1 max: 0 ].
(poisonCount > 0) ifTrue: [ bossHits := bossHits - 3 . poisonCount := poisonCount - 1 max: 0 ].
(rechargeCount > 0) ifTrue: [ bossHits := bossHits - 3 . poisonCount := poisonCount - 1 max: 0].
"decide on effect to cast based on amount mana player has"
spells := OrderedCollection new.
((myMana >= 53) & (missileCount = 0)) ifTrue: [ spells add: #missile ].
((myMana >= 73) & (drainCount = 0)) ifTrue: [ spells add: #drain ].
((myMana >= 113) & (shieldCount = 0)) ifTrue: [ spells add: #shield ].
((myMana >= 173) & (poisonCount = 0)) ifTrue: [ spells add: #poison ].
((myMana >= 229) & (rechargeCount = 0)) ifTrue: [ spells add: #recharge ].
"no spells can be cast - player dies"
(spells size = 0) ifTrue:[ ^ #playerDead ].

spells do: [:spell |
 (spell = #missile) ifTrue: [ myMana := myMana - 53 . missileCount := 1 ].
 (spell = #drain) ifTrue: [ myMana := myMana - 73 .  drainCount := 1 ].
 (spell = #shield) ifTrue: [ myMana := myMana - 113 . shieldCount := 6 ].
 (spell = #poison) ifTrue: [ myMana := myMana - 173 . poisonCount := 6 ].
 (spell = #recharge) ifTrue: [ myMana := myMana - 229 . rechargeCount := 5 ].
]

]
