"
```language=Pharo

""see https://github.com/kursjan/petitparser2""
Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.

""install extra languages ""
Metacello new
    baseline: 'PetitParser2Languages';
    repository: 'github://kursjan/petitparser2';
    load.

```
"
Class {
	#name : 'ManifestAdventCode2015',
	#superclass : 'PackageManifest',
	#category : 'AdventCode2015-Manifest',
	#package : 'AdventCode2015',
	#tag : 'Manifest'
}
