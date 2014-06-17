//
//  propOverlayKey.h
//  iProportion-MOBILE
//
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface propOverlayKey : UIView {
	UIImageView* overlayImg;
	UILabel* overlayTxt;
	BOOL isLandscape;
}
@property(nonatomic)BOOL isLandscape;
@property(nonatomic,retain)IBOutlet UIImageView* overlayImg;
@property(nonatomic,retain)IBOutlet UILabel*overlayTxt;

-(void)showOnIndex:(int)index;
@end
