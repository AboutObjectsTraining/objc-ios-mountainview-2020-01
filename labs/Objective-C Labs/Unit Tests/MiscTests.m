// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"

@interface MiscTests : XCTestCase
@end

@implementation MiscTests

- (void)setUp { putchar('\n'); }
- (void)tearDown { putchar('\n'); };

- (void)testCopyingBehavior {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:32];
    [fred setRating:4];
    
    Person *copyOfFred = nil;
    if ([fred conformsToProtocol:@protocol(NSCopying)]) {
        copyOfFred = [fred copy];
    }
    
    NSLog(@"%@", fred);
    NSLog(@"%@", copyOfFred);
}

- (void)testInitialization {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    s1 = [s1 initWithFormat:@"Hello %@", @"World!"];
    s2 = [s2 initWithFormat:@"Goodbye %@", @"World!"];
//    NSString *s3 = [[NSString alloc] initWithString:@"Hello"];
//    NSString *s4 = [[NSString alloc] initWithString:@"Hello"];
    NSLog(@"%@", s1);
}

@end
