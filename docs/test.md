
# this is a test document

Depending on what version pharo running - it has the following location , so remember if edit , save and git push 
```
'/home/terry/Pharo/images/Pharo 13.0 - 64bit (stable)/pharo-local/iceberg/terryc321/Pharo-Advent-Of-Code/docs/test.md'
'~/Pharo/images/Pharo 14.0 - 64bit (development version, latest)/pharo-local/iceberg/terryc321/Pharo-Advent-Of-Code/docs/test.md'
```

# Advent of Code 2018 Day 17 


# graphical

smalltalk git repository there is a pbe-breakout using pharo 14 latest development BlElement Bloc graphics system  , 
with keyboard interaction and animation - responsive user interface 

there is comments in source browser tells use arrow keys to move bat , the ball bounces wherever 



interactive system 
want to be able to drag different files into the system easily - example images and have them work well together

this also extends to foreign function interface see cgi - C generated interface , libffi , clang see how other languages deal with 
foreign function interface

phase 1 - can make a program that puts something on the screen , something usable with colors and movement 
reasonable for animation , does not have to be perfect

```
PHASE ONE - THE GRAPHICAL SERVER - 

procedure LOOP {
while not quit do 
 if event in event queue 
   window resize -> 
   mouse enter ->
   mouse leave ->
   keypress ->
   focus lost ->
   focus gained ->
   window quit ->
   time tick -> 
 if idle -> process data being sent from an editor
          talking on a specific port 
 draw or update screen -> 
}
 		  
```

```
PHASE ONE - A more MODULAR GRAPHICAL SERVER - 

procedure LOOP {
while not quit do 
 call EVENT LOOP HANDLER
}

procedure EVENT_LOOP {
 if event in event queue 
   window resize -> 
   mouse enter ->
   mouse leave ->
   keypress ->
   focus lost ->
   focus gained ->
   window quit ->
   time tick -> 
   
  COOP_SERVER 
 if idle -> process data being sent from an editor
          talking on a specific port 
  		  
  UPDATE_SCREEN 
}
 		  
```

Question - how does the controlling program get notified on a window resize event ? 

how coordinate multiple windows , if one window crashes , other windows and the system itself remains up , 
keeps working , coordinated but independent of each other 


phase 2 - how can make this a live system ? such that we can change or interact with it ?
architecture is usually an event loop
in guile scheme this is called coop-event-listener ?
in common lisp - swank-server 

cannot redefine LOOP and expect any changes to take place because LOOP is already executing , 
only when procedure is not executing does system have a chance to replace its own procedures (redefine them)
and then execute them on the next call 

mmore procedures calling other procedures - the more opportunities there are to redefine procedure and have the system do something
totally different
all matters from a users perspective is that the procedures called do not take a long time since this will freeze the user interface. 

simple dead program displays a history of events - for example the waterfall puzzle . 
if we have a complete history of the events interested in from domain model 
 - totally ignoring how programming language does what it does , 
  only interested in solving the problem 
  
  we can go forward and backward in time quickly because all the computation has been done 
   offline system 
   
   online system be waiting for results to be computed so may have a default draw routine that just displays 
   maybe a menu and buttons or text editor where we can type stuff into system 
   
   or we can do this remotely - leveraging power of tools already written - 
   also freeing up user to use his / her own preferred editor - 
   do not need to write an editor - 
   simply focus on the graphical aspects - 
   
   given a model 
   - spawn a different viewer that presents information in a different way 
    - roassal for example
	- but not interacting with it 
	- how can we get closer to the live-ness ? 
	
	for example a debugger we can see exactly what the program has done and what values of different variables are 
	we can even go backwards in time if required ( since we have that information stored away somehow )
	
	we can then change things and proceed with computation - this is error prone in a stateful system because have to know
	all interactions and their consequences , whereas a functional system - there is none of that concern , 
	just too hard to get something working since no side effects
	
	
 
   

		  
		  






# org mode

can these documents be rendered from org mode ? 

how insert images into this ?

can we do this dynamically inside smalltalk ? 

so we can actually see the image 

really org mode for smalltalk 



