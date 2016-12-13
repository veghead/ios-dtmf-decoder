//
//  MasterViewController.m
//  dtmfdecode
//
//  Created by Veghead on 11/26/16.
//
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    [[self lcdView] setLCDString:[self.decoder getDetectBuffer]];
    
    UIViewController *settingsVC = [[UIViewController alloc] initWithNibName:@"settings" bundle:nil];
    [settingsVC loadView];
    [self setSettingsViewController:settingsVC];
    [(settings *)settingsVC.view setMasterController:(id *)self];
    [(settings *)settingsVC.view setup];
    [settingsVC release];
    
    [[textView layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[textView layer] setBorderWidth:2.5];
    [[textView layer] setCornerRadius:5];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(tick:) userInfo:self repeats:YES];
}



- (void)tick:(NSTimer *)timer
{
    [self.lcdView setLCDString:[self.decoder getDetectBuffer]];
    //NSLog(@" buffer:%s", [self.decoder getDetectBuffer]);
    [self.lcdView setLEDs:[self.decoder ledbin]];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)flipToSettings {
    settings *settingsView = (settings *)self.settingsViewController.view;
    [settingsView setFrame:[self.view frame]];
    [settingsView setPowerMethod:[self.decoder getPowerMethod]];
    [settingsView setNoiseLevel:[self.decoder getNoiseLevel]];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [self.settingsViewController viewWillAppear:YES];
    [self viewWillDisappear:YES];
    [self.view addSubview:settingsView];
    [self viewDidDisappear:YES];
    [self.settingsViewController viewDidAppear:YES];
    [UIView commitAnimations];
}

- (IBAction) powerSwitch
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
    settings *settingsView = (settings *)self.settingsViewController.view;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [self.settingsViewController viewWillDisappear:YES];
    [self viewWillAppear:YES];
    [settingsView removeFromSuperview];
    [self.settingsViewController viewDidDisappear:YES];
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

- (void)dealloc {
    [super dealloc];
}


@end
