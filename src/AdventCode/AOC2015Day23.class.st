"
Petit Parser2

```
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.
```

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
