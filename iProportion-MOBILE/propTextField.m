//
//  propTextField.m
//  iProportion-MOBILE
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.

#import "propTextField.h"


@implementation propTextField
@synthesize identifier;
@synthesize editIcs;
@synthesize customKeyboard;

-(propTextField*)initWithCustomKeyboard:(UIView*) cK andId:(int)ident {
	identifier=ident;
	editIcs=NO;
	super.inputView=cK;
	customKeyboard=cK;
	return self;
}
-(void) becomeFirstResponder{
	[super becomeFirstResponder];
}
- (BOOL) canBecomeFirstResponder {
	
	
	return YES;
}
- (void) moveCursorToRight{
	
    NSRange selectedRange = [[self valueForKey:@"selectionRange"] rangeValue];
    if (selectedRange.location != NSNotFound) {
        if (selectedRange.length > 0) {
            selectedRange.location = NSMaxRange(selectedRange);
            selectedRange.length = 0;
        }else if (selectedRange.location < self.text.length) {
            selectedRange.location += 1;
        }
        [self setValue:[NSValue valueWithRange:selectedRange] forKey:@"selectionRange"];
    }
}
- (void) moveCursorToLeft{
	
    NSRange selectedRange = [[self valueForKey:@"selectionRange"] rangeValue];
    if (selectedRange.location != NSNotFound) {
        if (selectedRange.length > 0) {
            selectedRange.length = 0;
        }else if (selectedRange.location > 0) {
            selectedRange.location -= 1;
        }
        [self setValue:[NSValue valueWithRange:selectedRange] forKey:@"selectionRange"];
    }
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(paste:))
    {
        return YES;
    }
    else {
        return NO;
    }
    
}

-(void) addText:(NSString*)str{
    
    
	//select the text and find where the cursor is at the moment
	NSMutableString *text = [self.text mutableCopy];	
	if(text.length<9)
    {
        NSRange selectedRange = [[self valueForKey:@"selectionRange"] rangeValue];
        //add the text in the range
        
        [text replaceCharactersInRange:selectedRange withString:str];
        self.text = text;
        selectedRange.location += 1;
        [self setValue:[NSValue valueWithRange:selectedRange] forKey:@"selectionRange"];
	}
    [text release];
    
}
-(void) deleteOneCharacter{
	//select the text and find where the cursor is at the moment
	NSMutableString *text = [self.text mutableCopy];	
	NSRange selectedRange = [[self valueForKey:@"selectionRange"] rangeValue];
	//add the text in the range
	if([self.text length]>0)
	{
		
		
		if(selectedRange.length==0 && selectedRange.location!=0)
		{
			selectedRange.location-=1;
			selectedRange.length+=1;
		}
        
		[text replaceCharactersInRange:selectedRange withString:@""];
		self.text = text;
		selectedRange.length=0;
		[self setValue:[NSValue valueWithRange:selectedRange] forKey:@"selectionRange"];
		[text release];
		
	}	
}
-(void)changeSign{
    NSMutableString*strTmp=[[NSMutableString alloc]initWithFormat: self.text];
    NSRange minusRangeTmp=[strTmp rangeOfString:@"-"];
    if(minusRangeTmp.length==0)
    {
        
        [strTmp insertString:@"-" atIndex:0];
        self.text=strTmp;
    }
    else {
        
        
        NSRange selectedRange=NSMakeRange (0, 1);
        [strTmp replaceCharactersInRange:selectedRange withString: @""];
        self.text=strTmp;
    }
}
-(int)getCursorPosition{
	
	NSRange selectedRange = [[self valueForKey:@"selectionRange"] rangeValue];
	return selectedRange.location;
}
-(NSString*)getXValueAsString{
	if(self.editIcs)
	{
		return self.text;
	}
	else {
		return @"";
	}
    
}

@end
