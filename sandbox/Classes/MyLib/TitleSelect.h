#ifndef __TITLESELECT_H_
#define __TITLESELECT_H_

/*
 *  TitleSelect.h
 *  cuboid
 *
 *  Created by mikelas on 11/06/07.
 *  Copyright 2011 GTE. All rights reserved.
 *
 */

#import "Fixed.h"
//#include "graphicUtil.h"
#include "Input.h"

class CTitleSelect {
private:
	enum MODE{
		TITLESELECT_UP = -1,
		TITLESELECT_STOP,
		TITLESELECT_DOWN
	};
	enum TITLESELECT_SE{
		TITLESELECTSE_OK,
		TITLESELECTSE_CANSEL,
		TITLESELECTSE_MOVE
	};

	struct POS {
		GLfloat x;
		GLfloat y;
	};
	
	MODE mode;
	// 円の中心位置
	GLfloat centerPosX, centerPosY;
	// 半径
	GLfloat dist;
	GLfloat angle, angleCount, moveLimit;
	// 選択しているMODE
	int selectMode;
	// 選択円の大きさ
	GLfloat size;
	
	POS* pObjects[APP_MODE_NUM];

	CInput* pInput;

public:
	CTitleSelect();
	~CTitleSelect();
	
	void move(const GLfloat elapsedTime, APP_MODE& rNextMode);
	void draw();
	void input(const InputType type, const ClickPos pos, APP_MODE& rNextMode);
};


#endif