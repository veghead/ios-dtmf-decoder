/*
 
 $Id: LCDView.h 116 2010-06-27 18:14:08Z veg $
 
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

#import <UIKit/UIKit.h>
#define LCD_COLS 15

@interface LCDView : UIView {
	IBOutlet UIImageView *modeDisplay;
	IBOutlet UIImageView *a;
	IBOutlet UIImageView *b;
	IBOutlet UIImageView *c;
	IBOutlet UIImageView *d;
	IBOutlet UIImageView *e;
	IBOutlet UIImageView *f;
	IBOutlet UIImageView *g;
	IBOutlet UIImageView *h;
	IBOutlet UIImageView *i;
	IBOutlet UIImageView *j;
	IBOutlet UIImageView *k;
	IBOutlet UIImageView *l;
	IBOutlet UIImageView *m;
	IBOutlet UIImageView *n;
	IBOutlet UIImageView *o;

	IBOutlet UIImageView *la;
	IBOutlet UIImageView *lb;
	IBOutlet UIImageView *lc;
	IBOutlet UIImageView *ld;
	IBOutlet UIImageView *le;
	IBOutlet UIImageView *lf;
	IBOutlet UIImageView *lg;
	IBOutlet UIImageView *lh;
}

- (void)setLCDString:(char*)content;
- (void)setLEDs:(int)bin;
- (UIImage *)charToImage:(char) c;
@end
