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

@interface ShareWidgetforControlCenterSection () {
    SLComposeViewController *_controller;
}

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
    return 44.0f;
}

- (void)loadView {
    self.view = [[ShareWidgetforControlCenterSectionView alloc] init];
    
    [self.view.facebookButton addTarget:self action:@selector(shareToFacebook) forControlEvents:UIControlEventTouchUpInside];
    [self.view.twitterButton addTarget:self action:@selector(shareToTwitter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view.twitterButton setImage:[UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"TwitterIcon" ofType:@"png"]] forState:UIControlStateNormal];
    [self.view.facebookButton setImage:[UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"FacebookIcon" ofType:@"png"]] forState:UIControlStateNormal];
}

- (void)controlCenterDidDisappear {
    if (_controller.view.superview) {
        [_controller dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)shareToTwitter {
    _controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [[[objc_getClass("SBControlCenterController") sharedInstance] valueForKey:@"_viewController"] presentViewController:_controller animated:NO completion:nil];
}

- (void)shareToFacebook {
    _controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [[[objc_getClass("SBControlCenterController") sharedInstance] valueForKey:@"_viewController"] presentViewController:_controller animated:NO completion:nil];
}

- (UIView *)view {
    if (!_view) {
        [self loadView];
    }
    
    return _view;
}

@end
