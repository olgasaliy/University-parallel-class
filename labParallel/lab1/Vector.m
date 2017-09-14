//
//  Vector.m
//  labs
//
//  Created by Olha Salii on 14.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import "Vector.h"
#include <stdlib.h>

@interface Vector ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation Vector

- (id)initWithCapacity:(NSInteger)count {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        [self generateRandomNumbers:count];
    }
    return self;
}

- (void)generateRandomNumbers:(NSInteger)count {
    for (NSInteger i = 0; i < count; i++) {
        int n = arc4random() % 1000;
        [self.array addObject: [NSNumber numberWithInteger: n]];
    }
}

- (NSNumber *)getObjectAtIndex:(NSInteger)index {
    return [self.array objectAtIndex:index];
}

- (NSUInteger)multiplyWithVector:(Vector *)vector {
    NSUInteger result = 0;
    for (NSInteger i = 0; i < self.array.count; i++) {
        result += [self getObjectAtIndex:i].integerValue * [vector getObjectAtIndex:i].integerValue;
    }
    return result;
}

@end
