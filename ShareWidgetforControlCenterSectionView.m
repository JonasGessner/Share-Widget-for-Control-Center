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
    
    UILabel *_unavailableLabel;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        BOOL facebook = [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
        BOOL twitter = [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
        
        
        if (facebook) {
            _facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
            [_facebookButton setTitleColor:[UIColor colorWithWhite:0.0f alpha:0.8f] forState:UIControlStateNormal];
            _facebookButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            UIGraphicsBeginImageContextWithOptions((CGSize){1.0f, 1.0f}, NO, 0.0f);
            
            [[UIColor colorWithWhite:0.0f alpha:0.15f] setFill];
            
            [[UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, {1.0f, 1.0f}}] fill];
            
            UIImage *highlighted = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            [_facebookButton setBackgroundImage:highlighted forState:UIControlStateHighlighted];
            
            [self addSubview:_facebookButton];
        }
        
        if (twitter) {
            _twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
            [_twitterButton setTitleColor:[UIColor colorWithWhite:0.0f alpha:0.8f] forState:UIControlStateNormal];
            _twitterButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            UIGraphicsBeginImageContextWithOptions((CGSize){1.0f, 1.0f}, NO, 0.0f);
            
            [[UIColor colorWithWhite:0.0f alpha:0.15f] setFill];
            
            [[UIBezierPath bezierPathWithRect:(CGRect){CGPointZero, {1.0f, 1.0f}}] fill];
            
            UIImage *highlighted = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            [_twitterButton setBackgroundImage:highlighted forState:UIControlStateHighlighted];
            
            [self addSubview:_twitterButton];
        }
        
        if (facebook && twitter) {
            _separator = [[UIView alloc] init];
            _separator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
            
            [self addSubview:_separator];
        }
        else if (!facebook && !twitter) {
            _unavailableLabel = [[UILabel alloc] init];
            _unavailableLabel.textColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
            _unavailableLabel.backgroundColor = [UIColor clearColor];
            _unavailableLabel.font = [UIFont systemFontOfSize:14.0f];
            _unavailableLabel.textAlignment = NSTextAlignmentCenter;
            _unavailableLabel.text = @"Facebook or Twitter not set up";
            
            [self addSubview:_unavailableLabel];
        }
        //Load additional views
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat separatorWidth = 1.5f;
    
    if (_facebookButton && _twitterButton) {
        CGRect frame = self.bounds;
        frame.size.width -= separatorWidth;
        
        frame.size.width /= 2.0f;
        
        _facebookButton.frame = frame;
        
        
        frame.origin.x += frame.size.width;
        
        
        CGRect separatorFrame = frame;
        
        separatorFrame.size.width = separatorWidth;
        
        _separator.frame = separatorFrame;
        
        
        frame.origin.x += separatorWidth;
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
    else {
        [_unavailableLabel sizeToFit];
        _unavailableLabel.center = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
    }
}

@end
