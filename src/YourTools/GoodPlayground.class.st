Class {
	#name : 'GoodPlayground',
	#superclass : 'Object',
	#instVars : [
		'play',
		'button'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'initialization' }
GoodPlayground >> initialize [

 "lets create a simple playground with some initial content"
	play := StPlayground openContents: self playgroundContents. 

	"lets create a simple button to do something useful "
	button := SimpleButtonMorph new
		          label: 'Run Code';
		          target: self;
		          actionSelector: #processInput:;
		          arguments: { play };
		          color: Color black;
		          yourself. 
	"Add button to world or another morph"
	button openInWorld.
]

{ #category : 'as yet unclassified' }
GoodPlayground >> playgroundContents [ 
^ '''Hello'' reverse.'

]

{ #category : 'as yet unclassified' }
GoodPlayground >> processInput: aSpWindowPresenter [
aSpWindowPresenter window sendToBack.





]
