"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAdventOfCode2018',
	#superclass : 'PackageManifest',
	#category : 'Advent-Of-Code-2018-Manifest',
	#package : 'Advent-Of-Code-2018',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleImplementedNotSentRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #parseLines: #false)) #'2026-05-14T22:19:28.14145+01:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleReCompactSourceCodeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #parseLines: #false)) #'2026-05-14T22:19:33.857682+01:00') )
]

{ #category : 'code-critics' }
ManifestAdventOfCode2018 class >> ruleSentNotImplementedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AOC2018Day17 #parseLines: #false)) #'2026-05-14T22:19:31.033525+01:00') )
]
