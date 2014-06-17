//
//  iProportion_MOBILEViewController.m
//  iProportion-MOBILE
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.
//
#import "propTextField.h"
#import "iProportion_MOBILEViewController.h"

#import "propOverlayKey.h"

@implementation iProportion_MOBILEViewController
@synthesize text1;
@synthesize text2;
@synthesize reset1;
@synthesize text3;
@synthesize text4;
@synthesize sfondo;
@synthesize info;
@synthesize on;
@synthesize ics;
@synthesize infoLink;
@synthesize globalArray;
@synthesize devSite;
@synthesize sitePage;
@synthesize customKeyboard;
@synthesize overlayKey;
@synthesize minus;
@synthesize point;
@synthesize notifyCopyView;
@synthesize timer;
@synthesize timCancel;
@synthesize cancButton;
@synthesize copiedToClip;
@synthesize deletePortrait;
@synthesize deleteLandscape;
@synthesize minus_plus_landscape;
@synthesize minus_plus_portrait;


- (void)viewDidUnload {

}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	return YES;
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	
	if(toInterfaceOrientation!=UIInterfaceOrientationPortrait && toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown)
	{
        //carica immagine Landscape
		text1.frame=CGRectMake( 10,40, 100, 31);
		text2.frame=CGRectMake( 130,40,100, 31);
		text3.frame=CGRectMake( 250, 40, 100, 31);
		text4.frame=CGRectMake(370,40, 100, 31);
		reset1.frame=CGRectMake(204, 90, reset1.frame.size.width, reset1.frame.size.height);
		notifyCopyView.frame=CGRectMake(0, 0, 480, 32);
		[self setCustomKeyboardLandscape];
		sfondo.frame=CGRectMake(0, 0, 480, 300);
		infoLink.frame=CGRectMake(335, 265, infoLink.frame.size.width, infoLink.frame.size.height);
		devSite.frame=CGRectMake(devSite.frame.origin.x, devSite.frame.origin.y, 480,300);
		sitePage.frame=CGRectMake(sitePage.frame.origin.x, sitePage.frame.origin.y, devSite.frame.size.width, devSite.frame.size.height-44);
        [minus setImage:minus_plus_landscape forState:UIControlStateNormal];
		NSString *folderPath = [[NSBundle mainBundle] bundlePath];
		NSString *fName=@"iProportionLandscape.png";
		NSString *filePath = [folderPath stringByAppendingPathComponent:fName];	
		UIImage *img = [UIImage imageWithContentsOfFile: filePath];
		sfondo.image=img;
		
	}
	
	else 
	{
		
		
		//set portrait
		notifyCopyView.frame=CGRectMake(0, 0, 320, 79);
		[self setCustomKeyboardPortrait];
		text1.frame=CGRectMake( 5,92, 70, 31);
		text2.frame=CGRectMake( 85,92,70, 31);
		text3.frame=CGRectMake( 165, 92, 70, 31);
		text4.frame=CGRectMake(245,92, 70, 31);
		reset1.frame=CGRectMake(119, 173, reset1.frame.size.width, reset1.frame.size.height);
        sfondo.frame=CGRectMake(0, 0, 320, 460);
		devSite.frame=CGRectMake(devSite.frame.origin.x, devSite.frame.origin.y, 320, 460);
		infoLink.frame=CGRectMake(184, 419, infoLink.frame.size.width, infoLink.frame.size.height);
		sitePage.frame=CGRectMake(sitePage.frame.origin.x, sitePage.frame.origin.y, devSite.frame.size.width, devSite.frame.size.height-44);
		NSString *folderPath = [[NSBundle mainBundle] bundlePath];
		NSString *fName=@"iProportionBackground.png";
         [minus setImage:minus_plus_portrait forState:UIControlStateNormal];
		NSString *filePath = [folderPath stringByAppendingPathComponent:fName];	
		UIImage *img = [UIImage imageWithContentsOfFile: filePath];
		sfondo.image=img;
		
		
	}
		
	if( on)
	{
		propTextField *aTmp;
		for (int i=0; i<[globalArray count]; i++) {
			aTmp=[globalArray objectAtIndex:i];
			if(aTmp.editIcs==YES)
			{
				ics.center = CGPointMake((aTmp.frame.origin.x+(aTmp.frame.size.width/2)), aTmp.frame.origin.y+(aTmp.frame.size.height+10));
				break;
			}
		}
	}
	
	
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
	[text1 initWithCustomKeyboard:customKeyboard andId:1];
	[text2 initWithCustomKeyboard:customKeyboard andId:2];
	[text3 initWithCustomKeyboard:customKeyboard andId:3];
	[text4 initWithCustomKeyboard:customKeyboard andId:4];
    
	copiedToClip.enabled=NO;
	timCancel=[[NSTimer alloc] init];
	ics.hidden=YES;
	notifyCopyView.alpha=0;
	info.enabled=NO;
	info.alpha=0;
	on=NO;
    
    //Load image button delete Portrait
    
    NSString *folderPath = [[NSBundle mainBundle] bundlePath];
    NSString *fName=@"key_delete.png";
    NSString *filePath = [folderPath stringByAppendingPathComponent:fName];	
    self.deletePortrait=[UIImage imageWithContentsOfFile:filePath];
    //Load image button delete Landscape
  
    fName=@"key_delete_landscape.png";
    filePath = [folderPath stringByAppendingPathComponent:fName];	
    self.deleteLandscape=[UIImage imageWithContentsOfFile:filePath];
       
    fName=@"minus_plus_large.png";
    filePath = [folderPath stringByAppendingPathComponent:fName];	
    self.minus_plus_landscape = [UIImage imageWithContentsOfFile:filePath];
    
    fName=@"minus_plus_portrait.png";
    filePath = [folderPath stringByAppendingPathComponent:fName];	
    self.minus_plus_portrait= [UIImage imageWithContentsOfFile:filePath];
    
   
	sitePage.scalesPageToFit=YES;
	globalArray=[[NSArray alloc] initWithObjects:text1,text2,text3,text4,nil];
	[super viewDidLoad];
}




-(IBAction)nextText:(id)sender
{
	
	propTextField* pTmp= sender;
	
	pTmp.highlighted=NO;
	pTmp.selected=NO;
	[self selectNext:pTmp.identifier];
	
}
-(void)selectNext:(int)now
{	
	if(now==4)
	{
		now=0;
	}
	propTextField* pTmp2=[globalArray objectAtIndex:(now)];
	if(pTmp2.enabled)
	{
		pTmp2.highlighted=YES;
		pTmp2.selected=YES;
		[pTmp2 becomeFirstResponder];
		[self checkMinusAndPointInTextField:pTmp2];
	}
	else {
		[self selectNext:(now+1)];
	}
	
}
-(IBAction)touchInside:(id)sender
{	
	
	propTextField*pTmp =(propTextField*) sender;
	[self checkMinusAndPointInTextField:pTmp];
	[self showInfoButton];
	
}
-(void)showInfoButton
{
	if(info.alpha==0)
	{
		[UIView beginAnimations:@"FadeIn" context:nil];
		info.alpha=1;
		info.enabled=YES;
		[UIView commitAnimations];
	}
}
-(void)hideInfoButton
{
	if(info.alpha==1)
	{
		[UIView beginAnimations:@"FadeOut" context:nil];
		info.alpha=0;
		info.enabled=NO;
		[UIView commitAnimations];
	}
}
-(IBAction) valueChange:(id)sender
{
	[self control];	
}

-(void) control
{
	int counter=0;
	if(!on)
	{
		for (int i=0; i<[globalArray count]; i++) {
			propTextField *rTmp=[globalArray objectAtIndex:i];
			rTmp.editIcs=NO;
			if(rTmp.text != nil && ![rTmp.text isEqualToString:@""] )
			{
				counter++;
			}
			else {
				rTmp.editIcs=YES;
			}
		}
	}
	
	if(counter==3 || on)
	{
		propTextField *aTmp;
		for (int i=0; i<[globalArray count]; i++) {
			aTmp=[globalArray objectAtIndex:i];
			if(aTmp.editIcs==YES)
			{
				on=YES;
				copiedToClip.enabled=YES;
				aTmp.userInteractionEnabled=NO;
				aTmp.enabled=NO;
				ics.center = CGPointMake((aTmp.frame.origin.x+(aTmp.frame.size.width/2)), aTmp.frame.origin.y+(aTmp.frame.size.height+10));
				ics.hidden=NO;
				aTmp.text = [self calculate:i];
				break;
			}
		}
	}
}
-(NSString*)calculate:(int)editIcs
{
	NSNumber*result;
	for (int i=0; i<[globalArray count]; i++) {
		propTextField *pTmp=[globalArray objectAtIndex:i];
		if(pTmp.enabled)
		{
			if (pTmp.text.length>0) 
			{
				if(![[NSScanner scannerWithString:pTmp.text] scanFloat:NULL])
				{
					
					return @"Error";
				}
			}
			else {
				return @"";
				
			}
		}
		
		
	}
	switch (editIcs) {
		case 0:
			result=[[NSNumber alloc] initWithFloat:(([text2.text floatValue]*[text3.text floatValue])/[text4.text floatValue])];
			break;
		case 1:
			result=[[NSNumber alloc] initWithFloat:(([text1.text floatValue]*[text4.text floatValue])/[text3.text floatValue])];
			break;
		case 2:
			result=[[NSNumber alloc] initWithFloat:(([text1.text floatValue]*[text4.text floatValue])/[text2.text floatValue])];
			break;
		case 3:
			result=[[NSNumber alloc] initWithFloat:(([text2.text floatValue]*[text3.text floatValue])/[text1.text floatValue])];
			break;
	}
	
	
	
	
	
	return [result stringValue] ;
}
-(IBAction) reset
{
	for (int i=0; i<[globalArray count]; i++) {
		propTextField * pTmp=[globalArray objectAtIndex:i];
		pTmp.editIcs=NO;
		pTmp.userInteractionEnabled=YES;
		pTmp.enabled=YES;
		pTmp.text=@"";
	}
	copiedToClip.enabled=NO;
	ics.hidden=YES;
	on=NO;
	[text1 becomeFirstResponder];
	[self checkMinusAndPointInTextField:text1];
	[self showInfoButton];
}
-(IBAction) about
{
	for (int i=0; i<[globalArray count]; i++) {
		propTextField * pTmp=[globalArray objectAtIndex:i];
		[pTmp resignFirstResponder];
	}
	[self hideInfoButton];
	NSTimer *ts=[[NSTimer alloc]init];
	ts=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(presentDevSiteView) userInfo:nil repeats:NO];
}
-(void)dismissDevSiteView
{
	
	CGRect offScreenFrame = devSite.frame;
	offScreenFrame.origin.y=460;
	if(offScreenFrame.origin.y<self.view.frame.size.width)
	{
		offScreenFrame.origin.y=self.view.frame.size.width;
	}
	[UIView beginAnimations:@"FakeModalTransition" context:nil];
	[UIView setAnimationDuration:0.2f];
	devSite.frame = offScreenFrame;
	[UIView commitAnimations];	
}
-(void)presentDevSiteView
{
	CGRect onScreenFrame = devSite.frame;
	
	onScreenFrame.origin.y=0;
	[UIView beginAnimations:@"FakeModalTransition" context:nil];
	[UIView setAnimationDuration:0.2f];
	devSite.frame = onScreenFrame;
	[UIView commitAnimations];
	Reachability *r = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [r currentReachabilityStatus];
	if(internetStatus != NotReachable) {
		[sitePage loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.pierdr.com/iProportion/iProportion.html"]]];
		
	}
	else {
		@try {
			NSString *filePath = [[NSBundle mainBundle] pathForResource:@"iProportion" ofType:@"html"];  
			NSURLRequest *req=[[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:filePath]];	
			[sitePage loadRequest:req];  
			
		}
		@catch (NSException* ex) {
			
		}
		
		
	}
	
}
- (IBAction)tapOnKey:(id)sender {
	
	//detect which propTextField is in editing mode
	propTextField*pTmp;
	for (int i=0; i<[globalArray count]; i++) {
		pTmp=[globalArray objectAtIndex:i];
		if (pTmp.editing) {
			break;
		}
	}
	UIButton* bTmp=sender;
	NSString*strTmp=bTmp.titleLabel.text;
	if ([strTmp isEqualToString: @"del" ]) {
		[pTmp deleteOneCharacter];
		[timCancel invalidate];
		timCancel=[[NSTimer alloc]init];
		timCancel=[NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(deleteOneRepetition) userInfo:nil repeats:YES];		
	}
	else if([strTmp isEqualToString: @"<" ])
	{
		[pTmp moveCursorToLeft];
	}
	else if([strTmp isEqualToString: @">" ])
	{
		[pTmp moveCursorToRight];
	}
	else if([strTmp isEqualToString: @"Next" ])
	{
		[self nextText:pTmp];
	}
	else if([strTmp isEqualToString:@"."]){
		[pTmp addText:bTmp.titleLabel.text];
	}
	else if([strTmp isEqualToString:@"-"])
    {
        [pTmp changeSign];
    }
	if(![strTmp isEqualToString: @"Next" ])
	{
		[self checkMinusAndPointInTextField:pTmp];
	}
	
}
-(IBAction)touchBeganOnNumberKey:(id)sender{
   
    propTextField*pTmp;
	for (int i=0; i<[globalArray count]; i++) {
		pTmp=[globalArray objectAtIndex:i];
		if (pTmp.editing) {
			break;
		}
	}
    UIButton* bTmp=sender;
	[overlayKey showOnIndex:[bTmp.titleLabel.text intValue]];
   
}
-(IBAction)touchCancelOnNumberKey:(id)sender{
   
    overlayKey.hidden=YES;
}
-(IBAction)touchEndOnNumberKey:(id)sender{
 
	propTextField*pTmp;
	for (int i=0; i<[globalArray count]; i++) {
		pTmp=[globalArray objectAtIndex:i];
		if (pTmp.editing) {
			break;
		}
	}
    
    UIButton* bTmp=sender;
	overlayKey.hidden=YES;
    [pTmp addText:bTmp.titleLabel.text];
    [self checkMinusAndPointInTextField:pTmp];
    NSTimer* timCheckMINUS=[[NSTimer alloc] init];
    timCheckMINUS=[NSTimer timerWithTimeInterval:0.3 target:self selector:@selector(checkMinusAndPointInTextField:) userInfo:nil repeats:NO];
}
-(void)deleteOneRepetition{
	
	propTextField*pTmp;
	for (int i=0; i<[globalArray count]; i++) {
		pTmp=[globalArray objectAtIndex:i];
		if (pTmp.editing) {
			break;
		}
	}
	
	if(cancButton.highlighted)
	{
		[pTmp deleteOneCharacter];
		[timCancel invalidate];
		timCancel=[NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(deleteOneRepetition) userInfo:nil repeats:YES];		
	}
	else {
		[timCancel invalidate];
		timCancel = nil;
		timCancel=[[NSTimer alloc]init];
	}
	
	
}

-(void)checkMinusAndPointInTextField:(propTextField*)pTFTmp{
	NSString* strTmp=pTFTmp.text;
	
	NSRange pointRangeTmp=[strTmp rangeOfString:@"."];
	
	if (pointRangeTmp.length==0) {
		point.enabled=YES;
	}
	else {
		point.enabled=NO;
	}
	
	
}
-(IBAction)copyToClipboardX{
	UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
	propTextField *aTmp;
	NSString*strTmp;
	for (int i=0; i<[globalArray count]; i++) {
		aTmp=[globalArray objectAtIndex:i];
		if(aTmp.editIcs==YES)
		{
			strTmp=aTmp.text;
		}
	}
	pasteboard.string = strTmp;

	
	strTmp=[NSString stringWithFormat:@"Copied to clipboard: %@",strTmp];
    UILabel* lTmp=(UILabel*)notifyCopyView;
	[lTmp setText:strTmp];
	
	[self notifyCopy];
}

-(void)notifyCopy{
	
	[UIView beginAnimations:@"fakeNotification" context:nil];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:notifyCopyView cache:YES];
	
	
	notifyCopyView.alpha=1;
	[UIView commitAnimations];
	[timer invalidate];
	timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hideNotificationCopyView) userInfo:nil repeats:YES];
	
}
-(void)hideNotificationCopyView{
	[timer invalidate];
	timer = nil;
	timer=[[NSTimer alloc]init];
	[UIView beginAnimations:@"fakeNotification" context:nil];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationDelegate:self];
	notifyCopyView.alpha=0;
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:notifyCopyView cache:YES];
	[UIView commitAnimations];
	
}
-(void)setCustomKeyboardLandscape{
	//set customKeyboard LANDSCAPE
	
    overlayKey.isLandscape=YES;
	customKeyboard.frame=CGRectMake(customKeyboard.frame.origin.x, customKeyboard.frame.origin.y, 460, 225);
	
	for (UIView *subview in [customKeyboard subviews]) 
	{
		if (subview.tag==1) {
			subview.frame=CGRectMake(0, 55, 480, 170);
			int i=0;
			for (UIButton* button in [subview subviews]) {
				if(button.tag==2)
				{
					button.frame=CGRectMake(i*48, 6, 48, 48);
					i++;
                    continue;
				}
                
				if([button.titleLabel.text isEqualToString:@"Next"])
				{
					
					button.frame=CGRectMake(322, 118, 150, 48);
				}
				else if([button.titleLabel.text isEqualToString:@"del"])
				{
                    
                    [button setImage:deleteLandscape forState:UIControlStateNormal];
                    button.frame=CGRectMake(322, 66, 150, 48);
				}
				else if([button.titleLabel.text isEqualToString:@"Copy X"])
				{
					button.frame=CGRectMake(6, 118, 152, 48);
				}
				else if([button.titleLabel.text isEqualToString:@"<"]) {
					button.frame=CGRectMake(6, 66, 70, 48);
				}
				else if([button.titleLabel.text isEqualToString:@">"]) {
					button.frame=CGRectMake(88, 66, 70, 48);
				}
				else if([button.titleLabel.text isEqualToString:@"-"]) {
					button.frame=CGRectMake(180, 66, 120, 48);
				}
				else if([button.titleLabel.text isEqualToString:@"."]) {
					button.frame=CGRectMake(180, 118, 120, 48);
				}
			}
		}
        else if(subview.tag==3)//resetButton
        {
            subview.frame=CGRectMake(204, 15, subview.frame.size.width, subview.frame.size.height);
        }
	}
	info.frame=CGRectMake(420, 30, info.frame.size.width, info.frame.size.height);
	
}
-(void)setCustomKeyboardPortrait{
	//set customKeyboard PORTRAIT
	
	customKeyboard.frame=CGRectMake(customKeyboard.frame.origin.x, customKeyboard.frame.origin.y, 320, 297);
	overlayKey.isLandscape=NO;
	for (UIView *subview in [customKeyboard subviews]) 
	{
		if (subview.tag==1) {//keyContainer
			subview.frame=CGRectMake(0, 64, 320, 233);
			int i=0;
			for (UIButton* button in [subview subviews]) {
				if(button.tag==2)
				{
					button.frame=CGRectMake(i*32, 9, 32, 60);
					i++;
					continue;
				}
				
                
				if([button.titleLabel.text isEqualToString:@"Next"])
				{
					
					button.frame=CGRectMake(201, 167, 116, 60);
				}
				else if([button.titleLabel.text isEqualToString:@"del"])
				{
                    
                    [button setImage:deletePortrait forState:UIControlStateNormal];
					button.frame=CGRectMake(201, 102, 116, 60);
				}
				else if([button.titleLabel.text isEqualToString:@"Copy X"])
				{
					button.frame=CGRectMake(6, 167, 93, 59);
				}
				else if([button.titleLabel.text isEqualToString:@"<"]) {
					button.frame=CGRectMake(6, 102, 44, 59);
				}
				else if([button.titleLabel.text isEqualToString:@">"]) {
					button.frame=CGRectMake(53, 102, 44, 59);
				}
				else if([button.titleLabel.text isEqualToString:@"-"]) {
					button.frame=CGRectMake(117, 102, 72, 59);
				}
				else if([button.titleLabel.text isEqualToString:@"."]) {
					button.frame=CGRectMake(117, 165, 72, 59);
				}
				
				
			}
			
		}
        else if(subview.tag==3)//resetButton
        {
            subview.frame=CGRectMake(119, 10, subview.frame.size.width, subview.frame.size.height);
        }
	}
	info.frame=CGRectMake(282, 37, info.frame.size.width, info.frame.size.height);
}
@end
