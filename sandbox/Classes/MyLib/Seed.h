#ifndef __SEED_H_
#define __SEED_H_
/*
 *  Seed.h
 *  cuboid
 *
 *  Created by mikelas on 10/11/23.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "BaseScene.h"

class CSeed : public CBaseScene{
public:
	CSeed();
	~CSeed();
	
//	void Input( CInput& rInput, const float fElapsedTime, APPLI_MODE& rNextMode );
	void move(const GLfloat elapsedTime, APP_MODE& rNextMode);
	void draw();
	void input(const InputType type, const ClickPos pos, APP_MODE& rNextMode);
};


#endif
