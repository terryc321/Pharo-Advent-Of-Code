Class {
	#name : 'AdventRepository',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AdventRepository class >> repoDir [
^ FileSystem disk / 'home' / 'terry' / 'bin' / 'pharo-13' / 'pharo-local' / 'iceberg' / 'terryc321' / 'Pharo-Advent-Of-Code/' / 'docs' / 'advent-code'  .
]
