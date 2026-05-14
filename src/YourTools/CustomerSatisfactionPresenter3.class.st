"
can we get sliders to work vertically now 


"
Class {
	#name : 'CustomerSatisfactionPresenter3',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttonHappy',
		'buttonNeutral',
		'buttonBad',
		'result',
		'text',
		'text2',
		'number',
		'numberLabel',
		'number2',
		'numberLabel2',
		'slider',
		'slider2',
		'numberLabel3',
		'slider3'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'instance creation' }
CustomerSatisfactionPresenter3 class >> run [
<script>
^ self new open







]

{ #category : 'initialization' }
CustomerSatisfactionPresenter3 >> connectPresenters [

	buttonHappy action: [ result label: buttonHappy label ].
	buttonNeutral action: [ result label: buttonNeutral label ].
	buttonBad action: [ result label: buttonBad label ]
]

{ #category : 'layout' }
CustomerSatisfactionPresenter3 >> defaultLayout [


	| buttons buttons2 textentry textentry2 numSlider1 numSlider2 numSlider3 |
	buttons := SpBoxLayout newLeftToRight
		           add: buttonHappy;
		           add: buttonNeutral;
		           add: buttonBad;
		           yourself.
		
	buttons2 := (SpBoxLayout newTopToBottom 
		           add: buttons;
		           add: result;
		           yourself).

	textentry := SpGridLayout build: [ :builder | "do not return yourself with a builder"
			             builder
				             beColumnNotHomogeneous ;
				             column: 2 expand: true;				             
				             add: 'Director';  add: number;     nextRow;
				             add: 'Year';      add: number2 ;   nextRow;  	
					          add: 'slider' ;   add: slider ;    nextRow;
					          add: 'slider2' ;  add: slider2 ;   nextRow;
								 add: 'slider3' ;  add: slider3 ;   nextRow;
					          add: 'text' ;   add: text ;    nextRow;
					          add: 'text2' ;  add: text2 ;   nextRow ; 
					          add: 'buttons' ;  add: buttons ; nextRow ;
					          add: '    ' ; add: result ; nextRow    
				             ].
   numSlider1 := (SpBoxLayout newTopToBottom 
		           add: numberLabel expand: false;
		           add: slider;
		           yourself).
	 numSlider2 := (SpBoxLayout newTopToBottom 
		           add: numberLabel2 expand: false;
		           add: slider2;
		           yourself).
	numSlider3 := (SpBoxLayout newTopToBottom 
		           add: numberLabel3 expand: false;
		           add: slider3;
		           yourself).
								
			
			
   ^(SpBoxLayout newLeftToRight                
		           add: numSlider1  withConstraints: [: c | c width: 20 ];
		           add: numSlider2  withConstraints: [: c | c width: 20 ];
		           add: numSlider3  withConstraints: [: c | c width: 20 ];
					  add: textentry;
		           yourself).
					
			
   ^(SpBoxLayout newTopToBottom 
		           add: textentry expand: true;
		           add: buttons2 expand: false;
		           yourself).
		

			
 ^ textentry .
			
			
   textentry2 := (SpGridLayout new
				   add: 'Name' atPoint: 1 @ 1;
				   add: number atPoint: 2 @ 1;
				   add: 'Director' atPoint: 1 @ 2;
				   add: number2 atPoint: 2 @ 2;
				   yourself).

 ^ SpBoxLayout newTopToBottom 
		           add: textentry;
		           add: buttons;
		           add: result;
		           yourself.

^ textentry.

  ^ SpGridLayout build: [ :builder | "do not return yourself with a builder"
			             builder
				             "beColumnNotHomogeneous;"
				             beRowNotHomogeneous ;
				             row: 2 expand: true;
				             add: buttons ; nextRow ;
				             add: textentry2 ; nextRow ; 
				             add: result ; nextRow ;
				             add: 'Name';
				             add: 'something else' ].

]

{ #category : 'examples' }
CustomerSatisfactionPresenter3 >> example [

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
CustomerSatisfactionPresenter3 >> initializePresenters [

	result := self newLabel.
	buttonHappy := self newButton.
	buttonNeutral := self newButton.
	buttonBad := self newButton.
	result label: 'Please give us your feedback.'.
	number := self newNumberInput .
	number2 := self newNumberInput .
	numberLabel := self newLabel.
	numberLabel2 := self newLabel .
	numberLabel3 := self newLabel .
	
	slider := self newSlider.
	slider2 := self newSlider.
	slider3 := self newSlider .
	
	text := self newTextInput .
	text2 := self newTextInput .
	

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
		icon: (self iconNamed: #thumbsDown).
	numberLabel label: 'num1' .
	numberLabel2 label: 'num2' .
	numberLabel3 label: 'num3' .





















]

{ #category : 'initialization' }
CustomerSatisfactionPresenter3 >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent: 700 @ 300
		
	
]
