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
		'rechargeEffect'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day22State >> initialize [
myMana := 500. 
myHits := 50.
bossHits := 55.
bossDamage := 8.
missileEffect := #('magic missile' 1 53 4).
drainEffect := #('drain' 1 73 2 2).
shieldEffect := #('shield' 6 113 0 0 7 0 0).
poisonEffect := #('poison' 6 173 3 0 0 0 0).
rechargeEffect := #('recharge' 5 229 0 0 0 101 0).


]
