Class {
	#name : 'AOCMorphDemo',
	#superclass : 'BorderedMorph',
	#instVars : [
		'input',
		'button'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOCMorphDemo >> initialize [

	super initialize.
	input := TextMorph new.
	input contents: 'here is some contents to do something with'.
	button := SimpleButtonMorph new
		          target: self;
		          actionSelector: #processTextMorph:;
		          arguments: { input };
		          yourself.
	self addMorph: input.
	self addMorph: button.
	
]

{ #category : 'initialization' }
AOCMorphDemo >> processTextMorph: aTextMorph [

	| contents |
	contents := aTextMorph text.
	"do something with contents"
	contents traceCr.
	input backgroundColor: Color black.
	input textColor: Color white.
	self color: Color orange.
	
]
