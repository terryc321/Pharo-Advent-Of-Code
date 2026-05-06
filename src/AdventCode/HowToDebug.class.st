"
```
""You can run your fresh new tutorial like this:""

ProfStef goOn: HowToDebug.
```

```
""the initial introduction to ProfStef""

ProfStef go.

""the tutorial on making tutorials""


""you can see all tutorials available""
ProfStef contents.

```


```
""Next, create category 'lessons' and add a method per lesson.

Each method must return a Lesson object.

Your can use Lesson class>>title:lesson: to create Lesson object.""

HowToDebug compile:
'useSelfHalt
	^ Lesson
title: ''self halt''
lesson:
''""Put self halt. in the method you want to debug.""

ProfStef next.'''
classified: 'lessons'.

HowToDebug compile:
'examineStackTrace
	^ Lesson
title: ''self halt''
lesson:
''""Look at PharoDebug.log.""

ProfStef next.'''
classified: 'lessons'.

HowToDebug compile:
'changeReturnValue
	^ Lesson
title: ''Change return value''
lesson:
''""Easy in the debugger !""'''
classified: 'lessons'.

ProfStef next.
```
"
Class {
	#name : 'HowToDebug',
	#superclass : 'AbstractTutorial',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'lessons' }
HowToDebug >> changeReturnValue [
"must return a Lesson object"
	^ Lesson
title: 'Change return value'
lesson:
'"Easy in the debugger !"'
]

{ #category : 'lessons' }
HowToDebug >> examineStackTrace [
"must return a Lesson object"
	^ Lesson
title: 'self halt'
lesson:
'"Look at PharoDebug.log."

ProfStef next.'
]

{ #category : 'tutorial' }
HowToDebug >> tutorial [
"return a list of lessons as array"
	^ #(
#useSelfHalt
#examineStackTrace
#changeReturnValue
)
]

{ #category : 'lessons' }
HowToDebug >> useSelfHalt [
"must return a Lesson object"
	^ Lesson
title: 'self halt'
lesson:
'"This is my first tutorial. 
Put self halt. in the method you want to debug."

ProfStef next.'
]
