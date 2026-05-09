
# MicTextPresenter

class side methods - exampleSample and exampleCheatSheet

MicTextPresenter class>>exampleSample

```
exampleSample
	<example>
	^ self new
		  text: (Microdown asRichText: self sampleDocument);
		  open
```



```
exampleCheetSheet
	<example>
	^ self new
		  text: (Microdown asRichText: self cheetSheet);
		  open
```
