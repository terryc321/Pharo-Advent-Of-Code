
# SampleHelp

utilising ClySyntaxHelpMorph and changing rawMicrodownSyntax 

SampleHelp subclasses ClySyntaxHelpMorph and over-rides rawMicrodownSyntax so changing
the microdown that gets passed to a RubbedMorph

```
s := SampleHelp new. 
s action.

s := SampleHelpArtefact new. 
s action.

FileSystem workingDirectory / 'pdf' / 'mosaiqueTest-1.png'

MicRelativeResourceReference 

m := Microdown new.
m parseFile: '/home/terry/code/smalltalk/Pharo-Advent-Of-Code/docs/Artefact.md' asFileReference.
```


