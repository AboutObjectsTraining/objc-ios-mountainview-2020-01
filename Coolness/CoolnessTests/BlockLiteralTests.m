// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

//void *myFunctionPointer(void);

void sayHello(void) {
    printf("Hello!\n");
}
@interface BlockLiteralTests : XCTestCase

@end

void indirectlySayHello(void (^block)(void)) {
    block();
}

@implementation BlockLiteralTests

- (void)testFunctionPointer {
    void (*myFunctionPointer)(void) = sayHello;
    
//    sayHello();
    myFunctionPointer();
}

- (void)testBlockLiteral {
    void (^myBlockLiteral)(void);
    
    myBlockLiteral = ^{
        printf("Hello!\n");
    };
    
    myBlockLiteral();
}

- (void)testIndirectCall {
    const char *name = "Fred";
    
    void (^myBlock)(void) = ^{
        printf("Hello %s!\n", name);
    };
    
    indirectlySayHello(myBlock);
    
    void (^foo)(void) = [myBlock copy];
    foo();
}

@end
