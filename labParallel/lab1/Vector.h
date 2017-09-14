//
//  Vector.h
//  labs
//
//  Created by Olha Salii on 14.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector : NSObject

- (id)initWithCapacity:(NSInteger)count;
- (NSNumber *)getObjectAtIndex:(NSInteger)index;
- (NSUInteger)multiplyWithVector:(Vector *)vector;

@end
