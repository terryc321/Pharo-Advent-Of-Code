Class {
	#name : 'AOC2015Day22',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day22 >> initialState [
|state missileEffect drainEffect shieldEffect poisonEffect rechargeEffect effects|
state := Dictionary new.
state at: #myManaSpentLimit put: 1000. "maximum amount of mana can spend"
state at: #myManaSpent put: 0. "amount spent"
state at: #myMana put: 500. "start with"
state at: #myHits put: 50. "health"
state at: #myArmor put: 0. "no armor initially"
state at: #bossHits put: 55. "health"
state at: #bossDamage put: 8. "plain damage each turn"
"boss is essentially static in game"
missileEffect := self makeEffect: #(#missile 1 53 4 0 0 0 0).
drainEffect := self makeEffect: #(#drain 1 73 2 2 0 0 0).
shieldEffect := self makeEffect: #(#shield 6 113 0 0 7 0 0).
poisonEffect := self makeEffect: #(#poison 6 173 3 0 0 0 0).
rechargeEffect := self makeEffect: #(#recharge 5 229 0 0 0 101 0).
effects := { missileEffect . drainEffect . shieldEffect . poisonEffect. rechargeEffect }.
state at: #effects put: effects.
^ state

]

{ #category : 'accessing' }
AOC2015Day22 >> makeEffect: anArray [
|dict|
dict := Dictionary new.
dict at: #name put: (anArray at: 1).
dict at: #turnDuration put: (anArray at: 2).
dict at: #manaCost put: (anArray at: 3).
dict at: #damageEffect put: (anArray at: 4).
dict at: #healEffect put: (anArray at: 5).
dict at: #armorEffect put: (anArray at: 6).
dict at: #manaEffect put: (anArray at: 7).
dict at: #turnCount put: (anArray at: 8).
^ dict
]

{ #category : 'accessing' }
AOC2015Day22 >> nextState: aState [ 
|state2 state3 |
state2 := self playerMove: aState.
state3 := self bossMove: state2.
^ state3
]

{ #category : 'as yet unclassified' }
AOC2015Day22 >> playerMove: aState [
| s ef se | 
s := aState copy.
ef := s at: #effects.
" is player dead ? - we signal death"
(s at: #myMana) <= 0 ifTrue:[ ^ #playerDead ].
"apply effects and reduce any active effect turn time by one unit"
"missile and drain only last one turn so only affect boss - never cycle back on us"
"shield effect"
se := ef at: #shieldEffect.
se at: #turnCount > 0 ifTrue: [ "shield effect is active"

s at: #myArmor put: ((s at: #myArmor)+ (((s at: #effects) at: #shieldEffect) at: #armorEffect)).
(((s at: #effects) at: #shieldEffect) at: #turnCount put: ((((s at: #effects) at: #shieldEffect) at: #turnCount) - 1)).
].
"is boss dead? - we signal death"
(s at: #bossHits) <= 0 ifTrue: [ ^ #bossDead ].





]
