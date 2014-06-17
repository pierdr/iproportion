//
//  iProportion_MOBILEViewController.h
//  iProportion-MOBILE
//
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.
//
#import "propTextField.h"
#import <UIKit/UIKit.h>
#import "propOverlayKey.h"
#import "Reachability.h"

@interface iProportion_MOBILEViewController : UIViewController {
	propTextField* text1;
	propTextField* text2;
	propTextField* text3;
	propTextField* text4;
	NSArray* globalArray;
	UIImageView* sfondo;
	UILabel* ics;
	UIButton* reset1;
	UIButton* info;
	BOOL on;
	UIButton* infoLink;
	UIView* devSite;
	UIWebView* sitePage;
	
	propOverlayKey* overlayKey;
	
	UIView* customKeyboard;
	UIButton* point;
	UIButton* minus;
	UIButton* copiedToClip;
	UIButton*cancButton;

	UIView* notifyCopyView;
	
	NSTimer*timer;
	NSTimer*timCancel;
    UIImage* deleteLandscape;
    UIImage* deletePortrait;
    UIImage* minus_plus_portrait;
    UIImage* minus_plus_landscape;
}
@property(nonatomic,retain)UIImage* minus_plus_portrait;
@property(nonatomic,retain)UIImage* minus_plus_landscape;
@property(nonatomic,retain)UIImage* deleteLandscape;
@property(nonatomic,retain)UIImage* deletePortrait;
@property(nonatomic,retain)IBOutlet UIButton*cancButton;
@property(nonatomic,retain)NSTimer*timCancel;
@property(nonatomic,retain)NSTimer*timer;
@property(nonatomic,retain)IBOutlet UIView*notifyCopyView;
@property(nonatomic,retain)IBOutlet UIButton* copiedToClip;
@property(nonatomic,retain)IBOutlet UIButton*point;
@property(nonatomic,retain)IBOutlet UIButton*minus;
@property(nonatomic,retain)IBOutlet propOverlayKey* overlayKey;
@property(nonatomic,retain)IBOutlet UIView* customKeyboard;
@property(nonatomic,retain)IBOutlet UIWebView*sitePage;
@property(nonatomic,retain)IBOutlet UIView* devSite;
@property(nonatomic, retain)IBOutlet UIButton* infoLink;
@property(nonatomic,retain) NSArray* globalArray;
@property(nonatomic,retain)IBOutlet UILabel*ics;
@property(nonatomic)BOOL on;
@property(nonatomic,retain)IBOutlet UIButton *reset1;
@property(nonatomic,retain)IBOutlet UIButton *info;
@property(nonatomic,retain) IBOutlet UIImageView *sfondo;
@property (nonatomic, retain) IBOutlet propTextField* text1;
@property (nonatomic, retain) IBOutlet propTextField* text2;
@property (nonatomic, retain) IBOutlet propTextField* text3;
@property (nonatomic, retain) IBOutlet propTextField* text4;

-(void) control;
-(void)selectNext:(int)now;
-(NSString*)calculate:(int)editIcs;
-(IBAction) valueChange:(id)sender;
-(IBAction) nextText:(id)sender;
-(IBAction) touchInside:(id)sender;
-(IBAction) reset;
-(IBAction) about;
-(IBAction)dismissDevSiteView;
-(IBAction)presentDevSiteView;
-(void)showInfoButton;
-(void)hideInfoButton;
-(IBAction)tapOnKey:(id)sender;
-(IBAction)touchBeganOnNumberKey:(id)sender;
-(IBAction)touchCancelOnNumberKey:(id)sender;
-(IBAction)touchEndOnNumberKey:(id)sender;
-(void)checkMinusAndPointInTextField:(UITextField*)pTFTmp;
-(IBAction)copyToClipboardX;
-(void)notifyCopy;
-(void)deleteOneRepetition;
-(void)setCustomKeyboardLandscape;
-(void)setCustomKeyboardPortrait;


@end

