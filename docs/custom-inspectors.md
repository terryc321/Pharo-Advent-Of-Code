# Custom inspectors

Inspectors are found by StInspectionCollector which scans source code when system compiles new code

## STInspectionCollector comment
I collect inspections from an object which wants to be inspected.
I traverse the hierarchy of the object collecting #extensionPragmas and applying them.

For now, I have two pragmas that receive 2 or 3 arguments: 

- inspectorPresentationOrder:title:
- inspectorPresentationOrder:title:if:

order: inspection appearance order
title: inspection title
if: a block receiving ONE argument that will be evaluated to determine if that inspection needs to be shown.

The arguments of the pragmas are required because the tabs are calculated lazily and this information 
is required before.


## Examples using inspectorPresentationOrder

Spec and Toplo have both been loaded , perhaps even Roassal full. 

if open finder and change dropdown to Pragmas

in search write inspect , click search , results in 957 packages highlighed 


```
$x
```

lets look at the character x , evaluate this in playground using inspect it - it has 3 entries. self , codepoint and unicode all under the Character tab. here we can see how this is generated, this inspection uses StSimpleInspectorBuilder on aBuilder.

```
inspectCharacterIn: aBuilder
	<inspectorPresentationOrder: 30 title: 'Character'>	
	^ (StSimpleInspectorBuilder on: aBuilder)
		key: #self value: self;
		key: #codepoint value: self codePoint;
		key: #unicode value: (String streamContents: [ :stream | 
			stream << 'U+'.
			self codePoint printOn: stream base: 16 nDigits: 4 ]);
		table
```
Here is another example from RSCanvas 

```
inspectorCanvas: aBuilder
	<inspectorPresentationOrder: 90 title: 'Canvas'>
	
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		canvas: self;
		yourself
```

Here is one from Collection class , if we inspect a collection ```#(1 2 3)``` we should find a tab called items which shows a list of two collumns - one called index which is ordered and second called value

```
inspectionItems: aBuilder
	<inspectorPresentationOrder: 0 title: 'Items'> 
	
	^ aBuilder newTable
		addStyle: 'stList';
		addColumn: (SpIndexTableColumn new 
			title: 'Index';
			sortFunction: #yourself ascending;
			beNotExpandable;
			yourself);
		addColumn: (SpStringTableColumn new  
			title: 'Value'; 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ];
			beSortable;
			yourself);
		items: self asOrderedCollection;
		yourself
```

