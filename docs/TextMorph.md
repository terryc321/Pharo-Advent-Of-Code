# TextMorph

text morph does not actually work. 

SpRubScrolledTextMorph does appear on screen. 


```
m := Morph new.
m extent: 100@100.
m color: Color black.
m openInHand.

t := SpRubScrolledTextMorph new.
t extent: 500@500.
t color: Color blue.
t openInHand.
t textMorph scroller addMorph: m.  <<< this line here is problematic
m position: 100@100.
```


