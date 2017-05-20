//
//  Operation.m
//  LectionNSOperation
//
//  Created by iOS-School-1 on 20.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "Operation.h"

@implementation Operation

- (void)start{
    
    [self main];
    
}

- (void)main {
    
    //work
    NSLog(@"op%@", [NSThread currentThread]);
    
    if (!self.isCancelled) {
        return;
    }
    
    //work
}

@end
