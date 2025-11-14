Class {
	#name : 'BallElement',
	#superclass : 'BlElement',
	#instVars : [
		'vx',
		'vy',
		'delta'
	],
	#category : 'Advent-Of-Code-2018',
	#package : 'Advent-Of-Code-2018'
}

{ #category : 'initialization' }
BallElement >> delta:  n [
 delta := n . 

]

{ #category : 'initialization' }
BallElement >> initialize [ 
 super initialize.
 self  background: Color random;
		        geometry: BlCircleGeometry new;
		        position: 400 @ 500;
		        extent: 20 @ 20.
		
		
		       
		
	
]

{ #category : 'initialization' }
BallElement >> updateBall: anExtent [
	| pos x y board wid hgt |

 "in order to bounce ball has to know size of the playfield"

  pos := self position.
  x := pos x. 
  y := pos y.

  board := anExtent . 
  wid := board x . 
  hgt := board y . 

  x := x + vx . 
  y := y + vy .

  x < 0 ifTrue: [ vx := 0 - vx ].
  y < 0 ifTrue: [ vy := 0 - vy ].
  x > wid ifTrue: [ vx := 0 - vx . x := wid - delta ].
  y > hgt ifTrue: [ vy := 0 - vy . y := hgt - delta ].

  self position: x @ y . 

]

{ #category : 'initialization' }
BallElement >> velocity: aVelocity [
	vx := aVelocity x.
	vy := aVelocity y.
	
]

{ #category : 'initialization' }
BallElement >> vx [
 ^ vx 

	
]

{ #category : 'initialization' }
BallElement >> vy [
 ^ vy 


	
]
