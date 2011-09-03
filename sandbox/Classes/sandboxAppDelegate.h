//
//  sandboxAppDelegate.h
//  sandbox
//
//  Created by mikelas on 11/09/04.
//  Copyright GTE 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAGLView;

@interface sandboxAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;

@end

