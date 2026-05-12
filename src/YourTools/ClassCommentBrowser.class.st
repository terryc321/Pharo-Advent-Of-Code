Class {
	#name : 'ClassCommentBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'classList',
		'sourceComment',
		'renderedComment',
		'selectedClass'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'instance creation' }
ClassCommentBrowser class >> open [
    ^ self new open
]

{ #category : 'initialization' }
ClassCommentBrowser >> defaultSpec [
    ^ SpPanedLayout newLeftToRight
        add: classList;
        add: (SpPanedLayout newTopToBottom
            add: sourceComment;
            add: renderedComment;
            yourself);
        yourself
]

{ #category : 'initialization' }
ClassCommentBrowser >> initializePresenters [

    classList := self newList
        items: Smalltalk allClasses sorted;  "or use a TreePresenter for hierarchy"
        display: [ :cls | cls name ];
        displayIcon: [ :cls | self iconNamed: #class ];
        whenSelectedDo: [ :cls | self selectClass: cls ].

    sourceComment := self newText
        beForObject: nil;  "will set later"
        whenTextChangedDo: [ :text | self updateRenderedCommentDebounced ].

    renderedComment := self newMorph
        morph: (Morph new color: Color white; yourself).  "We'll replace with rendered content"

]

{ #category : 'navigation' }
ClassCommentBrowser >> selectClass: aClass [
    selectedClass := aClass.
    aClass ifNil: [ ^ self clear ].
    
    sourceComment text: (aClass comment ifNil: [ '' ]).
    self updateRenderedComment.
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> updateRenderedComment [
    | microdownMorph |
    selectedClass ifNil: [ ^ self ].
    
    "microdownMorph := Microdown asRichTextMorph: selectedClass comment.  ***or better API"
    
    "BeautifulComments may provide nicer rendering"
    "Alternative:"
    "microdownMorph := (MicroDownParser parse: selectedClass comment) asPillar asMorph."
    
    renderedComment morph: (microdownMorph
        color: Color white;
        yourself).
]
