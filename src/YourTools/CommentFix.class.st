"
fixup old pillar comments to microdown format by any means necessary

 ideally we would have proper regular expressions 
RxParser regular expression cannot utilize non greedy matching  [[[(.*?)]]]  
imagine parser is strictly more powerful than regular expression since it can handle context 
either we have a full parser like petitparser2 or hack it 
identify [ [ [  replace with ``` 
identfiy ]]]  replace with ``` 
identify ! replace with # 
identify !! replace with ## 
identify !!! replace with ### 
identify !!!! replace with #### 
identify *class:YourClass* with `YourClass`			

"
Class {
	#name : 'CommentFix',
	#superclass : 'Object',
	#category : 'YourTools',
	#package : 'YourTools'
}

{ #category : 'examples' }
CommentFix class >> exampleBorg [

	<inspect>
	| packages classes classAndComment targetClassAndComment resultClassAndComment regex |
	packages := Smalltalk image packages select: [ :p | p name beginsWith: 'NewTools-CodeCritiques' ].
	packages := Smalltalk image packages select: [ :p | p name beginsWith: 'NewTools' ].

	classes := Smalltalk image packages flatCollect: [ :p | p classes ]. "we want to know what class the comment came from - because we want to change the class comments "
	classAndComment := classes collect: [ :c |
			                   {
				                   c.
				                   c comment } ]. "find any with triple square bracket " "	targetClassAndComment := classes select: [ :c | c comment includesSubstring: '[[[' ]."
	targetClassAndComment := classes select: [ :c | (c comment includesSubstring: 'class:')
                                       		 or: [ (c comment includesSubstring: '[[[') ]].
	resultClassAndComment := targetClassAndComment collect: [ :c |
			                         | result result2 result3 result4 result5 result6 result7 result8 |
			                         result := '\[\[\[' asRegex copy: c comment translatingMatchesUsing: [ :m | '```' ].
			                         result2 := '\]\]\]' asRegex copy: result translatingMatchesUsing: [ :m | '```' ]. "*class:blah-blah*" "match longer regexs first "
			                         regex := '[*]class\:([^*)]+)[*]' asRegex.
			                         result3 := regex copy: result2 translatingMatchesUsing: [ :m | '`' , (regex subexpression: 2) , '`' ].
			                         regex := 'class\:([^*)]+)' asRegex.
			                         result4 := regex copy: result3 translatingMatchesUsing: [ :m | '`' , (regex subexpression: 2) , '`' ].
			                         regex := '\b!!!!' asRegex.
			                         result5 := regex copy: result4 translatingMatchesUsing: [ :m | '####' ].
			                         regex := '\b!!!' asRegex.
			                         result6 := regex copy: result5 translatingMatchesUsing: [ :m | '###' ].
			                         regex := '\b!!' asRegex.
			                         result7 := regex copy: result6 translatingMatchesUsing: [ :m | '##' ].
			                         regex := '\b!' asRegex.
			                         result8 := regex copy: result7 translatingMatchesUsing: [ :m | '#' ].			
			                         { c.  result8 } ].
	^ resultClassAndComment
]
