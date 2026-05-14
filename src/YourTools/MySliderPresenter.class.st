"
Key methods for SpSliderPresenter

MethodPurposeExamplemin:Minimum valuemin: 1max:Maximum valuemax: 100quantum:Step increment (snap to grid)quantum: 1value:Set current valuevalue: 50valueGet current value-whenValueChangedDo:Callback when slider moves-addMark:at:Add labeled marks (optional)addMark: '50' at: 50
Extra options
smalltalkslider
    beHorizontal;        ""or beVertical""
    color: Color blue;   ""Knob/track color if supported""
    addMark: 'Low' at: 1;
    addMark: 'High' at: 100.
Tip: You can also use self newSlider inside any SpPresenter subclass (in the initializePresenters method).
Would you like a version with two sliders (min/max), a range slider, or integration with a model/object?
"
Class {
	#name : 'MySliderPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'slider',
		'valueLabel',
		'plusButton',
		'minusButton',
		'numberInput'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'instance creation' }
MySliderPresenter class >> open [
 <script>
    ^ self new open .
 "how set title?"	
]

{ #category : 'as yet unclassified' }
MySliderPresenter >> decreaseValue [
    | newVal |
    newVal := (slider value - 1) max: 1.
    self updateAll: newVal.

]

{ #category : 'layout' }
MySliderPresenter >> defaultLayout [
| plusMinus widgetRow sliderRow |

 "height only active in vertical"
    plusMinus :=  SpBoxLayout newLeftToRight
        add: minusButton withConstraints: [ :c | c height: 60 ]  ;        
        add: plusButton withConstraints: [ :c | c height: 60 ]  ;        
        yourself.
   
 "width only active in horizontal"
    sliderRow := SpBoxLayout newLeftToRight
        add: slider withConstraints: [ :c | c width: 400 ]  ; 
        add: plusMinus withConstraints: [ :c | c width: 50 ]  ;        
        yourself.


    widgetRow :=  SpBoxLayout newTopToBottom
        add: sliderRow withConstraints: [ :c | c height: 120 ]  ; 
        add: numberInput withConstraints: [ :c | c height: 120 ]  ; 
	      add: valueLabel withConstraints: [ :c | c height: 120 ]  ; 
        yourself.

 "should return some form of SpXXXLayout i guess "
   ^ widgetRow . 



"
    numberRow := SpBoxLayout newLeftToRight        
        yourself.


	 buttonRow := SpBoxLayout newLeftToRight
        add: sliderRow withConstraints: [:c | c width: 200 . c height: 50. ];
	      add: plusMinus ;
        yourself.


 ^ widgetRow .
          

    ^ SpBoxLayout newTopToBottom
        add: plusButton expand: false;
        add: slider;
        add: minusButton expand: false;
        yourself.

    ^ SpBoxLayout newLeftToRight
        add: minusButton expand: false;
        add: slider;
        add: plusButton expand: false;
        yourself.

    ^ SpBoxLayout newTopToBottom
        add: slider;
        add: valueLabel expand: false;
        yourself

^ SpBoxLayout newTopToBottom
    add: headerPanel;                    ""some other presenter""
    add: (SpBoxLayout newLeftToRight
        add: leftPanel;
        add: mainSliderArea;
        add: rightPanel;
        yourself)
    withConstraints: [:c | c padding: 10];
    yourself
"
]

{ #category : 'as yet unclassified' }
MySliderPresenter >> increaseValue [
    | newVal |
    newVal := (slider value + 1) min: 100.
    self updateAll: newVal.
]

{ #category : 'initialization' }
MySliderPresenter >> initializePresenters [

	super initializePresenters.
	slider := self newSlider.
	valueLabel := self newLabel.
	minusButton := self newButton.
	plusButton := self newButton.
	numberInput := self newNumberInput. "Best for numbers"

	minusButton
		label: '−';
		icon: (self iconNamed: #smallLeftIcon);
		action: [ self decreaseValue ].

	plusButton
		label: '+';
		icon: (self iconNamed: #smallRightIcon);
		action: [ self increaseValue ].

	slider  "beHorizontal ; 	beVertical;  make no difference"	  
		min: 1;
		max: 100;
		quantum: 1;
		addMark: '50' at: 50;
		value: 50. "Configure number input"
		
	numberInput
		minimum: 1;
		maximum: 100;
		numberType: Integer;
		number: 50;
		whenNumberChangedDo: [ :num | self updateFromInput: num ].


	valueLabel label: 'Value: 50'.

	slider whenValueChangedDo: [ :val | self updateAll: val ]
]

{ #category : 'as yet unclassified' }
MySliderPresenter >> initializeWindow: aWindowPresenter [
    aWindowPresenter 
        title: 'Slider Control';
        initialExtent: 650 @ 200;
        centered.



]

{ #category : 'as yet unclassified' }
MySliderPresenter >> updateAll: aNumber [
    slider value: aNumber.
    numberInput number: aNumber.
    valueLabel label: 'Value: ', aNumber printString.
]

{ #category : 'as yet unclassified' }
MySliderPresenter >> updateFromInput: aNumber [
    "Called when user types in the number field"
    | clamped |
    clamped := (aNumber max: 1) min: 100 . 
    slider value: clamped.
    valueLabel label: 'Value: ', clamped printString.
]

{ #category : 'updating' }
MySliderPresenter >> updateLabel [
    valueLabel label: 'Value: ', slider value printString.
]
