//
//  BLImageView.m
//
//  Created by Babulal Poonia on 18/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "BLImageView.h"

#define LABEL_MARGIN 5.0
#define DEFAULT_TEXTHEIGHT_LIMIT 0.5
#define DEFAULT_BACKGROUND_COLOR [UIColor colorWithWhite:0.3 alpha:0.7]

@interface BLImageView()

@property (nonatomic, strong) UIButton *overButton;

@end

@implementation BLImageView

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initialSetup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialSetup];
}

#pragma mark - initialSetup

- (void)initialSetup {
    
    self.textHeightLimit = DEFAULT_TEXTHEIGHT_LIMIT;
    self.clipsToBounds = YES;
    
    self.overView = [[UIView alloc] init];
    self.overView.backgroundColor = DEFAULT_BACKGROUND_COLOR;
    self.overView.clipsToBounds = YES;
    [self addSubview:self.overView];
    
    self.overLabel = [[UILabel alloc] init];
    self.overLabel.numberOfLines = 0;
    self.overLabel.textColor = [UIColor whiteColor];
    [self.overView addSubview:self.overLabel];
    
    self.overButton = [[UIButton alloc] initWithFrame:self.bounds];
    self.overButton.backgroundColor = [UIColor clearColor];
    [self.overButton addTarget:self action:@selector(blImageViewClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.overButton];
}

#pragma mark - Layout

- (void)layoutSubviews {
    self.overView.frame = CGRectMake(0, self.bounds.size.height - [self expectedTextHeight], self.bounds.size.width, [self expectedTextHeight]);
    self.overLabel.frame = CGRectMake(LABEL_MARGIN, 0, self.overView.bounds.size.width - 2*LABEL_MARGIN, self.overView.bounds.size.height);
    self.overButton.frame = self.bounds;
    [self bringSubviewToFront:self.overButton];
}

#pragma mark -

- (CGFloat)expectedTextHeight {
    if(!self.overLabel.text.length){
        return 0.0;
    }
    if(!self.dynamicHeight){
        return self.bounds.size.height * self.textHeightLimit;
    }
    CGFloat labelWidth = self.bounds.size.width - 2*LABEL_MARGIN;
    CGRect expectedRect = [self.overLabel.text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.overLabel.font} context:nil];
    return MIN(expectedRect.size.height + 2*LABEL_MARGIN, self.bounds.size.height);
}

#pragma mark - setter method
- (void)setDelegate:(id<BLImageViewDelegate>)delegate {
    if(delegate){
        _delegate = delegate;
        self.userInteractionEnabled = YES;
    }
}

#pragma mark - blImageViewClickAction

- (void)blImageViewClickAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(blImageViewClickAction:)]) {
        [self.delegate blImageViewClickAction:sender];
    }
}

#pragma mark - Dealloc

- (void)dealloc {
    self.overView = nil;
    self.overLabel = nil;
    self.overButton = nil;
}

@end
