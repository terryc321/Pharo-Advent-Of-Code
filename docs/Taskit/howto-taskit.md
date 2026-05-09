
# Lets try taskit 

Pharo 130 experiment.
for ease of quick experiment - replaced all occurrences of logCr with traceCr . 


If metacello fails - entire system is in an unknown state, unless we know how to undo everything that it did

```
Metacello new
  baseline: 'TaskIt';
  repository: 'github://pharo-contributions/taskit:v1.2.0';
  load.
```

looking at pharo 13 already a baseline for taskit

```
baseline: spec

	<baseline>
	spec for: #'pharo6.1.x' do: [ self baselineForPharo6: spec ].
	spec for: #'pharo7.x' do: [ self baselineForPharo7: spec ].

	spec for: (self pharoVersionsFrom: 8) do: [
		spec package: #TaskIt.
		self baselineForCommon: spec ]
```

```
baselineForCommon: spec

	spec
		package: #'TaskIt-Tests' with: [ spec requires: #('TaskIt') ];
		package: #TaskItRetry with: [ spec requires: #('TaskIt') ];
		package: #'TaskItRetry-Tests' with: [ spec requires: #('TaskItRetry') ];
		package: #TaskItProcesses with: [ spec requires: #('TaskIt') ];
		package: #'TaskItProcesses-Tests' with: [ spec requires: #('TaskItProcesses') ];
		package: #TaskItBrowser with: [ spec requires: #('TaskItProcesses') ];
		package: #TaskItDebugger with: [ spec requires: #('TaskItProcesses') ];
		package: #'TaskItDebugger-Tests' with: [ spec requires: #('TaskItDebugger') ].

	spec
		group: 'core' with: #('TaskIt');
		group: 'coreTests' with: #('TaskIt' 'TaskIt-Tests');
		group: 'default' with: #(
			'core' 
			'TaskItProcesses' 
			'TaskItRetry' 
			'TaskItDebugger' 
			'TaskIt-Tests' 
			'TaskItRetry-Tests' 
			'TaskItProcesses-Tests' 
			'TaskItDebugger-Tests');
		group: 'debug' with: #('minimal' 'TaskItDebugger');
		group: 'tests' with: #(
			'default' 
			'TaskIt-Tests' 
			'TaskItRetry-Tests' 
			'TaskItProcesses-Tests' 
			'TaskItDebugger-Tests');
		group: 'development' with: #('default' 'debug' 'tests')
```

```
[ 1 + 1 ] schedule. =>>  "a TKTGenericTask"
```

All value-ables can be tasks. As long as object understands value message then it can be a task.
Here is an object task

```
Object subclass: #MyTask
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyPackage'.

MyTask >> value
    ^ 100 factorial

"we create a task "
TKTTask valuable: MyTask new.	
```

## Futures

To get the actual result from a task - use a future

```smalltalk
aFuture := [ 2 + 2 ] future.
aFuture onSuccessDo: [ :result | result traceCr ].
aFuture onFailureDo: [ :error | error sender method selector traceCr ].
```


```smalltalk
future := [ 2 + 2 ] future.
future onSuccessDo: [ :v | FileStream stdout nextPutAll: v asString; cr ].
future onSuccessDo: [ :v | 'Finished' traceCr ].
future onSuccessDo: [ :v | [ v factorial traceCr ] schedule ].
future onFailureDo: [ :error | error traceCr ].
```

Ok already a bit nervous as seeing the word semaphore

```smalltalk
future := [ 1 second wait. 2 + 2 ] future.
future onSuccessDo: [ :v | v traceCr ].

2 seconds wait.
future onSuccessDo: [ :v | v traceCr ].
```

Here is the major test 11:40 on 09/05/2026 uk time date. 
a ridiculously large factorial computation on a single core.

```
aFuture := [ 10000000 factorial ] future.
aFuture onSuccessDo: [ :result | result traceCr ].
aFuture onFailureDo: [ :error | error sender method selector traceCr ].
```
