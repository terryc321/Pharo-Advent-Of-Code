Extension { #name : 'String' }

{ #category : '*AdventCode' }
String >> asSymbolOrInteger [ 
 "convert string to a symbol or integer as appropriate - "
"(self size) < 1 ??"
(self at: 1) isDigit ifTrue:[ ^ self asInteger ] ifFalse:[ ^ self asSymbol ].



]
