//
//  LCDChar.m
//  dtmfdecode
//
//  Created by Veghead on 12/4/16.
//
//

#define CHAR_WIDTH  10
#define CHAR_HEIGHT 14
#import "LCDChar.h"

@implementation LCDChar

- (LCDChar *)initWithFrame:(CGRect)rect
{
    CGRect charRect = rect;
    charRect.size = CGSizeMake(CHAR_WIDTH, CHAR_HEIGHT);
    return [super initWithFrame:charRect];
}

- (void)setChar:(char) chr
{
    if (isdigit(chr) || (chr == 'A') || (chr == 'B') || (chr == 'C') || (chr == 'D')
        || (chr == '*') || (chr == '#')) {
        char name[10];
        snprintf(name,9,"%c.png",chr);
        
        UIImage *img = [UIImage imageNamed:@(name)];
        [self setImage:img];
        [self setAlpha:0.779];
    }
}

@end
