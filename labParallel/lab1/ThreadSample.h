//
//  ThreadSample.h
//  labs
//
//  Created by Olha Salii on 14.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Thread.h"

#define VECTOR_SIZE        		1000
#define NUMBER_THREADS       	7

@interface ThreadSample : NSObject <ThreadDelegate>

- (void)doWork;

@end
