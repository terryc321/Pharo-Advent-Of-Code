
# Advent Code 2015 Day 7

Given input stored under method #puzzleInput , we should be able to split this into multiple lines

```
aoc := AOC2015Day7 new.
lines := ((aoc puzzleInput) splitOn: String cr).
```

the first line should be

```
line1 := lines at: 1 . 
```



```
aoc := AOC2015Day7 new.
lines := ((aoc puzzleInput) splitOn: String cr).
1 to: (lines size) do: [ :i | 
	|line|
	line := lines at: i .
	line inspect.
	self halt.
	aoc parseLine: line ].

aoc parseLine: 'lf AND lq -> ls'.
aoc parseLine: 'iu RSHIFT 1 -> jn'.

((aoc puzzleInput) splitOn: String cr) at: 1. 

aoc parse: ((aoc puzzleInput) splitOn: String cr).
aoc parse: {'lf AND bg -> cf'}.
aoc parse: {'lf AND 3 -> cf'}.
'hi'.


"aoc computePass: #a."
aoc.

dict := Dictionary new.
dict at: 1 put: 1.
dict.
dict at: 2 ifPresent: [:v| ^ v ] ifAbsent: [ ^22 ].
dict at: 3 ifPresent: [:v| ^ v ] ifAbsent: [ ^33 ].


 ifAbsentOrNil: [ dict at: 2 put: 'Two'  ].
```


