//
//  ViewController.m
//  Example
//
//  Created by Poonia on 18/09/15.
//  Copyright (c) 2015 Babulal Poonia. All rights reserved.
//

#import "ViewController.h"
#import "BLImageView.h"

@interface ViewController ()<BLImageViewDelegate>

@property (weak, nonatomic) IBOutlet BLImageView *imageView1;
@property (strong, nonatomic) BLImageView *imageView2;
@property (strong, nonatomic) BLImageView *imageView3;
@property (strong, nonatomic) BLImageView *imageView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // dynamicHeight is set to YES, so text will take sufficient height for itself.
    
    _imageView1.dynamicHeight = YES;
    _imageView1.overLabel.text = @"Jennifer Lawrence";
    
    
    // Only textHeightLimit is set to 0.4, so text will take 0.4*ImageHeight
    
    _imageView2 = [[BLImageView alloc] initWithFrame:CGRectMake(10.0, CGRectGetMaxY(_imageView1.frame)+10.0, CGRectGetWidth(_imageView1.frame), CGRectGetHeight(_imageView1.frame))];
    _imageView2.image = [UIImage imageNamed:@"sample_jennifer_lawrence"];
    _imageView2.overLabel.text = @"Jennifer Lawrence stars in The Hunger Games: Mockingjay Part 2";
    _imageView2.textHeightLimit = 0.4;
    [self.view addSubview:_imageView2];
    
    
    // Default properties will be applied
    
    _imageView3 = [[BLImageView alloc] initWithFrame:CGRectMake(10.0, CGRectGetMaxY(_imageView2.frame)+10.0, CGRectGetWidth(_imageView2.frame), CGRectGetHeight(_imageView2.frame))];
    _imageView3.image = [UIImage imageNamed:@"sample_jennifer_lawrence"];
    _imageView3.overLabel.text = @"Jennifer Lawrence looks ready for battle as Katniss in new poster for The Hunger Games: Mockingjay Part 2";
    [self.view addSubview:_imageView3];
    
    
    // dynamicHeight is set to YES, so text will take sufficient height for itself.
    
    _imageView4 = [[BLImageView alloc] initWithFrame:CGRectMake(10.0, CGRectGetMaxY(_imageView3.frame)+10.0, CGRectGetWidth(_imageView3.frame), CGRectGetHeight(_imageView3.frame))];
    _imageView4.image = [UIImage imageNamed:@"sample_jennifer_lawrence"];
    _imageView4.overLabel.text = @"Jennifer Lawrence looks ready for battle as Katniss in new poster for The Hunger Games: Mockingjay Part 2";
    _imageView4.dynamicHeight = YES;
    [self.view addSubview:_imageView4];
    
    _imageView4.delegate = self;
}

#pragma mark - Image Click Action
- (void)blImageViewClickAction:(id)sender {
    NSLog(@"Yay, Image is clicked!");
}

@end
