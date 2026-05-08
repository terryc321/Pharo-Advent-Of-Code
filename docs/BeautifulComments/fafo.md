# FAFO

if we click on a morph and inspect it 

we can add our own label morph to it.

```
| label |
label := LabelMorph new.
label contents: 'Meme'.
self owner addMorph: label.
```


# Owner chain

owner chain for LabelMorph we can see PluggableButtonMorph , we can look at the owners to see where mouse click will send its message

```
self target
self owner owner target
```

eventually it ends up at ClySyntaxHelpMorph , 

PluggableButtonMorph owns AlignmentMorph owns LabelMorph 'Syntax Help'.

PluggableButtonMorph has an actionSelector attribute which is set to '#action'.
When PluggableButtonMorph is in context we can call 'self target' to see where the action message is sent.

```
self target.
self actionSelector.
```

Browse to ClySyntaxHelpMorph>>action we can find the code that runs when the syntax button is pressed

```
```






