
# Spec 2.0

first venture in graphical user interface

everything begins with SpPresenter class , first thing to do is subclass this . 
with instance variables to names of the components in the presentation .

make a new class CustomerSatisfactionPresenter that is a subclass of SpPresenter . 
placed it into my package YourTools . 
here we make more than what we require since makes experimenting a little easier

# Create the presenter class

```
SpPresenter << #CustomerSatisfactionPresenter
	slots: {
			 #buttonHappy .
			 #buttonNeutral .
			 #buttonBad .
			 #result .
			 #text .
			 #text2 .
			 #number .
			 #numberLabel .
			 #number2 .
			 #numberLabel2 .
			 #slider .
			 #slider2 .
			 #numberLabel3 .
			 #slider3 };
	package: 'YourTools'
```

## Create some components

Lets first create the actual objects required , we do this not by called new , but using self newXXXX 

Do not call new to instantiate a presenter that is part of your UI. An alterna-
tive way to instantiate presenters is to use the message instantiate: with a
presenter class as an argument. For example result := self instantiate:
SpLabelPresenter. This allows one to instantiate standard and non-standard
presenters.

```
CustomerSatisfactionPresenter >> initializePresenters
```

```
initializePresenters

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
```

## Specify a default layout

This is default if non is deliberately selected

```
CustomerSatisfactionPresenter >> defaultLayout
```

```
defaultLayout

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
```


## Window presenter

tell a window presenter how the thing should be on screen size perhaps


```
CustomerSatisfactionPresenter >> initializeWindow:
```

```
initializeWindow: aWindowPresenter

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Customer Satisfaction Survey';
		initialExtent: 700 @ 300
		
```	

## Put it on the screen then 

```
ui := CustomerSatisfactionPresenter new open.
" do some stuff "
" when finished call "
" ui close . "
```

## Change propagation 

```
CustomerSatisfactionPresenter >> connectPresenters
```

```
connectPresenters

	buttonHappy action: [ result label: buttonHappy label ].
	buttonNeutral action: [ result label: buttonNeutral label ].
	buttonBad action: [ result label: buttonBad label ]
```

## Recap 

SpPresenter will be doing layout to a certain extent, may be a lot of fussing to get what think should appear to 
actually come on screen .  Things expand where should not , but eventually something works.

at moment looked at label , even a bare string can be added in ``` add: 'me' ; ``` .
we have some sliders and when move one - the rest which represent same value also move - some may be infinite loop , 
have to see how the value propagates 

reminds me - see sussman ? from structure interpretation lisp book about new book on change propagation .














