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
@property (nonatomic) NSMutableDictionary *threadsFinished;
@property NSMutableSet *threads;

@end

@implementation ThreadSample

- (void)doWork {
    Vector *v1 = [[Vector alloc] initWithCapacity:VECTOR_SIZE];
    Vector *v2 = [[Vector alloc] initWithCapacity:VECTOR_SIZE];
    
    NSUInteger serialResult = [v1 multiplyWithVector:v2];
    
    NSLog(@"First result: %lu", serialResult);
    
    self.threadsFinished = [[NSMutableDictionary alloc] init];
    self.threads = [[NSMutableSet alloc] init];
    for (NSInteger i = 0; i < NUMBER_THREADS; i++) {
        Thread *thread = [[Thread alloc] initWithVectorA:v1
                                                 vectorB:v2
                                              startingAt:VECTOR_SIZE/NUMBER_THREADS * i
                                                   endAt:i == NUMBER_THREADS-1 ? VECTOR_SIZE : VECTOR_SIZE/NUMBER_THREADS * (i + 1)];
        thread.delegate = self;
        [self.threads addObject:thread];
        [self.threadsFinished setValue:@"false" forKey:thread.description];
        [thread start];
    }
    
}

- (void)joinAllThreads {
    for (Thread *t in self.threads) {
        self.parallelResult += [t getResult];
    }
    NSLog(@"Second result: %lu", self.parallelResult);
    
    
}

- (void)didFinishThread:(Thread *)thread {
    [self.threadsFinished setValue:@"true" forKey:thread.description];
    if (![self.threadsFinished.allKeys containsObject:@"false"]) {
        [self joinAllThreads];
    }
}

@end
