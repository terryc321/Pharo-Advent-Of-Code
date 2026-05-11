Extension { #name : 'StProcessBrowser' }

{ #category : '*AdventCode' }
StProcessBrowser >> buildProcessToolbarActions [
	^ SpActionGroup new
		addActionWith: [ :action | action 
			name: 'Terminate';
			iconName: #stop; 
			description: 'Terminate selected process.';
			shortcutKey: $x actionModifier;
			action: [ self terminateSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		addActionWith: [ :action | action 	
        name: 'Pause';						
			iconName: #pause; 
			description: 'Suspend selected process.';
			shortcutKey: $s actionModifier;
			action: [ self suspendSelectedProcess ];
			actionEnabled: [ self selectedProcess notNil ] ];
		addActionWith: [ :action | action 
			name: 'Resume';
			iconName: #smallForward ; 
			description: 'Resume selected process.';
			shortcutKey: $r actionModifier;
			action: [ self resumeSelectedProcess ];
			actionEnabled: [ self canResumeSelectedProcess ] ];		
		addActionWith: [ :action | action 
			name: 'Signal';
			iconName: #bigplay; 
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
]

{ #category : '*AdventCode' }
StProcessBrowser >> canResumeSelectedProcess [

	| process |
	process := self selectedProcess.
	^ process notNil and: [ process isSuspended ]
]

{ #category : '*AdventCode' }
StProcessBrowser >> resumeSelectedProcess [

	| process |
	(process := self selectedProcess) ifNil: [ ^ self ].
	process isSuspended
		ifTrue: [
				process resume.
				self refreshProcessList ]
		ifFalse: [ self inform: 'Process is not suspended' ]
]
