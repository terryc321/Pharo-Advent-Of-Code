Class {
	#name : 'SampleHelp',
	#superclass : 'ClySyntaxHelpMorph',
	#category : 'AdventCode-Core',
	#package : 'AdventCode',
	#tag : 'Core'
}

{ #category : 'initialization' }
SampleHelp >> initialize [ 
 super initialize.


]

{ #category : 'initialization' }
SampleHelp >> rawMicrodownSyntax [

	^ '
#Microdown is quite cool

This has been rendered - apparently it can do math equations also

Here is some code 

```language=Pharo&caption=Beautiful&anchor=Fig1
   1000 factorial / 999 factorial
```

Here is a figure and a link: [http://pharo.org](http://pharo.org).

![Pharologo](https://files.pharo.org/media/logo/logo.png size=80&anchor=figLogo.)



Here is a list:
- item 1
  1. sub item 1 
  3. sub item 2
- item 2


**Bold**, _italic_, `monospace`

In Pharo, Microdown supports hyperlinks to: 
- classes e.g., `Point`, 
- methodes e.g., `Point class`, `Point>>#setX:setY:`, and 
- packages e.g., `#''Microdown-Tests''` (for packages).

You can edit this file clicking on `ClySyntaxHelpMorph>>#rawMicrodownSyntax`.
'
]
