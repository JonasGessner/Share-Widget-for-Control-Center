//
//  ShareWidgetforControlCenterSection.m
//  Share Widget for Control Center
//
//  Created by Jonas Gessner on 10.01.2014.
//  Copyright (c) 2014 Jonas Gessner. All rights reserved.
//

#import "ShareWidgetforControlCenterSection.h"
#import <Social/Social.h>

#import "SBControlCenterController.h"
#import <objc/runtime.h>

@interface ShareWidgetforControlCenterSection ()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) ShareWidgetforControlCenterSectionView *view;

@property (nonatomic, weak) UIViewController <CCSectionDelegate> *delegate;

@end

@implementation ShareWidgetforControlCenterSection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.bundle = [NSBundle bundleForClass:[self class]];
    }
    return self;
}

- (CGFloat)sectionHeight {
    return 45.0f;
}

- (void)loadView {
    self.view = [[ShareWidgetforControlCenterSectionView alloc] init];
    
    [self.view.facebookButton addTarget:self action:@selector(shareToFacebook) forControlEvents:UIControlEventTouchUpInside];
    [self.view.twitterButton addTarget:self action:@selector(shareToTwitter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view.twitterButton setImage:[UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"TwitterIcon" ofType:@"png"]] forState:UIControlStateNormal];
    [self.view.facebookButton setImage:[UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"FacebookIcon" ofType:@"png"]] forState:UIControlStateNormal];
}

- (void)shareToTwitter {
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [[objc_getClass("SBControlCenterController") sharedInstance] presentViewController:controller animated:NO completion:nil];
}

- (void)shareToFacebook {
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [[objc_getClass("SBControlCenterController") sharedInstance] presentViewController:controller animated:NO completion:nil];
}

- (UIView *)view {
    if (!_view) {
        [self loadView];
    }
    
    return _view;
}

- (void)dealloc {
    
}

- (void)controlCenterWillAppear {
    
}

- (void)controlCenterDidDisappear {
    
}

@end
