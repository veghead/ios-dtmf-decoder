/*
 $Id: settings.m 116 2010-06-27 18:14:08Z veg $
 
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

#import "settings.h"


@implementation settings
@synthesize masterController, switchState;


- (void)setup {
	powerMethods = [@[@"Peak Value RMS", @"Sqrt Sum Squares", @"Sum Abs"] retain];
}


- (void)drawRect:(CGRect)rect {
	[self setSwitchState:1];
}


- (void)dealloc {
	[powerMethods release];
	[super dealloc];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
	return [powerMethods count];
}



- (NSString *)pickerView:(UIPickerView *)pickerView
			 titleForRow:(NSInteger)row
			forComponent:(NSInteger)component
{
	return powerMethods[row];
}



- (void)pickerView:(UIPickerView *)pickerView
	  didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component
{
	
}


- (IBAction) flipBack
{
	NSLog(@"flipBack");
	[(dtmfdecodeViewController *) masterController setNoiseLevel:[backgroundLevel value]];
	[(dtmfdecodeViewController *) masterController setPowerMethod:[powerPicker selectedRowInComponent:0]];
	[(dtmfdecodeViewController *) masterController flipBack];
}

- (IBAction) resetDefaults
{
	NSLog(@"reset");
	[backgroundLevel setValue:0.5 animated:false];
	[powerPicker selectRow:1 inComponent:0 animated:false];
}

- (void) setPowerMethod:(NSInteger)method
{
	NSLog(@"setPowerMethod %ld",(long)method);
	[powerPicker selectRow:method inComponent:0 animated:false];
}


- (void) setNoiseLevel:(float)level
{
	NSLog(@"setNoiseLevel %f",level);
	[backgroundLevel setValue:level animated:false];
}





@end
