    //
//  AuthorDetailEditorController.m
//  Researchr
//
//  Created by Nami on 9/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AuthorDetailEditorController.h"
#import "Sqlite.h"


@implementation AuthorDetailEditorController

@synthesize labelFirstName;
@synthesize labelLastName;
@synthesize labelAbout;

@synthesize textFieldFirstName;
@synthesize textFieldLastName;
@synthesize textFieldAbout;

@synthesize buttonSubmit;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


-(UILabel*) initLabel:(int)index{
	CGRect frameLabel = CGRectMake(60.0, index*60.0, 100.0, 31.0);
	UILabel *aLabel = [[UILabel alloc] initWithFrame:frameLabel];
	return aLabel;
}

-(UITextField*) initTextField: (int) index{
	
	CGRect frameText = CGRectMake(180.0, index*60.0, 250.0, 31.0);
	UITextField *aTextField = [[UITextField alloc] initWithFrame:frameText];
	
	aTextField.textAlignment = UITextAlignmentLeft;
	aTextField.borderStyle = UITextBorderStyleRoundedRect;
	aTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
	aTextField.keyboardType = UIKeyboardTypeDefault;
	aTextField.returnKeyType = UIReturnKeyDone;
	
	return aTextField;
}

-(IBAction) submit: (id)sender
{
	NSString* db = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"researchr.sql"]; 
	Sqlite* database = [[Sqlite alloc] init];
	[database open:db];
	
	[database beginTransaction];
	[database executeQuery:@"INSERT INTO author (firstName, lastName, about) VALUES (?, ?, ?);", textFieldFirstName.text, textFieldLastName.text, textFieldAbout];
	[database commit];
	
	NSArray* results = [database executeQuery:@"SELECT * FROM author;"];
	for (NSDictionary *row in results)
	{
		NSString *firstName = [row valueForKey:@"firstName"];
		NSLog(firstName);
	}
	
	[database release];
}

-(UIButton*) initSubmitButton: (int) index{
	
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[aButton setTitle:@"Submit" forState:UIControlStateNormal];
	aButton.frame = CGRectMake(60.0, index*60.0, 80.0, 31.0);
	[aButton addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
	return aButton;
}

-(void) createFirstNameInput:(int)index{
	
	self.labelFirstName = [self initLabel:index];
	self.labelFirstName.text = @"First Name: ";
		
	self.textFieldFirstName = [self initTextField:index];
		
	[self.view addSubview:self.labelFirstName];
    [self.view addSubview:self.textFieldFirstName];
}

-(void) createLastNameInput:(int)index{
	
	self.labelLastName = [self initLabel:index];
	self.labelLastName.text = @"Last Name: ";
	
	self.textFieldLastName = [self initTextField:index];
	
	[self.view addSubview:self.labelLastName];
    [self.view addSubview:self.textFieldLastName];
}

-(void) createAboutInput:(int)index{
	
	self.labelAbout = [self initLabel:index];
	self.labelAbout.text = @"About: ";
	
	self.textFieldAbout = [self initTextField:index];
	
	[self.view addSubview:self.labelAbout];
    [self.view addSubview:self.textFieldAbout];
}

-(void) createSubmitButton:(int)index{
	self.buttonSubmit = [self initSubmitButton:index];
	[self.view addSubview:self.buttonSubmit];
}



-(id)init{
	return self;
}


-(void) createViews{
	
	[self createFirstNameInput:1];
	[self createLastNameInput:2];
	[self createAboutInput:3];
	[self createSubmitButton:4];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[self createViews];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
