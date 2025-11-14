
# Advent of Code 2018 Day 17 Reservoir Research - Attempt 1

Technical aside 
```
Goto menu in pharo 14 and select "load Toplo and Bloc"
```
this will load BlElement , BlSpace classes hopefully




```
x=495, y=2..7
y=7, x=495..501
x=501, y=3..7
x=498, y=2..4
x=506, y=1..2
x=498, y=10..13
x=504, y=10..13
y=13, x=498..504
```
Rendering clay as #, sand as ., and the water spring as +, and with x increasing to the right and y increasing downward, this becomes:

```
   44444455555555
   99999900000000
   45678901234567
 0 ......+.......
 1 ............#.
 2 .#..#.......#.
 3 .#..#..#......
 4 .#..#..#......
 5 .#.....#......
 6 .#.....#......
 7 .#######......
 8 ..............
 9 ..............
10 ....#.....#...
11 ....#.....#...
12 ....#.....#...
13 ....#######...
```


Phase One - Lets render this onto screen 

we have pharo 14 development edition latest be using BlElements - there is a PBE-Breakout game in ~/code/smalltalk 
we can use as a template for this task 

ideally we just want a grid on the screen with some different coloured rectanges , or just use different
coloured rectangles 



