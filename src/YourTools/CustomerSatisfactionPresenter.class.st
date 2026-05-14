Class {
	#name : 'CustomerSatisfactionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'result'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'initialization' }
CustomerSatisfactionPresenter >> initializePresenters [

	result := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton
]
