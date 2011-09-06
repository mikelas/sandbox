/*
 *  AppMgr.cpp
 *  cuboid
 *
 *  Created by mikelas on 10/10/31.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include "AppMgr.h"

CAppMgr::CAppMgr() : 
	nextMode(APP_MODE_NULL),
	pNextApp(NULL),
	frame(0),
	beforeTime(0.0f),
	timeCounter(0.0f){

	NSLog(@"Do init : AppMgr");
	pApp = new CLogo();
	assert(pApp);
}

CAppMgr::~CAppMgr(){
	NSLog(@"Do release : AppMgr");
	while(pApp->getAppState() == APP_STATE_INITSTART){
	}
	SAFE_DELETE(pApp);
	SAFE_DELETE(pNextApp);
}

void CAppMgr::move(){
    double nowTime = CFAbsoluteTimeGetCurrent();
    double elapsedTime = nowTime - beforeTime;
	timeCounter += elapsedTime;
	beforeTime = nowTime;
	++frame;
	if(timeCounter > 1.0f){
		NSLog(@"%3.1ffps\n", ((double)frame / timeCounter));
		timeCounter = 0.0f;
		frame = 0;
	}
	
	switch(pApp->getAppState()){
	case APP_STATE_INITEND:	// ÉAÉvÉäÉPÅ[ÉVÉáÉìÇÃì«Ç›çûÇ›Ç™èIÇÌÇ¡ÇΩèÍçá
/*		switch( pDrawObject->GetFadeMode() ){
		case FADEMODE_FADEOUT_END:
			pDrawObject->SetFadeMode( FADEMODE_FADEIN );
			pAppliBase->SetAppliState( APPLI_STATE_NORMAL );
			break;
		default:
			pDrawObject->SetFadeMode( FADEMODE_FADEOUT );
			break;
		}*/
		pApp->setAppState(APP_STATE_NORMAL);
		break;
	case APP_STATE_NORMAL:	// ÉAÉvÉäÉPÅ[ÉVÉáÉìÇ™ïÅí Ç…ìÆÇ¢ÇƒÇ¢ÇÈèÍçá
		pApp->move(elapsedTime, nextMode);
		if(pApp->getTransitionState() == TRANSITION_STATE_END){
			SAFE_DELETE(pApp);
			pApp = pNextApp;
			pNextApp = NULL;
			if(pApp->getAppState() != APP_STATE_INITEND){
//				pDrawObject->SetFadeMode( FADEMODE_FADEIN);
			}
		}
		if(nextMode != APP_MODE_NULL){
			changeApp(nextMode);
//			pDrawObject->SetFadeMode( FADEMODE_FADEOUT );
		}
		break;
	}
}

void CAppMgr::draw(){
	pApp->draw();
}

void CAppMgr::changeApp(APP_MODE& rNextMode){
	switch(rNextMode){
	case APP_MODE_LOGO:
		NSLog(@"ChangeAppMode next : LOGO");
		pNextApp = new CLogo();
		break;
	case APP_MODE_TITLE:
		NSLog(@"ChangeAppMode next : TITLE");
		pNextApp = new CTitle();
		break;
/*	case APP_MODE_CHANGETEX:
		pNextAppliBase = new CChangeTex( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_METABALL:
		pNextAppliBase = new CMetaBall( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_LINEEFFECT:
		pNextAppliBase = new CLineEffect( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_LIGHTNING:
		pNextAppliBase = new CLightning( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_TREE2D:
		pNextAppliBase = new CTree2D( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_ARTCUBE:
		pNextAppliBase = new CArtCube( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_MOVEBOX:
		pNextAppliBase = new CMoveBox( pMultiThread, pd3dDevice );
		break;
	case APPLI_MODE_METABALLWATER:
		pNextAppliBase = new CMetaBallWater( pMultiThread, pd3dDevice );
		break;*/
	case APP_MODE_EXIT:
		NSLog(@"ChangeAppMode next : EXIT");
		exit(0);
		break;
	default:
		NSLog(@"ChangeAppMode next : ERROR");
		assert(0);
		break;
	}
	rNextMode = APP_MODE_NULL;
}

void CAppMgr::input(const InputType type, const ClickPos pos){
#ifdef INPUTLOG
	NSLog(@"touche:%d X:%4.3f Y:%4.3f\n", type, pos.x, pos.y);	
#endif
	pApp->input(type, pos, nextMode);
	if(nextMode != APP_MODE_NULL && pNextApp == NULL){
		changeApp(nextMode);
//		pDrawObject->SetFadeMode( FADEMODE_FADEOUT );
	}
}
