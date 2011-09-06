#ifndef __TITLE_H_
#define __TITLE_H_
/*
 *  Title.h
 *  cuboid
 *
 *  Created by mikelas on 10/11/23.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "BaseScene.h"
#include <List>
#include "Input.h"
#include "TitleSelect.h"

using namespace std;


class CTitle : public CBaseScene{
private:
	struct POS {
		GLfloat posX;
		GLfloat posY;
		GLfloat speed;
	};

	GLint ballQty;
	GLfloat counter;
	GLfloat posX, posY;
	list<POS> posList;

	
	CTitleSelect* pTitleSelect;

public:
	CTitle();
	~CTitle();
	
	void move(const GLfloat elapsedTime, APP_MODE& rNextMode);
	void draw();
	void input(const InputType type, const ClickPos pos, APP_MODE& rNextMode);
};


#endif
