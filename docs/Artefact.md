# Artefact

[[https://book.huihoo.com/smalltalk/pharo/enterprise-pharo/book-result/Artefact/Artefact.html]]

Artefact for rendering pdf - can we view a generated pdf inside pharo - live editing

bit of a weird metacello command but does it work? - pharo 13 loads ok

can we automate testing of loading contributions and record if it fails or succeeds  - batch test

```smalltalk
Metacello new
    githubUser: 'pharo-contributions' 
    project: 'Artefact' 
    commitish: 'master' 
    path: 'src'; 
    baseline: 'Artefact'; 
    load
```	

### Place text

To place the text on the page we create a component of type PDFTextElement. We add it to the page and define its position using the message from:. Note that we can specify dimensions using several units such as millimeters (mm), centineters (cm) or inches (inch). These coordinates are defined from the upper left corner of the page.

Artefact uses a set of defaults to get compact code when creating elements that are part of a document. More specifically, style parameters are set to what are considered the most common values. In this example the page format is set to A4, and its orientation to portrait. Also, text is by default written in black using the Helvetica font.

```
PDFDocument new add:
   (PDFPage new add:
      (PDFTextElement new text: 'Hello World!'; from: 10mm @ 10mm));
   exportTo: 'helloworld.pdf' asFileReference writeStream
```

# Bit rot section 

anything after here is code that either does or did run 

```
PDFDocument new
    add: (PDFPage new add: (
        PDFTextElement new
            text: 'Hello World!';
            from: 10 mm @ 10 mm;
            yourself
    )).

"    exportTo: ('helloworld.pdf' asFileReference writeStream)"
```


```
"to see where output from PDFDemos will go - usually a relative directory from pharo working directory"
PDFDemos class >> demoPath.
```

### demoPath

This is where the demos will be written to.

```
PDFDemos demoPath . "'pdf/'"
```

### the demos

generate png images from the pdf files we employ a little shell script 

```
#/bin/bash

# for each .pdf file run this command 
# pdftoppm <name>.pdf <name> -png
```

we can recursively search using smalltalk below 

```smalltalk
| folder filteredFiles |
folder := '/path/to/your/folder' asFileReference.
"Get all children (files and directories) recursively"
filteredFiles := folder allChildren select: [ :each | each isFile ].

"Filter by extension (e.g., .jpg)"
jpgFiles := folder allChildren select: [ :each | each basename endsWith: 'jpg' ].
```

a non recursive version below 

```smalltalk
| folder immediateItems pdfFiles |
folder := '/path/to/your/folder' asFileReference.
immediateItems := folder children.
pdfFiles := folder children select: [:each | each basename endsWith: 'pdf' ].
```


```
| folder oggFiles |
folder := '/path/to/your/music' asFileReference.
oggFiles := folder allChildrenMatching: '*.ogg'.
```

Key FileReference Methods
- basename: Returns the file name (e.g., 'file.txt'). 
- extension: Returns the file extension (e.g., 'txt'). 
- fullName: Returns the full path string. 
- isFile / isDirectory: Boolean checks for the entry type. 
- parent: Returns the parent directory reference.



```
"generates a completely empty pdf - but it has no pages - okular viewer rejects this "
PDFDocument new exportTo: 'pdf/helloworld.pdf' asFileReference writeStream.

"run the demos - generates a few nice pdfs - colour polygon , colour square mosaic , lines , line thickness test pages"
PDFDemos runAllDemos.

PDFDocument new
   add: PDFPage new;
   exportTo: 'pdf/helloworld.pdf' asFileReference writeStream
```

