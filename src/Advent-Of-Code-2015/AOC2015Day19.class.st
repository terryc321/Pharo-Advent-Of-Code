"
Part2  - need to make replacement in fewest possible moves

"
Class {
	#name : 'AOC2015Day19',
	#superclass : 'Object',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day19 >> exampleRules [
| rules |
rules := OrderedCollection new.
	rules
		add: {'H'.
				'HO'}.
	rules
		add: {'H'.
				'OH'}.
	rules
		add: {'O'.
				'HH'}.
^rules.				
]

{ #category : 'as yet unclassified' }
AOC2015Day19 >> part1 [
^ self replace: (self puzzleInput) with: (self puzzleRules)
]

{ #category : 'as yet unclassified' }
AOC2015Day19 >> puzzleInput [
^'CRnCaCaCaSiRnBPTiMgArSiRnSiRnMgArSiRnCaFArTiTiBSiThFYCaFArCaCaSiThCaPBSiThSiThCaCaPTiRnPBSiThRnFArArCaCaSiThCaSiThSiRnMgArCaPTiBPRnFArSiThCaSiRnFArBCaSiRnCaPRnFArPMgYCaFArCaPTiTiTiBPBSiThCaPTiBPBSiRnFArBPBSiRnCaFArBPRnSiRnFArRnSiRnBFArCaFArCaCaCaSiThSiThCaCaPBPTiTiRnFArCaPTiBSiAlArPBCaCaCaCaCaSiRnMgArCaSiThFArThCaSiThCaSiRnCaFYCaSiRnFYFArFArCaSiRnFYFArCaSiRnBPMgArSiThPRnFArCaSiRnFArTiRnSiRnFYFArCaSiRnBFArCaSiRnTiMgArSiThCaSiThCaFArPRnFArSiRnFArTiTiTiTiBCaCaSiRnCaCaFYFArSiThCaPTiBPTiBCaSiThSiRnMgArCaF'
]

{ #category : 'as yet unclassified' }
AOC2015Day19 >> puzzleRules [
^{{'Al'.'ThF'}.
{'Al'.'ThRnFAr'}.
{'B'.'BCa'}.
{'B'.'TiB'}.
{'B'.'TiRnFAr'}.
{'Ca'.'CaCa'}.
{'Ca'.'PB'}.
{'Ca'.'PRnFAr'}.
{'Ca'.'SiRnFYFAr'}.
{'Ca'.'SiRnMgAr'}.
{'Ca'.'SiTh'}.
{'F'.'CaF'}.
{'F'.'PMg'}.
{'F'.'SiAl'}.
{'H'.'CRnAlAr'}.
{'H'.'CRnFYFYFAr'}.
{'H'.'CRnFYMgAr'}.
{'H'.'CRnMgYFAr'}.
{'H'.'HCa'}.
{'H'.'NRnFYFAr'}.
{'H'.'NRnMgAr'}.
{'H'.'NTh'}.
{'H'.'OB'}.
{'H'.'ORnFAr'}.
{'Mg'.'BF'}.
{'Mg'.'TiMg'}.
{'N'.'CRnFAr'}.
{'N'.'HSi'}.
{'O'.'CRnFYFAr'}.
{'O'.'CRnMgAr'}.
{'O'.'HP'}.
{'O'.'NRnFAr'}.
{'O'.'OTi'}.
{'P'.'CaP'}.
{'P'.'PTi'}.
{'P'.'SiRnFAr'}.
{'Si'.'CaSi'}.
{'Th'.'ThCa'}.
{'Ti'.'BP'}.
{'Ti'.'TiTi'}.
{'e'.'HF'}.
{'e'.'NAl'}.
{'e'.'OMg'}}.


]

{ #category : 'accessing' }
AOC2015Day19 >> replace: aString [
	| s rules set |
	s := aString.
	set := Set new.
	rules := OrderedCollection new.
	rules
		add: {'H'.
				'HO'}.
	rules
		add: {'H'.
				'OH'}.
	rules
		add: {'O'.
				'HH'}.

	rules
		do: [ :rule | 
			| key val last |
			key := rule at: 1.
			val := rule at: 2.
			last := s findString: key startingAt: 1.
			[ last > 0 ]
				whileTrue: [ | before result after |
					before := s copyFrom: 1 to: last - 1.
					after := s copyFrom: last + key size to: s size.
					result := before , val , after.
					set add: result.
					result traceCr.
					last := s findString: key startingAt: last + 1 ] ].
	^ set
]

{ #category : 'accessing' }
AOC2015Day19 >> replace: aString with: rules [
	| s  set |
	s := aString.
	set := Set new.

	rules
		do: [ :rule | 
			| key val last |
			key := rule at: 1.
			val := rule at: 2.
			last := s findString: key startingAt: 1.
			[ last > 0 ]
				whileTrue: [ | before result after |
					before := s copyFrom: 1 to: last - 1.
					after := s copyFrom: last + key size to: s size.
					result := before , val , after.
					set add: result.
					result traceCr.
					last := s findString: key startingAt: last + 1 ] ].
	^ set
]
