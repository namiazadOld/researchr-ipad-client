//
//  ResearchrAppDelegate.h
//  Researchr
//
//  Created by Nami on 9/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AuthorDetailController;
@class AuthorDetailEditorController;

@interface ResearchrAppDelegate : NSObject <UIApplicationDelegate> {
	AuthorDetailEditorController* authorDetailEditorController;
	AuthorDetailController* authorDetailController;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AuthorDetailController *authorDetailController;
@property (nonatomic, retain) IBOutlet AuthorDetailEditorController *authorDetailEditorController;

@end

