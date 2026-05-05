Class {
	#name : 'AOC2015Day13Person',
	#superclass : 'Object',
	#instVars : [
		'left',
		'right',
		'name'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day13Person >> initialize [



]

{ #category : 'accessing' }
AOC2015Day13Person >> left [ 
 ^ left 
]

{ #category : 'accessing' }
AOC2015Day13Person >> left: aPerson [ 
 left := aPerson.
]

{ #category : 'accessing' }
AOC2015Day13Person >> name [ 
 ^ name.
]

{ #category : 'accessing' }
AOC2015Day13Person >> right [ 
 ^ right 
]

{ #category : 'accessing' }
AOC2015Day13Person >> right: aPerson [ 
 right := aPerson.


]

{ #category : 'accessing' }
AOC2015Day13Person >> score [ 
^ { self scoreleft . self scoreright }
]

{ #category : 'accessing' }
AOC2015Day13Person >> scoreleft [ 
^ 0
]

{ #category : 'accessing' }
AOC2015Day13Person >> scoreright [ 
^ 0
]
