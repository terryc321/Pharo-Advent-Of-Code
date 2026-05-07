Class {
	#name : 'AOC2015Day19',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day19 >> replace: aString [
	| s last dict set |
	s := aString.
	set := Set new.
	dict := Dictionary new.
	dict at: 'H' put: 'HO'.
	dict at: 'H' put: 'OH'.
	dict at: 'O' put: 'HH'.

	dict
		keysAndValuesDo: [ :key :val | 
		 last := s findString: key startingAt: 1.
			[ last > 0 ]
				whileTrue: [ 
				| before result after |
					before := s copyFrom: 1 to: (last - 1).
					after := s copyFrom: (last + key size) to: (s size).
					result := before , val , after . 
					set add: result.
					result traceCr.
					last := s findString: key startingAt: last + 1 ] ].
^ set					
]
