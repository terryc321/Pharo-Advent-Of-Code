Class {
	#name : 'SampleHelpArtefact',
	#superclass : 'ClySyntaxHelpMorph',
	#category : 'AdventCode-Core',
	#package : 'AdventCode',
	#tag : 'Core'
}

{ #category : 'initialization' }
SampleHelpArtefact >> initialize [ 
 super initialize.


]

{ #category : 'as yet unclassified' }
SampleHelpArtefact >> rawMicrodownSyntax [

	^ '
# Artefact

[[https://book.huihoo.com/smalltalk/pharo/enterprise-pharo/book-result/Artefact/Artefact.html]]

Artefact for rendering pdf - can we view a generated pdf inside pharo - live editing

bit of a weird metacello command but does it work? - pharo 13 loads ok

can we automate testing of loading contributions and record if it fails or succeeds  - batch test

```smalltalk
Metacello new
    githubUser: ''pharo-contributions'' 
    project: ''Artefact'' 
    commitish: ''master'' 
    path: ''src''; 
    baseline: ''Artefact''; 
    load
```	

### Place text

To place the text on the page we create a component of type PDFTextElement. We add it to the page and define its position using the message from:. Note that we can specify dimensions using several units such as millimeters (mm), centineters (cm) or inches (inch). These coordinates are defined from the upper left corner of the page.

Artefact uses a set of defaults to get compact code when creating elements that are part of a document. More specifically, style parameters are set to what are considered the most common values. In this example the page format is set to A4, and its orientation to portrait. Also, text is by default written in black using the Helvetica font.

```
PDFDocument new add:
   (PDFPage new add:
      (PDFTextElement new text: ''Hello World!''; from: 10mm @ 10mm));
   exportTo: ''helloworld.pdf'' asFileReference writeStream
```

# Bit rot section 

anything after here is code that either does or did run 

```
PDFDocument new
    add: (PDFPage new add: (
        PDFTextElement new
            text: ''Hello World!'';
            from: 10 mm @ 10 mm;
            yourself
    )).

"    exportTo: (''helloworld.pdf'' asFileReference writeStream)"
```


```
"to see where output from PDFDemos will go - usually a relative directory from pharo working directory"
PDFDemos class >> demoPath.
```

### demoPath

This is where the demos will be written to.

```
PDFDemos demoPath . "''pdf/''"
```

### the demos


## alignmentsTest
   ![alignmentsTest](./pdf/alignmentsTest-1.png &width=400)
   
## lineTest
    ![lineTest](./pdf/lineTest-1.png &width=300)
## mosaiqueTest
    ![mosaiqueTest](/home/terry/code/smalltalk/Pharo-Advent-Of-Code/docs/pdf/mosaiqueTest-1.png &width=500)
## polygonsTest
    ![polygonsTest](iceberg/terryc321/Pharo-Advent-Of-Code/docs/pdf/polygonsTest-1.png &width=150) 
## thicknessTest
   ![thicknesstest](./pdf/thicknessTest-1.png &width=100)
## widthTest
   ![widthTest](./docs/pdf/widthTest-1.png &width=300)

### aside - generate demo images from PDFs

generate png images from the pdf files we employ a little shell script 

```
#/bin/bash

# for each .pdf file run this command 
# pdftoppm <name>.pdf <name> -png
```

we can recursively search using smalltalk below 

```smalltalk
| folder filteredFiles |
folder := ''/path/to/your/folder'' asFileReference.
"Get all children (files and directories) recursively"
filteredFiles := folder allChildren select: [ :each | each isFile ].

"Filter by extension (e.g., .jpg)"
jpgFiles := folder allChildren select: [ :each | each basename endsWith: ''jpg'' ].
```

a non recursive version below 

```smalltalk
| folder immediateItems pdfFiles |
folder := ''/path/to/your/folder'' asFileReference.
immediateItems := folder children.
pdfFiles := folder children select: [:each | each basename endsWith: ''pdf'' ].
```


```
| folder oggFiles |
folder := ''/path/to/your/music'' asFileReference.
oggFiles := folder allChildrenMatching: ''*.ogg''.
```

Key FileReference Methods
- basename: Returns the file name (e.g., ''file.txt''). 
- extension: Returns the file extension (e.g., ''txt''). 
- fullName: Returns the full path string. 
- isFile / isDirectory: Boolean checks for the entry type. 
- parent: Returns the parent directory reference.


### basenameWithoutExtension 

if just want file without the ''.pdf'' extension you can use this 

```
(self at: 1) basenameWithoutExtension 
```

### shell filenames

list of pdf files want to collect , want to run a program takes those filenames and generates png files so can see what they look like on webpage

```
| folder immediateItems pdfFiles names |
folder := ''pdf'' asFileReference.
immediateItems := folder children.
pdfFiles := (folder children select: [:each | each basename endsWith: ''pdf'' ])
            collect: [:each | { (each basename) . (each basenameWithoutExtension , ''.png'') } ] .
```

### running external command through smalltalk

```
| process |
process := OSSubprocess new 
    command: ''your_command''; 
    arguments: #(''arg1'' ''arg2'').
process run.
process exitStatus. "Check result"
```

### convert PDF to PNG

To convert PDF to PNG on Linux, the most efficient command-line tool is pdftoppm, which is part of the poppler-utils package.  You can install it via your distribution''s package manager (e.g., sudo apt install poppler-utils on Ubuntu/Debian or sudo dnf install poppler-utils on Fedora/RHEL). 

Basic Conversion To convert all pages of a PDF named document.pdf into separate PNG files, use:

```
pdftoppm -png document.pdf output_prefix
```

This creates files like output_prefix-1.png, output_prefix-2.png, etc. 

High-Quality Conversion The default resolution is 150 DPI. To achieve high quality (e.g., 300 DPI), add the -rx and -ry flags:

```
pdftoppm -png -rx 300 -ry 300 document.pdf output_prefix
```

Specific Page Ranges To convert only specific pages (e.g., pages 1 to 5), use the -f (first) and -l (last) flags:

```
pdftoppm -png -f 1 -l 5 document.pdf output_prefix
```

Batch Conversion To convert all PDFs in the current directory, use a loop:

for f in *.pdf; do pdftoppm -png "$f" "${f%.pdf}"; done

Alternative: ImageMagick You can also use ImageMagick with the convert command, specifying density for quality:

```
convert -density 300 document.pdf output.png
```

Note that ImageMagick may require a policy.xml adjustment to allow PDF processing depending on your installation. 


# Broken section 

Where good code comes to die

```
"generates a completely empty pdf - but it has no pages - okular viewer rejects this "
PDFDocument new exportTo: ''pdf/helloworld.pdf'' asFileReference writeStream.

"run the demos - generates a few nice pdfs - colour polygon , colour square mosaic , lines , line thickness test pages"
PDFDemos runAllDemos.

PDFDocument new
   add: PDFPage new;
   exportTo: ''pdf/helloworld.pdf'' asFileReference writeStream
```

'
]
