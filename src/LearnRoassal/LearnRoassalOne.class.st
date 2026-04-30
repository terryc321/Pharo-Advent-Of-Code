"
```language=Pharo
RSChartExample new example01Markers open.
RSAnimationExamples new example03Atom open.

MyClass classSide allMethods select: [:method | method hasPragma: #script]   

RSChartExample classSide allMethods select: [:method | method hasPragma: #script].
RSChartExample classSide allMethods .

RSChartExample classSide allMethods reject: [ :method | 
	| here | 
	here := RSChartExample class methodDict at: (method selector) ifAbsent: [ nil ].
	here ifNil: [ false ] ifNotNil: [ true ]].

RSChartExample class methodDict at: #yourMethodSelector.


(String methodDict keys) asSortedCollection.
RSChartExample canUnderstand: #example01Markers.
""run each example - get the window - convert to screenshot - save file in 
particular directory then close that window.
how find what window opened ?
""
Transcript clear.
(RSChartExample methodDict keys)  asSortedCollection do: [ :name |
	| method |

	method := RSChartExample methodDict at: name.
	Transcript show: '#' , name ; cr .
	Transcript show: method sourceCode; cr.
""	Transcript show: '```smalltalk' , cr .
	Transcript show: '```' , cr .
""	
	Transcript show: '![Alt Text](images/' , name , '.png)' ; cr ; cr.
	Compiler evaluate: 'RSChartExample new ' , name.
	self halt.
 ].


```
"
Class {
	#name : 'LearnRoassalOne',
	#superclass : 'Object',
	#category : 'LearnRoassal',
	#package : 'LearnRoassal'
}

{ #category : 'translating' }
LearnRoassalOne >> generate [
| rsc |
rsc := RSChartExample new.
Transcript clear.
(RSChartExample methodDict keys)  asSortedCollection do: [ :name |
	| method |

	method := RSChartExample methodDict at: name.
	Transcript show: '#' , name ; cr .
	Transcript show: method sourceCode; cr.
"	Transcript show: '```smalltalk' , cr .
	Transcript show: '```' , cr .
"	
	Transcript show: '![Alt Text](images/' , name , '.png)' ; cr ; cr.
	(rsc perform: name) open.
	"Smalltalk evaluate: 'RSChartExample new ' , name."
 ].


]
