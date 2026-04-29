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
AOC2015Day22State >> initialize [
myMana := 500. 
myHits := 50.
myArmor := 0.
bossHits := 55.
bossDamage := 8.
missileCount := 0.
missileEffect := #('magic missile' 1 53 4).
"missile lasts one "
drainCount := 0.
drainEffect := #('drain' 1 73 2 2).
shieldCount := 0.
shieldEffect := #('shield' 6 113 0 0 7 0 0).
poisonCount := 0.
poisonEffect := #('poison' 6 173 3 0 0 0 0).
rechargeCount := 0.
rechargeEffect := #('recharge' 5 229 0 0 0 101 0).


]
