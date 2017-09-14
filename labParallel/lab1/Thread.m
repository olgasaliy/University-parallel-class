//
//  Thread.m
//  labs
//
//  Created by Olha Salii on 13.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import "Thread.h"

@interface Thread ()
#pragma mark Properties

@property (nonatomic) Vector *vectorA;
@property (nonatomic) Vector *vectorB;
@property (nonatomic) NSInteger startIndex;
@property (nonatomic) NSInteger endIndex;
@property (nonatomic) NSUInteger result;

@end

@implementation Thread

- (id)initWithVectorA:(Vector *)vectorA
              vectorB:(Vector *)vectorB
           startingAt:(NSInteger)startIndex
                endAt:(NSInteger)endIndex {
    self = [super init];
    if (self) {
        _vectorA = vectorA;
        _vectorB = vectorB;
        _startIndex = startIndex;
        _endIndex = endIndex;
        [self addObserver:self forKeyPath:@"isFinished" options: 0 context: nil];
    }
    return self;
}

- (void)main {
    for (NSInteger i = self.startIndex; i < self.endIndex; i++) {
        self.result += [self.vectorA getObjectAtIndex:i].integerValue * [self.vectorB getObjectAtIndex:i].integerValue;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"isFinished"]) {
        //delegate
    }
}

@end
