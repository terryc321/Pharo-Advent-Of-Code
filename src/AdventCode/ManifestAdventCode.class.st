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
	#name : 'ManifestAdventCode',
	#superclass : 'PackageManifest',
	#category : 'AdventCode-Manifest',
	#package : 'AdventCode',
	#tag : 'Manifest'
}
