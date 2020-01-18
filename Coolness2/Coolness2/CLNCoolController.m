// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(NSMutableArray) NSMutableArray *cells;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CLNCoolController

- (NSMutableArray *)cells {
    if (_cells == nil) {
        _cells = [NSMutableArray array];
    }
    return _cells;
}

- (IBAction)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.cells addObject:newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
    [self.contentView addSubview:newCell];
}

- (void)stopAnimations {
    for (UIView *cell in self.cells) {
        [UIView animateWithDuration:1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [self stopAnimations];
}

@end
