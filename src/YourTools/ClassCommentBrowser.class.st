Class {
	#name : 'ClassCommentBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'classList',
		'sourceComment',
		'renderedComment',
		'selectedClass',
		'debounceProcess'
	],
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'instance creation' }
ClassCommentBrowser class >> open [
    ^ self new open .
 "how set title?"	
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> clearRendered [
    renderedComment morph: (Morph new color: Color veryLightGray).
]

{ #category : 'initialization' }
ClassCommentBrowser >> defaultLayout [
    ^ SpPanedLayout newLeftToRight
        add: classList;
        add: (SpPanedLayout newTopToBottom
            add: sourceComment;
            add: renderedComment;
            yourself);
        yourself
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> errorMorph: anError [
    ^ (LabelMorph contents: 'Render error: ', anError description)
        color: Color red muchLighter;
        yourself.
]

{ #category : 'initialization' }
ClassCommentBrowser >> initializePresenters [

    classList := self newList
        items: (Smalltalk allClasses asSortedCollection: [ :a :b |
		a className < b className ]) ;  "or use a TreePresenter for hierarchy"
        display: [ :cls | cls name ];
        displayIcon: [ :cls | self iconNamed: #class ];
        whenSelectedDo: [ :cls | self selectClass: cls ].

    sourceComment := self newText
        placeholder: 'Class comment (Microdown)';  "beForObject: nil;  will set later"
        whenTextChangedDo: [ :text | 
	            "self updateRenderedCommentDebounced."
	            self scheduleRenderUpdate.
	            ].

    renderedComment := self newMorph
        morph: (Morph new color: Color white; 
            layoutPolicy: TableLayout new;
            hResizing: #spaceFill;
            vResizing: #spaceFill;
            yourself).  "We'll replace with rendered content"

]

{ #category : 'rendering' }
ClassCommentBrowser >> renderMicrodown: aString [
    | doc |
    aString ifEmpty: [ 
        ^ (Morph new color: Color veryLightGray; yourself) ].
    
    doc := Microdown parse: aString.
    ^ doc asMorph
        color: Color white;
        hResizing: #spaceFill;
        vResizing: #spaceFill;
        yourself.
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> scheduleRenderUpdate [
    "Simple debounce - avoid rendering on every keystroke"
    debounceProcess ifNotNil: [ debounceProcess terminate ].
    
    debounceProcess := [
        300 milliSeconds wait.
        self updateRenderedComment
    ] forkAt: Processor userBackgroundPriority named: 'your-tools-class-comment-browser'.
]

{ #category : 'navigation' }
ClassCommentBrowser >> selectClass: aClass [
    selectedClass := aClass.
    aClass ifNil: [ sourceComment text: ''.
        "self clearRendered."
        self clear.
        ^ self.
	 "^ self clear" ].
    
    sourceComment text: (aClass comment ifNil: [ '' ]).
    self updateRenderedComment.
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> updateRenderedComment [
    | morph |
    selectedClass ifNil: [ ^ self ].
   [ morph := self renderMicrodown: sourceComment text.
        renderedComment morph: morph
    ] on: Error do: [ :ex |
        renderedComment morph: (self errorMorph: ex)
    ].


    "microdownMorph := Microdown asRichTextMorph: selectedClass comment. "
      " ***or better API"
    
    "BeautifulComments may provide nicer rendering"
    "Alternative:"
    "microdownMorph := (MicroDownParser parse: selectedClass comment) asPillar asMorph."
    
"    renderedComment morph: (microdownMorph
        color: Color white;
        yourself).
"
	"if it works"
"	renderedComment morph: (selectedClass asHelpTopic asMorph).  "

]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> updateRenderedCommentDebounced [
    "Simple debounce - 3 seconds "
    (self class environment at: #Delay) forMilliseconds: 3000 do: [
        self updateRenderedComment
    ].


]
