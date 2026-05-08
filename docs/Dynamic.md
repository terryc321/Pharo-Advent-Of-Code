
# Dynamic smalltalk


create a class called Foo , if it existed already what happens ?

```
Object subclass: #Foo. 
```

we can see that Foo is indeed defined in the smalltalk environment

```
Smalltalk classNames select: [ :c | c = 'Foo' ].
```

we can make a method for it 

```
Foo compile: 'test ^ 123'
```

we can provide its category at definition time

```
Foo compile: 'test ^ 123' classified: 'testing'.
```

can we dynamically choose name of class we are going to compile to

```
Smalltalk at: #Foo
```

if we have a string we can do the conversion to a symbol at same time

```
Smalltalk at: 'Foo' asSymbol
```

Lets say we make a class called Goofball - does it already exist? 

Smalltalk object in some ways behaves like a dictionary , if we search for a key that is not present it will throw an error, so we capture if absent and return nil

```
|s c|
s := 'Goofball'.
c := Smalltalk at: s asSymbol ifAbsent: [nil].
```

now we can look for our Foo class we created earlier and go one step further we assign it to the package AdventCode.

```
|s c|
s := 'Foo'.
c := Smalltalk at: s asSymbol ifAbsent: [nil].
c package: 'AdventCode'.
```

we can see the methods of class Foo 

```
Foo selectors.
```

lets see the comments for class Foo

```
Foo comment.
```

we cannot see anything it is just an empty string

```
Foo comment: 'this is my comment'.
```

we have now set the class Foo comment.

```
Foo comment: '#this is my header

this is my animal table

| first title | second title |
|-------------+--------------|
| dog         | four legs    |
| cat         | four legs    |
| tiger       | four legs    |
| zebra       | four legs    |
| ostreich    | two legs     |
| kangaroo    | two legs     |

this is my list
- one
  shower
  
- two
  get dressed
  
- three
  drive to work


'
```

