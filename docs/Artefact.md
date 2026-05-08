# Artefact

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

```
PDFDemos demoPath . "'pdf/'"
```


```
"generates a pdf - but it has no pages - okular viewer rejects this "
PDFDocument new exportTo: 'pdf/helloworld.pdf' asFileReference writeStream.

"generates a few nice pdfs - colour polygon , colour square mosaic , lines , line thickness test pages"
PDFDemos runAllDemos.

PDFDocument new
   add: PDFPage new;
   exportTo: 'pdf/helloworld.pdf' asFileReference writeStream
```
