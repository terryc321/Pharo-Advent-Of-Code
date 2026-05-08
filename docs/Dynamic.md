
# Dynamic smalltalk


create a class called Foo , if it existed already what happens ?

```
Object subclass: #Foo. 
```

we can make a method for it 

```
Foo compile: 'test 
^ 123'
```

we can provide its category at definition time

```
Foo compile: 'test 
^ 123' classified: 'testing'.
```



We can try it out and it gives 123 as the result 
```
|foo|
foo := Foo new.
foo test.
```



We can see what methods are defined for this class

```
Foo selectors
```

