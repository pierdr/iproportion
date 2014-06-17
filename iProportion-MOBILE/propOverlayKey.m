//
//  propOverlayKey.m
//  iProportion-MOBILE
//
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.
//

#import "propOverlayKey.h"


@implementation propOverlayKey
@synthesize overlayImg;
@synthesize overlayTxt;
@synthesize isLandscape;


- (void)dealloc {
    [super dealloc];
}
-(void)showOnIndex:(int)index{

	self.hidden=NO;
	self.overlayTxt.text=[NSString stringWithFormat:@"%d",index];
	int offset=21;
    int widthIfLandscape=0;
    int justForZero=0;
	if(index==0)
	{
		UIImage* imgTmp=[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"key_pressed_right" ofType:@"png"]];
		self.overlayImg.image=imgTmp;
		self.overlayTxt.textAlignment=UITextAlignmentLeft;
		index=10;
		offset=23;
        if(isLandscape)
        {
            offset+=4;
            widthIfLandscape=10;
            justForZero=11;
        }
	}
	else if(index==1)
	{
		UIImage* imgTmp=[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"key_pressed_left" ofType:@"png"]];
		self.overlayImg.image=imgTmp;
		self.overlayTxt.textAlignment=UITextAlignmentRight;
		offset=19;
        if(isLandscape)
        {
            offset-=4;
             widthIfLandscape=10;
        }
	}
	else {
		UIImage* imgTmp=[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"key_pressed" ofType:@"png"]];
		self.overlayImg.image=imgTmp;
		self.overlayTxt.textAlignment=UITextAlignmentCenter;
	}
	int unit=32;
	int he=132;
    int y=1;
	if(isLandscape)
	{
        y=0;
		he=110;
		unit=48;
		offset-=8;
	}
	self.frame= CGRectMake(((index-1)*unit)-offset, y, self.frame.size.width, he);
    
	self.overlayImg.frame=CGRectMake(-widthIfLandscape+justForZero, 0, self.frame.size.width+abs(widthIfLandscape), he);
	
}


@end
