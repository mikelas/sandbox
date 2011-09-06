/*
 *  AppMgr.h
 *  cuboid
 *
 *  Created by mikelas on 10/10/31.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "Logo.h"
#include "Title.h"
#include <CoreFoundation/CoreFoundation.h>

class CAppMgr{
private:
	APP_MODE nextMode;
	CBaseScene* pApp;
	CBaseScene* pNextApp;
	double beforeTime;
	double timeCounter;
	GLint frame;
	
private:
	CAppMgr();
	CAppMgr(const CAppMgr& rhs);
	CAppMgr& operator=(const CAppMgr& rhs);

	void changeApp(APP_MODE& rNextMode);
	
public:
	~CAppMgr();
	static CAppMgr* GetInstance() {
		static CAppMgr instance;
		return &instance;
	}
	
	// void Input(const float fElapsedTime);
	void move();
	void draw();
	void input(const InputType type, const ClickPos pos);
};