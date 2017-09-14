//
//  main.m
//  labParallel
//
//  Created by Olha Salii on 14.09.17.
//  Copyright © 2017 Olha Salii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreadSample.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ThreadSample *sample = [[ThreadSample alloc] init];
        [sample doWork];
    }
    return 0;
}
