/*
 *  Logo.cpp
 *  cuboid
 *
 *  Created by mikelas on 10/11/21.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Logo.h"


CLogo::CLogo() : CBaseScene()/*, pBGTex( NULL ), pBG( NULL )*/, timeCounter( 0.0f ){
//	bgTex = loadTexture2(@"WallPaper.png");

	appState = APP_STATE_INITEND;
}

CLogo::~CLogo(){
}
/*
void CLogo::Input( CInput& rInput, const float fElapsedTime, APPLI_MODE& rNextMode )
{
	if( rInput.IsKeyPush( KEY_OK ) || timeCounter > 5.0f ){ // ïb
		rNextMode = APPLI_MODE_TITLE;
	}
}
*/
void CLogo::move(const GLfloat elapsedTime, APP_MODE& rNextMode){
	pTransition->move(elapsedTime);
	if(pTransition->getState() == TRANSITION_STATE_NONE){
		timeCounter += elapsedTime;
		if(timeCounter > 5.0f){
			pTransition->setState(TRANSITION_STATE_FADEOUT);
			rNextMode = APP_MODE_TITLE;
		}
	}
}

void CLogo::draw(){
//	drawTexture(0.0f, 0.0f, 1.0f, 1.0f, bgTex, 255, 255, 255, 255);
		//	drawSquare();
//	pBG->Draw( pd3dDevice, pBGTex->GetTex(), 0 );
	pTransition->draw();
}

void CLogo::input(const InputType type, const ClickPos pos, APP_MODE& rNextMode){
	pTransition->setState(TRANSITION_STATE_FADEOUT);
	rNextMode = APP_MODE_TITLE;
}
