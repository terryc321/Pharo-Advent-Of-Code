
# Meta programming in pharo

Here we show how to create a class called Bob with instance variable fish and define accessors and setters.  A completely terrible design but allows us to write code that can be pasted into playground as see fit.

```
Object subclass: #Bob.
    slots: {} ;
    category: 'Garden'.

Bob compile: 'fish  ^123'.

|b|
b := Bob new fish .

Bob addInstVarNamed: #fish. 

Bob compile: 'fish: aFish
    fish := aFish'.

Bob compile: 'fish  ^fish'.

Bob compile: 'initialize 
  fish := ''harry'' '.

|b|
b := Bob new.
b fish.

```


# Class creation 
Here is squeak smalltalk
```
Object subclass: #Bob
    instanceVariableNames: 'fish'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Garden'.
```

And the same in Pharo smalltalk
```
Object << #Bob 
 slots: { #fish } ;
 package: 'Garden'.
 
"or with traits " 
Object << #Bob
    traits: TSomeTrait;
    slots: { #fish };
    package: 'Garden' 
 
```

# Method creation 

Now we have a class , how do we define methods on that class

```
Bob compile: 'fish  ^123'.
b := Bob new.
b fish.
```

## how about using those instance variables - fish

This does NOT compile in pharo.

```
Bob compile: 'fish
    ^fish'.

Bob compile: 'fish: aFish
    fish := aFish'.
```





"we pass the class Bob a string to be compiled "


We have a class called AOC2016Day2Hand2 with several methods such as left , right , up , down and centre.  Each time call these methods a brand new hand is created , so original hand can be stored in a structure and each time look at that structure it will be the original hand. This means a recursive algorithm can wildly keep jumping in and out of procedures as it sees fit without needing to worry about creating a new copy of the object or destroying the underlying recursive algorithm because legs have been chopped out under you in a game of football - chopper harris style.

```
h := AOC2016Day2Hand2 new centre.
h left. 
h right.
h up. 
h down. 
```

So i unload a package and now my environment is completely balked bauked - because old definitions which can be run but do nothing.

```
Object << #Bob 
  slots: { 'fred' };
  package: 'Garden'.

Bob >> #fish 
 ^ 'every weekend'.

Bob >> #walk
 ^ 'fred follows'.

b := Bob new.
b fish.
``` 



