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

lets look at the character x , evaluate this in playground using inspect it 

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

"here is the character"
$x . 
```
