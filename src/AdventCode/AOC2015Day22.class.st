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
state at: #myMana put: 500. 
state at: #myHits put: 50. "health"
state at: #bossHits put: 55. "health"
state at: #bossDamage put: 8. "plain damage each turn"
"boss is essentially static in game"
missileEffect := self makeEffect: #('magic missile' 1 53 4 0 0 0 0).
drainEffect := self makeEffect: #('drain' 1 73 2 2 0 0 0).
shieldEffect := self makeEffect: #('shield' 6 113 0 0 7 0 0).
poisonEffect := self makeEffect: #('poison' 6 173 3 0 0 0 0).
rechargeEffect := self makeEffect: #('recharge' 5 229 0 0 0 101 0).
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
