/*
 *  Title.cpp
 *  cuboid
 *
 *  Created by mikelas on 10/11/23.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Title.h"

CTitle::CTitle() : CBaseScene(), counter(0.0f){
	appState = APP_STATE_INITEND;

	GLfloat qty = 512.f;
	ballQty = (GLint)qty;

	for(GLint i = 1; i <= ballQty; ++i){
		POS pos;
		pos.speed = i / qty;
		posList.push_back(pos);
	}

	pTitleSelect = new CTitleSelect();
}

CTitle::~CTitle(){
	SAFE_DELETE(pTitleSelect);
}

void CTitle::move(const GLfloat elapsedTime, APP_MODE& rNextMode){
	pTransition->move(elapsedTime);
	counter += elapsedTime;
	GLfloat radian = counter * 3.14159265f;
	posX = sinf(radian) * 1.0f;
	posY = cosf(radian) * 1.0f;
	list<POS>::iterator ite;
	for(ite = posList.begin(); ite != posList.end(); ++ite){
		GLfloat r = radian * (*ite).speed;
		(*ite).posX = sinf(r) * (*ite).speed;
		(*ite).posY = cosf(r) * (*ite).speed;
	}
	pTitleSelect->move(elapsedTime, rNextMode);
}

void CTitle::draw(){
//	drawCircle(posX, posY, 60, 0.5f, 255, 255, 255, 255);
	for(list<POS>::iterator ite = posList.begin(); ite != posList.end(); ++ite){
//		drawCircle((*ite).posX, (*ite).posY, 60, 0.005f, 255, 255, 255, 255);
	}
	pTitleSelect->draw();
	pTransition->draw();
}

void CTitle::input(const InputType type, const ClickPos pos, APP_MODE& rNextMode){
	pTitleSelect->input(type, pos, rNextMode);
}
