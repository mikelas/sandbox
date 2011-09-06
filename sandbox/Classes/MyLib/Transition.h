#ifndef __TRANSITION_H_
#define __TRANSITION_H_
/*
 *  Transition.h
 *  cuboid
 *
 *  Created by mikelas on 10/12/19.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Fixed.h"
//#include "graphicUtil.h"

enum TRANSITION_STATE{
	TRANSITION_STATE_NONE,
	TRANSITION_STATE_FADEIN,
	TRANSITION_STATE_FADEOUT,
	TRANSITION_STATE_END
};

class CTransition{
private:
	TRANSITION_STATE state;
	GLfloat alpha;
public:
	CTransition();
	~CTransition();

	void setState(TRANSITION_STATE state) { this->state = state; }
	TRANSITION_STATE getState() const { return state; }
	void move(const GLfloat elapsedTime);
	void draw();
};

#endif
