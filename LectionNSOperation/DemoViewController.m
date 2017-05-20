//
//  ViewController.m
//  LectionNSOperation
//
//  Created by iOS-School-1 on 20.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "DemoViewController.h"
#import "Operation.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    Operation *operation0  = [Operation new];
    operation0.queuePriority = NSOperationQueuePriorityLow;
    operation0.name = @"operation0";
    [queue addOperation:operation0];
    
    Operation *operation1  = [Operation new];
    operation1.queuePriority = NSOperationQueuePriorityNormal;
    operation1.name = @"operation1";
    [queue addOperation:operation1];
    
    Operation *operation2  = [Operation new];
    operation2.queuePriority = NSOperationQueuePriorityLow;
    operation2.name = @"operation2";
    [queue addOperation:operation2];
    
    Operation *operation3  = [Operation new];
    operation3.queuePriority = NSOperationQueuePriorityHigh;
    operation3.name = @"operation3";
    [queue addOperation:operation3];
    
}

- (void)someMethod:(NSString *)str {
  //  NSLog(@"%@", [NSThread currentThread]);
    sleep(2);
    NSLog(@"%@",str);
}

@end
