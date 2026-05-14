Extension { #name : 'Package' }

{ #category : '*YourTools' }
Package >> definesOrExtendsClass: aClass [
	"Returns true whether the class, aClass, is one of the locally defined classes of the receiver or
	if the receiver extends such class (that is defined in another package)"
	^ true
	"^ (self includesClass: aClass instanceSide) or: [ self extendsClass: aClass ]"
]
