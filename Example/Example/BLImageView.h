//
//  BLImageView.h
//
//  Created by Babulal Poonia on 18/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BLImageViewDelegate;

@interface BLImageView : UIImageView

// Background view for the text, you can customize backgroundColor.
@property (nonatomic, strong) UIView *overView;

// Label for the text, you can customize UILabel properties textColor, font etc.
@property (nonatomic, strong) UILabel *overLabel;

// If set to YES, text height will grow as the text increases. Maximum it will grow upto imageView's height.
// Default value is NO.
@property (nonatomic) BOOL dynamicHeight;

// Limit for maximum height of text.
// floating point number in the range [0,1] , Default value is 0.5
// Ignored if dynamicHeight is set to YES.
@property (nonatomic) CGFloat textHeightLimit;

// BLImageViewDelegate for Click Action
// Make sure imageView userInteractionEnabled is set to YES.
@property (nonatomic, weak) id<BLImageViewDelegate> delegate;

@end

// BLImageViewDelegate
@protocol BLImageViewDelegate <NSObject>

@optional
- (void) blImageViewClickAction:(id)sender;

@end
