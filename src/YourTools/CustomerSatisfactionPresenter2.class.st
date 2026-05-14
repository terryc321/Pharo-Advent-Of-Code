"
a customer satisfaction survey
"
Class {
	#name : 'CustomerSatisfactionPresenter2',
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

{ #category : 'instance creation' }
CustomerSatisfactionPresenter2 class >> run [
<script>
^ CustomerSatisfactionPresenter new open




]

{ #category : 'initialization' }
CustomerSatisfactionPresenter2 >> connectPresenters [

	buttonHappy action: [ result label: buttonHappy label ].
	buttonNeutral action: [ result label: buttonNeutral label ].
	buttonBad action: [ result label: buttonBad label ]
]

{ #category : 'layout' }
CustomerSatisfactionPresenter2 >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: buttonHappy;
				   add: buttonNeutral;
				   add: buttonBad;
				   yourself);
		  add: result;
		  yourself
]

{ #category : 'examples' }
CustomerSatisfactionPresenter2 >> example [

^ self open 

"

since I am already the CustomerSatisfactionPresenter - i shall call myself to open myself  

	| ui |
	ui := CustomerSatisfactionPresenter new open
[ ... do a lot of stuff until the UI needs to be closed ...]
ui close
"


]

{ #category : 'initialization' }
CustomerSatisfactionPresenter2 >> initializePresenters [

	result := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton.
	result label: 'Please give us your feedback.'.

	"
self newButton is shorthand call to superclass SpPresenter which will call self instantiate: SpButtonPresenter
here can see do NOT call new - as in initialize - one example of broken smalltalk concept non uniform way to 
make components.
to quote the spec 2.0 2024 version pdf 
'Do not call new to instantiate a presenter that is part of your UI. An alterna-
tive way to instantiate presenters is to use the message instantiate: with a
presenter class as an argument. For example result := self instantiate:
SpLabelPresenter. This allows one to instantiate standard and non-standard
presenters.'

SpPresenter >> newButton
^ self instantiate: SpButtonPresenter
"
	buttonHappy
		label: 'Happy';
		icon: (self iconNamed: #thumbsUp).
	buttonNeutral
		label: 'Neutral';
		icon: (self iconNamed: #user).
	buttonBad
		label: 'Bad';
		icon: (self iconNamed: #thumbsDown)
		
	






















]

{ #category : 'initialization' }
CustomerSatisfactionPresenter2 >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent: 400 @ 100
]
