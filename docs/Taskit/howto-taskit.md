
# Lets try taskit 

Pharo 130 experiment

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
