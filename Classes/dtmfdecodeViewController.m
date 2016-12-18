/*
 $Id: dtmfdecodeViewController.m 116 2010-06-27 18:14:08Z veg $
 
 Dreadtech DTMF Decoder - Copyright 2010 Martin Wellard
 
 This file is part of Dreadtech DTMF Decoder.
 
 Dreadtech DTMF Decoder is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 Dreadtech DTMF Decoder is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Dreadtech DTMF Decoder.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "dtmfdecodeViewController.h"
@implementation dtmfdecodeViewController

@synthesize lcdBuffer, data, decoder, settingsViewController;

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setNeedsLayout];
	DTMFDecoder *dec = [[DTMFDecoder alloc] init];
	[self setDecoder:dec];
	[(LCDView *)self.view setLCDString:[self.decoder getDetectBuffer]];
	UIViewController *settingsVC = [[UIViewController alloc] initWithNibName:@"settings" bundle:nil];
	[settingsVC loadView];
	[self setSettingsViewController:settingsVC];
	[(settings *)settingsVC.view setMasterController:(id *)self];
	[(settings *)settingsVC.view setup];
	[settingsVC release];
	
	[NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(tick:) userInfo:self repeats:YES];	
}



- (void)tick:(NSTimer *)timer
{
	[(LCDView *)self.view setLCDString:[self.decoder getDetectBuffer]];
	//NSLog(@" buffer:%s", [self.decoder getDetectBuffer]);
	[(LCDView *)self.view setLEDs:[self.decoder ledbin]];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)flipToSettings {
	settings *settingsView = (settings *)settingsViewController.view;
	//[settingsView setBackgroundColor:[UIColor viewFlipsideBackgroundColor]];
	[settingsView setPowerMethod:[self.decoder getPowerMethod]];
	[settingsView setNoiseLevel:[self.decoder getNoiseLevel]];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
	[settingsViewController viewWillAppear:YES];
	[self viewWillDisappear:YES];
	[self.view addSubview:settingsView];
	[self viewDidDisappear:YES];
	[settingsViewController viewDidAppear:YES];
	[UIView commitAnimations];
}

- (void)dealloc {
    [super dealloc];
}

- (IBAction) modeButtonPressed
{
}

- (IBAction) sendButtonPressed 
{
}

- (IBAction) settingsButtonPressed 
{
	NSLog(@"SETUP");
	[self flipToSettings];
}


- (IBAction) clearButtonPressed
{
	NSLog(@"clear pressed");
	[self.decoder resetBuffer];
}


- (IBAction) copyButtonPressed
{
	NSLog(@"copy pressed");
	[self.decoder copyBuffer];
}


- (IBAction) flipBack
{
	NSLog(@"flipBack");
	settings *settingsView = (settings *)settingsViewController.view;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
	[settingsViewController viewWillDisappear:YES];
	[self viewWillAppear:YES];
	[settingsView removeFromSuperview];
	[settingsViewController viewDidDisappear:YES];
	[self viewDidAppear:YES];
	[UIView commitAnimations];
}


- (void) setNoiseLevel:(float)noiseLevel
{
	[self.decoder setNoiseLevel:noiseLevel];
}

- (void) setPowerMethod:(NSInteger)method
{
	[self.decoder setPowerMethod:method];
}
@end
