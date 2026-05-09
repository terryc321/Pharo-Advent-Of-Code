"
Petit Parser2

```
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

also see class {{AOC2015Day7}}


you can also try the gui but need RB .

```
Metacello new
	baseline: 'PetitParser2Gui';
	repository: 'github://kursjan/petitparser2';
   	load.
```


"
Class {
	#name : 'AOC2015Day23',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day23 >> howto [
"
day23 := AOC2015Day23 new.
day23 input.
day23 jio parse: 'jio a, '.
day23 jio parse: 'jio a,'.
day23 plusInt parse:'+123'.
day23 jio parse: 'jio a, +123'.
"

]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> incA [
"inc a"
^ 'inc a' asPParser.




]

{ #category : 'accessing' }
AOC2015Day23 >> input [ 
^ 'jio a, +16
inc a
inc a
tpl a
tpl a
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
tpl a
tpl a
inc a
jmp +23
tpl a
inc a
inc a
tpl a
inc a
inc a
tpl a
tpl a
inc a
inc a
tpl a
inc a
tpl a
inc a
tpl a
inc a
inc a
tpl a
inc a
tpl a
tpl a
inc a
jio a, +8
inc b
jie a, +4
tpl a
inc a
jmp +2
hlf a
jmp -7'.
]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> interpret: aString [
 | s| 
s := aString.



]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jio [
"jie a, +123"
^ ('jio a, ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> jmp [
"jmp +123"
^ ('jmp ' asPParser , self plusInt).


]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> plusInt [
"+123"
^ $+ asPParser , #digit asPParser star.



]

{ #category : 'as yet unclassified' }
AOC2015Day23 >> tplA [
"tpl a"
^ 'tpl a' asPParser.




]
