"
baseline

spec baseline: 'Bloc' with: [ spec repository: 'github://pharo-graphics/Bloc:v2.5.0/src' ].


"
Class {
	#name : 'ManifestAdventOfCode2018',
	#superclass : 'PackageManifest',
	#category : 'Advent-Of-Code-2018-Manifest',
	#package : 'Advent-Of-Code-2018',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleReCompactSourceCodeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #sprayWaterDownAt: #false)) #'2026-05-15T14:48:16.716947+01:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleReGuardClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #sprayWaterDownAt: #false)) #'2026-05-15T14:48:18.910135+01:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleSelfSentNotImplementedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #sprayWaterDownAt: #false)) #'2026-05-15T14:48:14.355387+01:00') )
]
