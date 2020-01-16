// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolController

- (void)stopAnimations {
    for (UIView *cell in self.view.subviews) {
        [UIView animateWithDuration:1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [self stopAnimations];
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.systemGreenColor;
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
    
    subview1.text = @"Hello World! 🌍🌏🌎🪐";
    subview2.text = @"Cool View Cells Rawk! 🎉🍾🥂";
    
    [self.view addSubview:subview1];
    [self.view addSubview:subview2];
    
    subview1.backgroundColor = UIColor.systemPurpleColor;
    subview2.backgroundColor = UIColor.systemOrangeColor;
}

@end
