
# StPlayground

smalltalk playground 

Here we can create a playground with specific contents


```
| p file | 
p := StPlayground new.
file := (FileLocator localDirectory / 'iceberg' / 'terryc321' / 'Pharo-Advent-Of-Code' / 'docs' / 'Containers-Array2D' / 'page1.st').
p contents: (file contents).
p open.
```

```
p := StPlayground new.
p contents: '"this is the contents of the new playground" '.
p open.
```

So we could write a text file and import it into the playground as we see fit.


```
"1. Read the file contents into a string"
codeString := './path/to/your/script.st' asFileReference contentsOfEntireFile.

"2. Evaluate the string as Pharo code"
codeString doIt. "Or use: codeString inspect."
```

```
FileSystem disk workingDirectory
FileSystem disk homeDirectory
FileLocator localDirectory / 'iceberg' / 'terryc321' / 'Pharo-Advent-Of-Code' / 'docs' / 'Containers-Array2D' / 'page1.st'.
```


## Refresh on do it command 

Theres a hook method can use - CmCommandExecuted is not right will cause error - 
but it definitely runs everytime do a Do it.

```
"Hook into Do It so the current Miller inspector refreshes automatically"
StPlaygroundDoItCommand 
    when: CmCommandExecuted 
    do: [ :ann |
        StPlayground allInstancesDo: [ :pg |
            pg inspector ifNotNil: [ :ins |
                ins refresh.
                ins millerList ifNotNil: [:m | m refresh]
            ]
        ]
    ].
```


