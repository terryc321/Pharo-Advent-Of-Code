
# WorldMenu

beginners see this [[https://github.com/pharo-open-documentation/pharo-wiki/tree/master]]

if we look at any entry in world menu and search up through owners until we get to a target.

this is the menu for System Browser

```
worldMenuOn: aBuilder

	<worldMenu>
	(aBuilder item: #'System Browser')
		parent: #Browsing;
		action: [ (self tools toolNamed: #browser) open ];
		order: 0;
		keyText: 'o, b';
		help: 'System browser to browse and edit code.';
		iconName: #smallSystemBrowser
```

[[https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/InterestingsToKnowForBeginners.md#useful-pragmas]]

## worldMenu pragma

## wiki notes 

i remember reading about making a menu with sub menus , they are class side methods which 
when scanned by compiler get integrated into the pharo world menu 

what is the current world ?

can we have more than one world at any one time ?

what happended to etoys - even though i never understood how to use it - ever...





