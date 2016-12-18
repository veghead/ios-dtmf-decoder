/*
Dreadtech DTMF Decoder - Copyright 2016 Martin Wellard

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
    } else {
        [self setImage:nil];
    }
}

@end
