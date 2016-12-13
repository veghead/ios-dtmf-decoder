//
//  LCDChar.h
//  dtmfdecode
//
//  Created by Veghead on 12/4/16.
//
//

#import <UIKit/UIKit.h>
#define CHAR_WIDTH  10
#define CHAR_HEIGHT 14

@interface LCDChar : UIImageView

- (void)setChar:(char) chr;

@end
