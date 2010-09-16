//
//  AuthorDetailEditorController.h
//  Researchr
//
//  Created by Nami on 9/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AuthorDetailEditorController : UIViewController {
	
	UILabel *labelFirstName;
	UILabel *labelLastName;
	UILabel *labelAbout;
	
	UITextField *textFieldFirstName;
	UITextField *textFieldLastName;
	UITextField *textFieldAbout;
	
	UIButton *buttonSubmit;
}

@property (nonatomic, retain) IBOutlet UILabel *labelFirstName;
@property (nonatomic, retain) IBOutlet UILabel *labelLastName;
@property (nonatomic, retain) IBOutlet UILabel *labelAbout;

@property (nonatomic, retain) IBOutlet UITextField *textFieldFirstName;
@property (nonatomic, retain) IBOutlet UITextField *textFieldLastName;
@property (nonatomic, retain) IBOutlet UITextField *textFieldAbout;

@property (nonatomic, retain) IBOutlet UIButton *buttonSubmit;

-(UILabel*) initLabel:(int)index;
-(UITextField*) initTextField:(int)index;
-(UIButton*) initSubmitButton:(int)index;
-(void) createFirstNameInput:(int)index;
-(void) createLastNameInput:(int)index;
-(void) createAboutInput:(int)index;
-(void) createSubmitButton:(int)index;
-(void) createViews;
-(IBAction) submit: (id)sender;

@end
