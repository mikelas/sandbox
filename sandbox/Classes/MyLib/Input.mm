/*
 *  Input.mm
 *  cuboid
 *
 *  Created by mikelas on 11/06/05.
 *  Copyright 2011 GTE. All rights reserved.
 *
 */

#include "Input.h"

CInput::CInput(){
}

CInput::~CInput(){
	logList.clear();
}

void CInput::input(const InputType type, const ClickPos pos){
	switch (type) {
		case TOUCHE_BEGAN:
		case TOUCHE_MOVED:
			logList.push_back(pos);
			break;
		case TOUCHE_ENDED:
			logList.push_back(pos);
			logList.clear();
			break;
		case TOUCHE_CANCELLED:
			break;
		default:
			NSLog(@"CInput.input : これ何の入力よ？");
			assert(0);
			break;
	}
}

ClickVec CInput::diffFirst(const ClickPos pos){
	list<ClickPos>::iterator ite = logList.begin();
	ClickVec v;
	v.x = (*ite).x - pos.x;
	v.y = (*ite).y - pos.y;
	return v;
}

ClickVec CInput::diffPrev(const ClickPos pos){
	list<ClickPos>::iterator ite = --logList.end();
	ClickVec v;
	v.x = (*ite).x - pos.x;
	v.y = (*ite).y - pos.y;
	return v;
}
