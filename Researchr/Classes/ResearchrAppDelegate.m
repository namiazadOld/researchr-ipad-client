//
//  ResearchrAppDelegate.m
//  Researchr
//
//  Created by Nami on 9/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ResearchrAppDelegate.h"


@implementation ResearchrAppDelegate

@synthesize authorDetailController;
@synthesize authorDetailEditorController;
@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
	
	//AuthorDetailController *adc = [[[AuthorDetailController alloc] init] autorelease];
	//[self setAuthorDetailController: adc];
	//[adc release];
	
	//UIView * controllersView = [authorDetailController view];
	//[window addSubview:controllersView];
	
	
	AuthorDetailEditorController *adec = [[[AuthorDetailEditorController alloc] initWithNibName:@"AuthorDetailEditorController" bundle:[NSBundle mainBundle]] autorelease];
	[self setAuthorDetailEditorController:adec];
	UIView *adecView = [authorDetailEditorController view];
	[window addSubview:adecView];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[authorDetailController release];
    [window release];
    [super dealloc];
}


@end
