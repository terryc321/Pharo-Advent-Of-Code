
# StProcessBrowser


The toolbar is constructed using this method

```
StProcessBrowser>>buildProcessToolbarActions
```

Here we can see Terminate - Suspend - Signal - Priority - Debug 

We try insert a Resume button after Suspend

```
buildProcessToolbarActions
	^ SpActionGroup new
		addActionWith: [ :action | action 
			name: 'Terminate';
			iconName: #stop; 
			description: 'Terminate selected process.';
			shortcutKey: $x actionModifier;
			action: [ self terminateSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		addActionWith: [ :action | action 
			name: 'Suspend';
			iconName: #pause; 
			description: 'Suspend selected process.';
			shortcutKey: $s actionModifier;
			action: [ self suspendSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		">>inserted code here for resume button >>"
		addActionWith: [ :action | action 
			name: 'Resume';
			iconName: #smallRightFlush ; 
			description: 'Resume selected process.';
			shortcutKey: $r actionModifier;
			action: [ self resumeSelectedProcess ];
			actionEnabled: [ self canResumeSelectedProcess ] ];
		addActionWith: [ :action | action 
			name: 'Signal';
			iconName: #play; 
			description: 'Signal this process semaphore.';
			shortcutKey: $s shift actionModifier;
			action: [ self signalSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		addActionWith: [ :action | action 
			name: 'Priority';
			iconName: #up; 
			description: 'Change priority of selected process.';
			shortcutKey: $p actionModifier;
			action: [ self changePriorityOfSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		addActionWith: [ :action | action 
			name: 'Debug';
			iconName: #smallDebug; 
			description: 'Debug selected process.';
			shortcutKey: $d actionModifier;
			action: [ self debugSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		"addActionWith: [ :action | action 
			name: 'Profile';
			iconName: #smallProfile; 
			description: 'Profile selected process.';
			action: [ self profileSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];"
		addActionWith: [ :action | action 
			name: 'Inspect';
			iconName: #smallInspectIt;
			description: 'Inspect selected process.';
			shortcutKey: $i actionModifier;
			action: [ self inspectSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		yourself
```

-----------------------

AISLOP



Thought for 20s
To add a "Resume" button to the Process Browser in modern Pharo (using the Spec-based StProcessBrowser in NewTools), you can extend it with a custom action.⁠GitHub

Quick Way: Add via Extension / Subclass (Recommended)
The cleanest approach is to create an extension or subclass and add your button to the process toolbar.

Open a Playground and evaluate this to explore the current structure (optional):

StProcessBrowser open.
StProcessBrowser browse.  "or inspect the class"
Add a Resume action by extending the toolbar builder.

Here's code you can file in (or put in your own package):

"Extension method on StProcessBrowser"
{ #category : '*MyExtensions' }
StProcessBrowser >> buildProcessToolbarActionsWithResume [

    ^ super buildProcessToolbarActions  "or copy the original if needed"
        addActionWith: [ :action | action
            name: 'Resume';
            iconName: #smallRightFlush;  "or #glamorousRightSide"
            description: 'Resume selected suspended process.';
            shortcutKey: $r actionModifier;
            action: [ self resumeSelectedProcess ];
            actionEnabled: [ self canResumeSelectedProcess ];
            yourself ];
        yourself
]

{ #category : '*MyExtensions' }
StProcessBrowser >> resumeSelectedProcess [
    | process |
    (process := self selectedProcess) ifNil: [ ^ self ].
    
    process isSuspended ifTrue: [
        process resume.
        self refreshProcessList.
    ] ifFalse: [
        self inform: 'Process is not suspended.'
    ]
]

{ #category : '*MyExtensions' }
StProcessBrowser >> canResumeSelectedProcess [
    | process |
    process := self selectedProcess.
    ^ process notNil and: [ process isSuspended ]
]
Alternative: Override buildProcessToolbarActions
For a more permanent local change, you can subclass StProcessBrowser and override the toolbar method:

StProcessBrowser subclass: #MyProcessBrowser
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MyTools'

MyProcessBrowser >> buildProcessToolbarActions [
    ^ super buildProcessToolbarActions
        addActionWith: [ :action |
            action
                name: 'Resume';
                iconName: #smallRightFlush;
                description: 'Resume the selected process';
                shortcutKey: $r command;
                action: [ self resumeSelectedProcess ];
                actionEnabled: [ self canResumeSelectedProcess ] ];
        yourself
]
Then open your version with MyProcessBrowser open.

How to Make the Button Appear
After adding the code, you may need to:

Re-open the Process Browser (StProcessBrowser open).
Or force a refresh of the toolbar in an existing window by re-initializing presenters (less common).
Notes
Resume logic: Process>>resume works on suspended processes. Suspended processes have isSuspended true. Be careful resuming critical system processes.
In the existing code, the Debug button already does a resume before debugging if the process is suspended.⁠GitHub
Toolbar uses SpActionGroup + SpToolbarPresenter (Spec2), so actions are very declarative.
Icons: Common ones include #smallRightFlush, #glamorousRightSide, #refresh, etc. You can browse self iconNamed: for more.
Would you like a full ready-to-file-in version, or do you want to customize it further (e.g., add it only under certain conditions, change position, etc.)?


----------------------------------------------------------------

how can i view icons in pharo

Best way to browse all available icons in Pharo:
1. Quick & Recommended (Opens a nice Icon Browser)
Evaluate this in a Playground:
smalltalkSmalltalk ui icons inspect
This opens an inspector with a dedicated "Icons" tab (especially nice in recent Pharo versions) where you can visually browse hundreds of available icons.
2. Alternative ways
smalltalk"Directly open the icon catalog"
ThemeIcons current inspect.

"Or list all icon selectors as symbols"
Smalltalk ui icons allIcons keys sorted inspect.
3. Common useful icons for a Resume button
Here are popular ones that work well for "Resume / Play / Continue":

#smallRightFlush (the one you had)
#glamorousRightSide
#smallForward
#smallRight
#smallPlay
#smallOk
#smallYes
#smallExecute
#smallDoIt
#refresh
#smallUpdate
#smallRestart

You can use any of them like this:
smalltalkaction iconName: #smallPlay.     "or #smallForward, etc."
Bonus: Find icons by name
If you want to search for icons containing a word (e.g. "play", "right", "go"):
smalltalk(Smalltalk ui icons allIcons keys 
    select: [ :k | 'play right go forward resume' asLowercase anySatisfy: [ :w | k asLowercase includesSubstring: w ] ]) 
    sorted inspect
Would you like me to show you how to add a few different resume/play icons so you can quickly test which one looks best in the Process Browser?


