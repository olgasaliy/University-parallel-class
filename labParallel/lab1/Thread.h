//
//  Thread.h
//  labs
//
//  Created by Olha Salii on 13.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vector.h"

@class Thread;

@protocol ThreadDelegate <NSObject>

- (void)didFinishThread:(Thread *)thread;

@end

@interface Thread : NSThread

@property (nonatomic, weak) id <ThreadDelegate> delegate;

-(id)initWithVectorA:(Vector *)vectorA
             vectorB:(Vector *)vectorB
          startingAt:(NSInteger)startIndex
               endAt:(NSInteger)endIndex;
@end
