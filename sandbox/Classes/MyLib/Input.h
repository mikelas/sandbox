#ifndef __INPUT_H_
#define __INPUT_H_

/*
 *  Input.h
 *  cuboid
 *
 *  Created by mikelas on 11/06/05.
 *  Copyright 2011 GTE. All rights reserved.
 *
 */

#include "Fixed.h"
#include <list>
using namespace std;

enum InputType {
	TOUCHE_BEGAN,
	TOUCHE_MOVED,
	TOUCHE_ENDED,
	TOUCHE_CANCELLED,
	INPUTTYPE_NUM
};

class CInput {
private:
	list<ClickPos> logList;

public:
	CInput();
	~CInput();

	void input(const InputType type, const ClickPos pos);
	// タップ開始時の位置情報との差分
	// toucheBegan内では使わない
	ClickVec diffFirst(const ClickPos pos);
	// １つ前の位置情報との差分
	// toucheBegan内では使わない
	ClickVec diffPrev(const ClickPos pos);
};

#endif

