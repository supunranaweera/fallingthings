
// Project: movingthing 
// Created: 2019-11-03

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "movingthing" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

//--VARIABLES--//
speed = 1
diry = 10

CreateImageColor(1, 150, 150, 150, 255)
CreateImageColor(2, 255, 255, 255, 255)


//create background sprite
CreateSprite(99, 1)
SetSpriteSize(99, GetVirtualWidth(), GetVirtualHeight() )
SetSpritePosition(99, 0, 0)

//create player sprite
CreateSprite(1, 2)
SetSpriteSize(1, 50, 50)
playerx = GetVirtualWidth()/2 - GetSpriteWidth(1)
playery = GetVirtualHeight() - GetSpriteHeight(1) - 10
SetSpritePosition(1, playerx, playery)

//falling sprites
CreateSprite(2, 2)
obstaclew = Random(100, 330)
obstacleh = Random(100, 330)
SetSpriteSize(2, obstaclew, obstacleh)
obstaclex = Random(0, GetVirtualWidth() - GetSpriteWidth(2))
obstacley = 0
SetSpritePosition(2, obstaclex, obstacley)

do
  //'A' and 'D' key controls for player
  if GetRawKeyState(65) //'A' key
	  playerx = playerx - 20
  endif
  if GetRawKeyState(68) //'D' key
	  playerx = playerx + 20
  endif
  SetSpritePosition(1, playerx, playery)
  if playerx < 0
	  playerx = 0
  endif
  if playerx > GetVirtualWidth() - GetSpriteWidth(1)
	  playerx = GetVirtualWidth() - GetSpriteWidth(1)
  endif
  
  
  //falling obstacles
  obstacley = obstacley + diry*speed
  if obstacley > GetVirtualHeight()
	  obstaclew = Random(100, 330)
	  obstacleh = Random(100, 330)
	  SetSpriteSize(2, obstaclew, obstacleh)
	  obstaclex = Random(0, GetVirtualWidth() - GetSpriteWidth(2))
	  obstacley = 0
	  diry = diry + 1
  endif
  SetSpritePosition(2, obstaclex, obstacley)
  
  

    Sync()
loop
