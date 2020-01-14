// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"
                                           age:42];
//    [fred setFirstName:@"Fred"];
//    [fred setLastName:@"Smith"];
//    [fred setAge:42];
    
    Dog *rover = [[Dog alloc] init];
    [fred setDog:rover];
    
    if ([fred respondsToSelector:@selector(bark)]) {
        [(id)fred bark];
    }
    
    NSLog(@"%@", fred);
    
    Person *fredsClone = [fred copy];
    NSLog(@"%@", fredsClone);
    
//    NSLog(@"%@", [fred performSelector:@selector(fullName)]);
}
