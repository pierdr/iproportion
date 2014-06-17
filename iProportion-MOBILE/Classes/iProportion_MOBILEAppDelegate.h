//
//  iProportion_MOBILEAppDelegate.h
//  iProportion-MOBILE
//
//
//  Created by Pierluigi Dalla Rosa on 17/09/10.
//  Copyright pierdr.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iProportion_MOBILEViewController;

@interface iProportion_MOBILEAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iProportion_MOBILEViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iProportion_MOBILEViewController *viewController;

@end

