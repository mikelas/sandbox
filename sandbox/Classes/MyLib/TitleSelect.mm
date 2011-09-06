/*
 *  TitleSelect.cpp
 *  cuboid
 *
 *  Created by mikelas on 11/06/07.
 *  Copyright 2011 GTE. All rights reserved.
 *
 */

#include "TitleSelect.h"

CTitleSelect::CTitleSelect() : 
	size(0.25f),
	selectMode(0),
	angle(0), angleCount(0), moveLimit(PI * 2.f / APP_MODE_NUM),
	mode(TITLESELECT_STOP){

	dist = (size * 2.f) / (2.f * sinf(PI / APP_MODE_NUM));
	centerPosX = -dist * 1.5f;
	for(int i = 0; i < APP_MODE_NUM; ++i){
		pObjects[i] = new POS;
		GLfloat a = moveLimit * i + angle;
		pObjects[i]->x = cos(a) * dist + centerPosX;
		pObjects[i]->y = sin(a) * dist + centerPosY;
	}
		
	pInput = new CInput();
}

CTitleSelect::~CTitleSelect(){
	for(int i = 0; i < APP_MODE_NUM; ++i){
		SAFE_DELETE(pObjects[i]);
	}
	SAFE_DELETE(pInput);
}

void CTitleSelect::move(const GLfloat elapsedTime, APP_MODE& rNextMode){
	if(mode == TITLESELECT_STOP){
		return;
	}
	angle += moveLimit * elapsedTime * mode * 2.f;
	angleCount += moveLimit * elapsedTime * 2.f;
	if(angleCount >= moveLimit){
		angle = selectMode * moveLimit;
		angleCount = 0;
//		pDrawStr->SetStr( pTitleName[ selectNum ] );
		mode = TITLESELECT_STOP;
	}
	for(int i = 0; i < APP_MODE_NUM; ++i){
		GLfloat a = moveLimit * i + angle;
		pObjects[i]->x = cos(a) * dist + centerPosX;
		pObjects[i]->y = sin(a) * dist + centerPosY;
	}
}

void CTitleSelect::draw(){
	for(int i = 0; i < APP_MODE_NUM; ++i){
//		drawCircle(pObjects[i]->x, pObjects[i]->y, 60, size, 255, 255, 255, 255);
	}
}

void CTitleSelect::input(const InputType type, const ClickPos pos, APP_MODE& rNextMode){
	switch (type) {
	case TOUCHE_MOVED:{
		ClickVec v = pInput->diffFirst(pos);
		if(v.y > 0){
			if(--selectMode < 0){
				selectMode = APP_MODE_NUM - 1;
			}
//			pDrawStr->SetStr( pTitleName[ APPLI_MODE_NUM ] );
//			pSound->PlaySE( TITLESELECTSE_MOVE );
			mode = TITLESELECT_DOWN;
		}
		else if(v.y < 0){
			if( ++selectMode >= APP_MODE_NUM ){
				selectMode = 0;
			}
//			pDrawStr->SetStr( pTitleName[ APPLI_MODE_NUM ] );
//			pSound->PlaySE( TITLESELECTSE_MOVE );
			mode = TITLESELECT_UP;
		}
		break;
	}
	default:
		break;
	}
	pInput->input(type, pos);
}
