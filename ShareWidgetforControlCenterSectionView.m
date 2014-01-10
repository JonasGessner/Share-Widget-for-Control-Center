//
//  ShareWidgetforControlCenterSectionView.m
//  Share Widget for Control Center
//
//  Created by Jonas Gessner on 10.01.2014.
//  Copyright (c) 2014 Jonas Gessner. All rights reserved.
//

#import "ShareWidgetforControlCenterSectionView.h"
#import <Social/Social.h>

@implementation ShareWidgetforControlCenterSectionView {
    UIView *_separator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        BOOL facebook = [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
        BOOL twitter = [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
        
        
        if (facebook) {
            _facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
            [_facebookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _facebookButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            UIGraphicsBeginImageContextWithOptions((CGSize){1.0f, 1.0f}, NO, 0.0f);
            
            [[UIColor colorWithWhite:0.0f alpha:0.2f] setFill];
            
            [[UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, {1.0f, 1.0f}}] fill];
            
            UIImage *highlighted = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            [_facebookButton setBackgroundImage:highlighted forState:UIControlStateHighlighted];
            
            [self addSubview:_facebookButton];
        }
        
        if (twitter) {
            _twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
            [_twitterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _twitterButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            UIGraphicsBeginImageContextWithOptions((CGSize){1.0f, 1.0f}, NO, 0.0f);
            
            [[UIColor colorWithWhite:0.0f alpha:0.2f] setFill];
            
            [[UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, {1.0f, 1.0f}}] fill];
            
            UIImage *highlighted = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            [_twitterButton setBackgroundImage:highlighted forState:UIControlStateHighlighted];
            
            [self addSubview:_twitterButton];
        }
        
        if (facebook && twitter) {
            _separator = [[UIView alloc] init];
            _separator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
            
            [self addSubview:_separator];
        }
        //Load additional views
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_facebookButton && _twitterButton) {
        CGRect frame = self.bounds;
        frame.size.width -= 2.0f;
        
        frame.size.width /= 2.0f;
        
        _facebookButton.frame = frame;
        
        
        frame.origin.x += frame.size.width;
        
        
        CGRect separatorFrame = frame;
        
        separatorFrame.size.width = 2.0f;
        
        _separator.frame = separatorFrame;
        
        
        frame.origin.x += 2.0f;
        _twitterButton.frame = frame;
    }
    else if (_facebookButton) {
        CGRect frame = self.bounds;
        _facebookButton.frame = frame;
    }
    else if (_twitterButton) {
        CGRect frame = self.bounds;
        _twitterButton.frame = frame;
    }
}

@end
