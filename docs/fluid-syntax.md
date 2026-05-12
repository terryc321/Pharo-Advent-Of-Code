
# Smalltalk 

everything is an Object. there is an Object class . 

in order to create an new object we subclass 



# Fluid syntax

The bigger problem with smalltalk from a beginner is with class definition

Lets try to make a robot object with position and direction . 
to do this we should possibly make a class since smalltalk does not allow objects without classes. ?

```
Object << #Robot

```



Look at this sample

```smalltalk
Object << #AOCRobot
	slots: { #direction . #position };
	package: 'Foo'.
"this will compile fine in pharo but it will not work.

"we can check smalltalk understands the Integer class"
Smalltalk at: #Integer.

"we can check smalltalk understand the new AOCRobot class - unfortunately it will not"
Smalltalk at: #AOCRobot.
```

might think that this creates a AOCRobot class with instance variables direction and position.


let us create one AOCRobot instance 

```
robotOne := AOCRobot new.
```

meaning each instance of AOC
