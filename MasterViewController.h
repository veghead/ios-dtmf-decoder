//
//  MasterViewController.h
//  dtmfdecode
//
//  Created by Veghead on 11/26/16.
//
//

#import <UIKit/UIKit.h>
#import "LCDView.h"
#import "DTMFDecoder.h"
#import "settings.h"

@interface MasterViewController : UIViewController {
    IBOutlet UISwitch *powerOut;
    IBOutlet UILabel *powerLabel;
    IBOutlet LCDView *lcdView;
    char *lcdBuffer;
    int mode;
    NSData *data;
    DTMFDecoder *decoder;
    UIViewController *settingsViewController;
    UIPasteboard *uip;
}

- (IBAction) modeButtonPressed;
- (IBAction) sendButtonPressed;
- (IBAction) settingsButtonPressed;
- (IBAction) clearButtonPressed;
- (IBAction) flipBack;
- (IBAction) copyButtonPressed;
- (IBAction) powerSwitch;

- (void) flipToSettings;
- (void) tick: (NSTimer *)timer;
- (void) setNoiseLevel:(float) noiseLevel;
- (void) setPowerMethod:(NSInteger) method;

@property (nonatomic, retain)	UIViewController *settingsViewController;
@property (readwrite, retain)	DTMFDecoder *decoder;
@property (readwrite, assign)	NSData *data;
@property (readwrite, assign)	char *lcdBuffer;
@property (readwrite, assign)	LCDView *lcdView;
@end
