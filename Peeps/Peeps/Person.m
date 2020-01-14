// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import "Dog.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName {
    return [self initWithFirstName:firstName
                          lastName:lastName
                               age:0];
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSInteger)age {
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName
                                age:(NSInteger)age {
    return [[self alloc] initWithFirstName:firstName lastName:lastName age:age];
}

- (id)copyWithZone:(NSZone *)zone {
    Person *copyOfPerson = [[Person allocWithZone:zone] init];
    copyOfPerson->_dog = _dog;
    copyOfPerson->_firstName = [_firstName copy];
    copyOfPerson->_lastName = [_lastName copy];
    copyOfPerson->_age = _age;
    return copyOfPerson;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    
    return [[self dog] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([[self dog] respondsToSelector: aSelector]) {
        return [self dog];
    }
    
    return nil;
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}


- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (Dog *)dog {
    return _dog;
}
- (void)setDog:(Dog *)newValue {
    _dog = newValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, age: %@", [self fullName], @([self age])];
}

@end
