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
 <script>
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
ClassCommentBrowser >> emptyMorph [
    ^ Morph new 
        color: Color veryLightGray;
        hResizing: #spaceFill;
        vResizing: #spaceFill;
        yourself.
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> errorMorph: anError [
    ^ (LabelMorph contents: 'Rendering error: ', anError description)
        color: Color red muchLighter;
        hResizing: #spaceFill;
        vResizing: #spaceFill;
        yourself.
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> howTo [ 

"
ClassCommentBrowser new open.

| morph text html |
text := 'Hello **World** from MicroDown!'.
html := Microdown new.
html render: (Microdown asRichText: text).
morph := RubPluggableTextMorph new.
morph contents: html.
morph openInWorld.
"

]

{ #category : 'initialization' }
ClassCommentBrowser >> initializePresenters [

    classList := self newList
      "filter by package"
      "select:[ :cls | cls name includesSubstring: 'NewTools' ]"
        items: ((Smalltalk allClasses ) asSortedCollection: [ :a :b |
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
        morph: (GeneralScrollPaneMorph new 
            scrollTarget: (Morph new color: Color white);
            yourself);
        yourself.

"
renderedComment := self newScrollPane
    presenter: (self newMorph
        morph: self emptyMorph;
        yourself);
    yourself.
"


"    renderedComment := self newMorph
        morph: (Morph new color: Color white; 
            layoutPolicy: TableLayout new;
            hResizing: #spaceFill;
            vResizing: #spaceFill;
            yourself).  
"
"We'll replace with rendered content"

]

{ #category : 'rendering' }
ClassCommentBrowser >> renderMicrodown: aString [ 
 |renderedText textMorph|
    aString ifEmpty: [ ^ self emptyMorph ].
        "^ (Morph new color: Color veryLightGray; yourself) ]."
    
renderedText := [ BeautifulComments render: aString ]
        on: Error
        do: [ :ex | 'Rendering error: ', ex description asText allBold ].

    textMorph := renderedText asMorph.
    
    "=== KEY SETTINGS FOR WORD WRAPPING ==="
    textMorph
        wrapFlag: true;           "This enables word wrapping"
        autoFit: false;           "Important: do NOT auto-fit, let the container control width"
        hResizing: #rigid ; "#spaceFill;"
        vResizing: #shrinkWrap; "paceFill;"
        color: Color white;       "  margins: (Margin width: 12 height: 10); "
        yourself.

    ^ textMorph .

"
    ^ (BeautifulComments renderComment: aString of: selectedClass)
      asMorph
        color: Color white;
        hResizing: #spaceFill;
        vResizing: #spaceFill;
        yourself.
"

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
  | textMorph scrollPane visibleWidth |
    selectedClass ifNil: [ ^ self ].
    
    [ 
        textMorph := self renderMicrodown: sourceComment text.
        
        scrollPane := renderedComment morph.
        "Force the text to wrap to the current visible width of the scroll pane"
        visibleWidth := scrollPane innerBounds width - 30.  "subtract some margin"
        visibleWidth > 0 ifTrue: [
            textMorph width: visibleWidth.
        ].

        scrollPane scrollTarget: textMorph.
        
        "Force layout update"
        scrollPane hResizing: #spaceFill;
                   vResizing: #spaceFill.
    ] on: Error do: [ :ex |
        scrollPane := renderedComment morph.
        scrollPane scrollTarget: (self errorMorph: ex).
    ].
]

{ #category : 'as yet unclassified' }
ClassCommentBrowser >> updateRenderedCommentDebounced [
    "Simple debounce - 3 seconds "
    (self class environment at: #Delay) forMilliseconds: 3000 do: [
        self updateRenderedComment
    ].


]
