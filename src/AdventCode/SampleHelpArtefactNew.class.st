Class {
	#name : 'SampleHelpArtefactNew',
	#superclass : 'ClySyntaxHelpMorph',
	#category : 'AdventCode-Core',
	#package : 'AdventCode',
	#tag : 'Core'
}

{ #category : 'initialization' }
SampleHelpArtefactNew >> initialize [ 
 super initialize.


]

{ #category : 'as yet unclassified' }
SampleHelpArtefactNew >> syntax [ 
	"Return a text to be rendered by a morph, and produced by the MicRichTextComposer"
	"over-rides rawMicrodownSyntax entirely"
	| contents | 
	"m := Microdown new."
	contents := '/home/terry/code/smalltalk/Pharo-Advent-Of-Code/docs/Artefact.md' asFileReference 
                    	 readStreamDo: [ :stream | stream contents ].
	^ (MicRichTextComposer asRichText: contents).

"	^ (MicRichTextComposer asRichText: self rawMicrodownSyntax , String cr, String cr, 'Microdown''s in image version offers: header, paragraph, codeblock, lists, hyperlinks and many format (bold, monospace, italic, links, .... A larger version is available for books.', String cr) , ('-------------------------------------------' , '''Here is the corresponding text in Microdown.', String cr, String cr, self rawMicrodownSyntax, String cr) asText"
	
]
