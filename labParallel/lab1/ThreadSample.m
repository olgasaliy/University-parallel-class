//
//  ThreadSample.m
//  labs
//
//  Created by Olha Salii on 14.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import "ThreadSample.h"
#import "Vector.h"

@interface ThreadSample ()

@property NSUInteger parallelResult;

@end

@implementation ThreadSample

- (void)doWork {
    Vector *v1 = [[Vector alloc] initWithCapacity:VECTOR_SIZE];
    Vector *v2 = [[Vector alloc] initWithCapacity:VECTOR_SIZE];
    
    NSUInteger serialResult = [v1 multiplyWithVector:v2];
    
    NSLog(@"Fisrt result: %lu", serialResult);
    
    NSMutableSet *threads = [[NSMutableSet alloc] init];
    for (NSInteger i = 0; i < NUMBER_THREADS; i++) {
        Thread *thread = [[Thread alloc] initWithVectorA:v1
                                                 vectorB:v2
                                              startingAt:VECTOR_SIZE/NUMBER_THREADS * i
                                                   endAt:i == NUMBER_THREADS-1 ? VECTOR_SIZE : VECTOR_SIZE/NUMBER_THREADS * (i + 1)];
        [threads addObject:thread];
        [thread start];
    }
    
    for (Thread *t in threads) {

    }
    
    
}

-(void)didFinishThread:(Thread *)thread {
    
}

@end
