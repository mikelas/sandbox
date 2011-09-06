#ifndef __BASESCENE_H_
#define __BASESCENE_H_
/*
 *  BaseScene.h
 *  cuboid
 *
 *  Created by mikelas on 10/11/10.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Fixed.h"
//#include "graphicUtil.h"
#include "Transition.h"
#include "Input.h"

enum APP_STATE{
	APP_STATE_NORMAL,
	APP_STATE_INITSTART,
	APP_STATE_INITEND,
	APP_STATE_DESTSTART,
	APP_STATE_DESTEND
};

class CBaseScene{
protected:
	APP_STATE appState;
	CTransition* pTransition;
	
public:
	CBaseScene() : appState(APP_STATE_INITSTART) {
		pTransition = new CTransition();
	};
	virtual ~CBaseScene() {
		SAFE_DELETE(pTransition);
	};
	
	void setAppState(APP_STATE appState) { this->appState = appState; }
	
	APP_STATE getAppState() const { return appState; }
	TRANSITION_STATE getTransitionState() const { return pTransition->getState(); }

	virtual void move(const GLfloat elapsedTime, APP_MODE& rNextMode) = 0;
	virtual void draw() = 0;
	virtual void input(const InputType type, const ClickPos pos, APP_MODE& rNextMode) = 0;
};


#endif
