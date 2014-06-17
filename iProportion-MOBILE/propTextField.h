//
//  propTextField.h
//  iProportion-MOBILE
//
//  Created by invader on 17/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface propTextField : UITextField {
	int identifier;
	BOOL editIcs;
	UIView* customKeyboard;
	
}
@property(nonatomic) int  identifier; 
@property(nonatomic) BOOL editIcs; 
@property(nonatomic, retain) UIView* customKeyboard;
-(void) becomeFirstResponder;
-(propTextField*)initWithCustomKeyboard:(UIView*) cK andId:(int)ident;
- (BOOL) canBecomeFirstResponder;
-(void)moveCursorToRight;
-(void)moveCursorToLeft;
-(void) addText:(NSString*)str;
-(void) deleteOneCharacter;
-(int)getCursorPosition;
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender;
-(void)changeSign;
@end
