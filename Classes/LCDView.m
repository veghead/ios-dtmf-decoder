/*
 
 $Id: LCDView.m 125 2010-09-19 00:01:02Z veg $
 
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

#import "LCDView.h"
#import "LCDChar.h"


@implementation LCDView

static LCDChar *disp[LCD_COLS];

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        // Create LCD characters
        for (long viewId = 0 ; viewId < LCD_COLS ; viewId++) {
            LCDChar *cr = [[LCDChar alloc] initWithFrame:CGRectMake((13 * viewId) + 8, 26, 0, 0)];
            [cr setChar:'A'];
            [self addSubview:cr];
            disp[viewId] = cr;
        }
    }
    return self;
}


- (void)setLCDString:(char*)content {
	if (strlen(content) > LCD_COLS) {
		content = content + (strlen(content)-LCD_COLS);
	}
	//NSLog(@"LCDString %d len",strlen(content));
	for (int in = 0; in < LCD_COLS; in++) {
		[disp[in] setChar:*content];
		if (*content) content++;
	}
}


- (void)setLEDs:(int)bin {
	UIImageView *disp[8] = {la,lb,lc,ld,le,lf,lg,lh};
	for (int in = 0; in < 8; in++) {
		bool onoff = (0 == (bin & 1));
		[disp[in] setHidden:onoff];
		bin >>= 1;	
	}	
}


- (void)drawRect:(CGRect)rect {
    // Drawing code goes here
}


- (void)dealloc {
    [super dealloc];
}


@end
