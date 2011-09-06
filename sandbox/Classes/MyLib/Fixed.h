#ifndef __FIXED_H_
#define __FIXED_H_
/*
 *  Fixed.h
 *  cuboid
 *
 *  Created by mikelas on 10/11/10.
 *  Copyright 2010 GTE. All rights reserved.
 *
 */

#include <assert.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#define SAFE_DELETE(p) if(p){delete p; p = NULL;}
#define	SAFE_DELETE_ARRAY(p) if(p){delete [] p; p = NULL;}

#define PI 3.14159265

// #define INPUTLOG

enum APP_MODE{
	APP_MODE_NULL = -1,
	APP_MODE_LOGO,
	APP_MODE_TITLE,
	APP_MODE_STAGESELECT,
	APP_MODE_TEST1,
	APP_MODE_TEST2,
	APP_MODE_TEST3,
	APP_MODE_TEST4,
/*
	APP_MODE_TEST5,
	APP_MODE_TEST6,
	APP_MODE_TEST7,
	APP_MODE_TEST8,
//*/
	APP_MODE_EXIT,
	APP_MODE_NUM,
};


typedef struct ClickPos{
	GLfloat x;
	GLfloat y;
} ClickVec;
#endif
