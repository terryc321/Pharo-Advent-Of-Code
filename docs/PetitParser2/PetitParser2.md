
# Petit Parser 2

say we have developed our parser and want to know if has failed

```
|r|
r:= day23 jmp parse: 'poke +23'.
r isPetit2Success .

|r|
r:= day23 jmp parse: 'poke +23'.
r isPetit2Failure .
```



```
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

[[github://kursjan/petitparser2]]

[[https://kursjan.github.io/petitparser2/]]

Theres a gui also !

```
Metacello new
	baseline: 'PetitParser2Gui';
	repository: 'github://kursjan/petitparser2';
   	load
```
