// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12
};

@interface CLNCoolViewCell ()
@property (assign, getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary<NSAttributedStringKey, id> *textAttributes;
@end

@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

+ (NSDictionary<NSAttributedStringKey, id> *)textAttributes {
    // TODO: Cache the instance.
    return @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
        NSForegroundColorAttributeName: UIColor.whiteColor
    };
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    [UIView animateWithDuration:duration
                     animations:^{
        [UIView setAnimationRepeatCount:3];
        [UIView setAnimationRepeatAutoreverses:YES];
        CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
        self.transform = CGAffineTransformRotate(translation, M_PI_2);
    }
                     completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
    }];
}


// MARK: - Drawing and resizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CGPointMake(CLNTextInsets.left, CLNTextInsets.top)
            withAttributes:self.class.textAttributes];
}

// MARK: - UIResponder methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, dx, dy);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
