//
//  Person.m
//  KVO
//
//  Created by Run on 2024/3/14.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name {
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}

@end
