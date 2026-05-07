Class {
	#name : 'AOC2015Day19',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

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
