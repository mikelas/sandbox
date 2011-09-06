/*
 *  Transition.cpp
 *  cuboid
 *
 *  Created by mikelas on 10/12/19.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Transition.h"

CTransition::CTransition() : alpha(255.0f){
	state = TRANSITION_STATE_FADEIN;
}

CTransition::~CTransition(){
}

void CTransition::move(const GLfloat elapsedTime){
	switch(state){
	case TRANSITION_STATE_FADEIN:
		alpha -= elapsedTime * 255;
		if(alpha < 0.0f){
			alpha = 0.1f;
			state = TRANSITION_STATE_NONE;
		}
		break;
	case TRANSITION_STATE_FADEOUT:
		alpha += elapsedTime * 255;
		if(alpha > 255.0f){
			alpha = 255.1f;
			state = TRANSITION_STATE_END;
		}
		break;
	default:
		break;
	}
}

void CTransition::draw(){
//	drawRectangle(0.0f, 0.0f, 2.0f, 3.0f, 0, 0, 0, (int)alpha);
}

