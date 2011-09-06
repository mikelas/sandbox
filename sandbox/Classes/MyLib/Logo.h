#ifndef __LOGO_H_
#define __LOGO_H_
/*
 *  Logo.h
 *  cuboid
 *
 *  Created by mikelas on 10/11/21.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "BaseScene.h"

class CLogo : public CBaseScene{
private:
	float timeCounter;
	GLuint bgTex;
	
public:
	CLogo();
	~CLogo();
	
	
//	void Input( CInput& rInput, const float fElapsedTime, APPLI_MODE& rNextMode );
	void move(const GLfloat elapsedTime, APP_MODE& rNextMode);
	void draw();
	void input(const InputType type, const ClickPos pos, APP_MODE& rNextMode);
};


#endif
